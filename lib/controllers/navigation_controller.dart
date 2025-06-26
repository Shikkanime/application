import 'dart:async';

import 'package:application/components/member_image.dart';
import 'package:application/components/pill.dart';
import 'package:application/controllers/animes/anime_controller.dart';
import 'package:application/controllers/animes/anime_weekly_controller.dart';
import 'package:application/controllers/animes/followed_anime_controller.dart';
import 'package:application/controllers/animes/missed_anime_controller.dart';
import 'package:application/controllers/episodes/episode_controller.dart';
import 'package:application/controllers/episodes/followed_episode_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/simulcast_controller.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:application/dtos/missed_anime_dto.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/constant.dart';
import 'package:application/utils/extensions.dart';
import 'package:application/views/account_settings_view.dart';
import 'package:application/views/search_view.dart';
import 'package:flutter/material.dart';

enum NavigationSource { bottomNavigationBar, drawer, pageView, appBar }

class NavigationController {
  static final NavigationController instance = NavigationController();
  final PageController pageController = PageController();
  int _currentIndex = 0;
  final StreamController<int> streamController =
      StreamController<int>.broadcast();
  bool _isPageViewChanging = false;
  final List<int> _initializedPages = <int>[0];

  int get currentIndex => _currentIndex;

  Future<void> _loadIndexData() async {
    switch (_currentIndex) {
      case 0:
        await Future.wait(<Future<void>>[
          MissedAnimeController.instance.goToTop(),
          EpisodeController.instance.goToTop(),
        ]);
      case 1:
        await SimulcastController.instance.goToTop().then(
          (final _) => AnimeController.instance.goToTop(),
        );
      case 2:
        await AnimeWeeklyController.instance.goToTop();
      case 3:
        await Future.wait(<Future<void>>[
          FollowedAnimeController.instance.goToTop(),
          FollowedEpisodeController.instance.goToTop(),
        ]);
    }
  }

  void setIndex(final int index, final NavigationSource source) {
    if (_isPageViewChanging) {
      return;
    }

    _isPageViewChanging = true;

    debugPrint(
      'Setting index to $index - Current index: $_currentIndex ($source)',
    );

    if (index == _currentIndex && source != NavigationSource.pageView) {
      _loadIndexData();
      _isPageViewChanging = false;
      return;
    }

    _currentIndex = index;

    if (!_initializedPages.contains(index)) {
      _initializedPages.add(index);
      _loadIndexData();
    }

    if (source != NavigationSource.pageView) {
      pageController.jumpToPage(index);
    }

    streamController.add(index);

    final List<String> screenNames = <String>[
      'home',
      'catalog',
      'calendar',
      'account',
    ];

    Analytics.instance.logScreenView(screenNames[index]);

    _isPageViewChanging = false;
  }

  List<NavigationItem> getMainNavigationItems(
    final BuildContext context,
  ) => <NavigationItem>[
    NavigationItem(
      icon: StreamBuilder<List<MissedAnimeDto>>(
        stream: MissedAnimeController.instance.streamController.stream,
        initialData: MissedAnimeController.instance.items,
        builder:
            (
              final BuildContext context,
              final AsyncSnapshot<List<MissedAnimeDto>> snapshot,
            ) {
              final Icon icon = Icon(
                _currentIndex == 0 ? Icons.home : Icons.home_outlined,
              );

              if (snapshot.data!.isEmpty) {
                return icon;
              }

              final int totalEpisodeMissed = snapshot.data!
                  .map((final MissedAnimeDto e) => e.episodeMissed)
                  .reduce((final int a, final int b) => a + b);

              return Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
                    child: icon,
                  ),
                  if (snapshot.data!.isNotEmpty)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Pill(
                        text: totalEpisodeMissed >= 10
                            ? '9+'
                            : totalEpisodeMissed.toString(),
                      ),
                    ),
                ],
              );
            },
      ),
      title: AppLocalizations.of(context)!.home,
    ),
    NavigationItem(
      icon: const Icon(Icons.video_collection),
      nonActiveIcon: const Icon(Icons.video_collection_outlined),
      title: AppLocalizations.of(context)!.catalog,
    ),
    NavigationItem(
      icon: const Icon(Icons.calendar_today),
      nonActiveIcon: const Icon(Icons.calendar_today_outlined),
      title: AppLocalizations.of(context)!.calendar,
    ),
    NavigationItem(
      icon: StreamBuilder<MemberDto>(
        stream: MemberController.instance.streamController.stream,
        initialData: MemberController.instance.member,
        builder:
            (
              final BuildContext context,
              final AsyncSnapshot<MemberDto> snapshot,
            ) {
              final MemberImage memberImage = MemberImage(
                member: snapshot.data,
                width: 32,
                height: 32,
                hasBorder: _currentIndex == 3,
              );

              return snapshot.data?.email != null
                  ? memberImage
                  : Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 12,
                            right: 8,
                            top: 8,
                          ),
                          child: memberImage,
                        ),
                        const Positioned(
                          top: 0,
                          right: 0,
                          child: Pill(text: '!'),
                        ),
                      ],
                    );
            },
      ),
      title: AppLocalizations.of(context)!.myAccount,
    ),
  ];

  List<BottomNavigationBarItem> getBottomNavigationBarItems(
    final BuildContext context,
  ) => getMainNavigationItems(context)
      .map(
        (final NavigationItem e) => BottomNavigationBarItem(
          icon: e.nonActiveIcon ?? e.icon,
          activeIcon: e.icon,
          label: e.title,
        ),
      )
      .toList();

  List<SubNavigationItem> _getSubNavigationItems(final BuildContext context) =>
      <SubNavigationItem>[
        SubNavigationItem(
          title: AppLocalizations.of(context)!.search,
          isActive: true,
          child: const Icon(Icons.search),
          onTap: () async {
            await Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (final BuildContext context) => const SearchView(),
              ),
            );
          },
        ),
        SubNavigationItem(
          title: AppLocalizations.of(context)!.settings,
          isActive: _currentIndex == 3 || !Constant.isAndroidOrIOS,
          child: const Icon(Icons.settings),
          onTap: () async {
            await Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (final BuildContext context) =>
                    const AccountSettingsView(),
              ),
            );
          },
        ),
      ];

  List<Widget> getDrawerItems(final BuildContext context) => <Widget>[
    ...getMainNavigationItems(context).mapIndexed<Widget>(
      (final int index, final NavigationItem e) => DrawerButton(
        icon: e.nonActiveIcon ?? e.icon,
        activeIcon: e.icon,
        label: e.title,
        onTap: () => setIndex(index, NavigationSource.drawer),
        isActive: index == _currentIndex,
      ),
    ),
    const Spacer(),
    ..._getSubNavigationItems(context)
        .where((final SubNavigationItem e) => e.isActive)
        .map<Widget>(
          (final SubNavigationItem e) =>
              DrawerButton(icon: e.child, label: e.title, onTap: e.onTap),
        ),
  ];

  List<Widget> getAppbarNavigationItems(final BuildContext context) =>
      _getSubNavigationItems(context)
          .where((final SubNavigationItem e) => e.isActive)
          .map<Widget>(
            (final SubNavigationItem e) =>
                IconButton(onPressed: e.onTap, icon: e.child),
          )
          .toList();
}

class NavigationItem {
  NavigationItem({required this.title, required this.icon, this.nonActiveIcon});

  final String title;
  final Widget icon;
  final Widget? nonActiveIcon;
}

class SubNavigationItem {
  SubNavigationItem({
    required this.title,
    required this.child,
    required this.isActive,
    this.onTap,
  });

  final String title;
  final Widget child;
  final bool isActive;
  final Future<void> Function()? onTap;
}

class DrawerButton extends StatefulWidget {
  const DrawerButton({
    required this.icon,
    required this.label,
    super.key,
    this.activeIcon,
    this.onTap,
    this.isActive = false,
  });

  final Widget icon;
  final Widget? activeIcon;
  final String label;
  final Function()? onTap;
  final bool isActive;

  @override
  State<StatefulWidget> createState() => _DrawerButtonState();
}

class _DrawerButtonState extends State<DrawerButton> {
  bool isHoverActive = false;

  @override
  Widget build(final BuildContext context) => MouseRegion(
    cursor: SystemMouseCursors.click,
    onEnter: (final _) {
      if (widget.isActive) {
        return;
      }

      setState(() => isHoverActive = true);
    },
    onExit: (final _) {
      if (widget.isActive) {
        return;
      }

      setState(() => isHoverActive = false);
    },
    child: GestureDetector(
      onTap: () {
        widget.onTap?.call();
        setState(() => isHoverActive = false);
      },
      child: SizedBox(
        width: 85,
        height: 65,
        child: DecoratedBox(
          decoration: isHoverActive || widget.isActive
              ? BoxDecoration(
                  color: Theme.of(
                    context,
                  ).cardButtonStyle?.backgroundColor?.resolve(<WidgetState>{}),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Constant.borderRadius),
                  ),
                )
              : const BoxDecoration(),
          child: Column(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if ((isHoverActive || widget.isActive) &&
                  widget.activeIcon != null)
                widget.activeIcon!
              else
                widget.icon,
              Text(
                widget.label,
                style: TextStyle(
                  color: widget.isActive
                      ? Theme.of(context).colorScheme.primary
                      : null,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
