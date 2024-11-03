import 'package:application/components/member_image.dart';
import 'package:application/components/pill.dart';
import 'package:application/controllers/anime_controller.dart';
import 'package:application/controllers/anime_weekly_controller.dart';
import 'package:application/controllers/episode_controller.dart';
import 'package:application/controllers/followed_anime_controller.dart';
import 'package:application/controllers/followed_episode_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/missed_anime_controller.dart';
import 'package:application/controllers/notifications_controller.dart';
import 'package:application/controllers/patch_controller.dart';
import 'package:application/controllers/simulcast_controller.dart';
import 'package:application/controllers/sort_controller.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:application/dtos/missed_anime_dto.dart';
import 'package:application/firebase_options.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/constant.dart';
import 'package:application/views/account_settings_view.dart';
import 'package:application/views/account_view.dart';
import 'package:application/views/calendar_view.dart';
import 'package:application/views/home_view.dart';
import 'package:application/views/no_internet.dart';
import 'package:application/views/search_view.dart';
import 'package:application/views/simulcast_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool hasInternet = false;

  if (kDebugMode && Constant.apiUrl == 'https://api.shikkanime.fr') {
    throw Exception('You must change the API URL in the Constant class');
  }

  try {
    if (Constant.isAndroidOrIOS) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }

    await MemberController.instance.init();

    await Future.wait(<Future<void>>[
      EpisodeController.instance.init(),
      MissedAnimeController.instance.init(),
      SimulcastController.instance
          .init()
          .then((final _) => AnimeController.instance.init()),
      AnimeWeeklyController.instance.init(),
      FollowedAnimeController.instance.init(),
      FollowedEpisodeController.instance.init(),
      // Without call to the API
      SortController.instance.init(),
    ]);

    hasInternet = true;
  } on Exception catch (e) {
    debugPrint(e.toString());
  }

  runApp(MyApp(hasInternet: hasInternet));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.hasInternet, super.key});

  final bool hasInternet;

  @override
  Widget build(final BuildContext context) => MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: _buildTheme(
          brightness: Brightness.light,
          scaffoldBackground: const Color(0xfff0f0f0),
          primary: Colors.black,
          canvasColor: Colors.white,
          textColor: Colors.black,
          snackBarBackground: Colors.white,
          elevatedButtonBackground: const Color(0xfff6f6f6),
          elevatedButtonShadowColor: Colors.grey[300]!,
        ),
        darkTheme: _buildTheme(
          brightness: Brightness.dark,
          scaffoldBackground: Colors.black,
          primary: Colors.white,
          canvasColor: const Color(0xff121212),
          textColor: Colors.white,
          snackBarBackground: Colors.grey[900]!,
          elevatedButtonBackground: const Color(0xff1f1f1f),
          elevatedButtonShadowColor: Colors.grey[900]!,
        ),
        home: hasInternet ? const MyHomePage() : const NoInternet(),
        debugShowCheckedModeBanner: false,
      );

  ThemeData _buildTheme({
    required final Brightness brightness,
    required final Color scaffoldBackground,
    required final Color primary,
    required final Color canvasColor,
    required final Color textColor,
    required final Color snackBarBackground,
    required final Color elevatedButtonBackground,
    required final Color elevatedButtonShadowColor,
  }) =>
      ThemeData(
        brightness: brightness,
        fontFamily: 'Satoshi',
        scaffoldBackgroundColor: scaffoldBackground,
        colorScheme: ColorScheme.fromSeed(
          brightness: brightness,
          seedColor: primary,
          primary: primary,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: scaffoldBackground.withOpacity(0.8),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primary,
          unselectedItemColor: Colors.grey,
        ),
        canvasColor: canvasColor,
        textTheme: TextTheme(
          bodyMedium: const TextStyle(color: Colors.grey),
          bodyLarge: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: snackBarBackground,
          contentTextStyle: TextStyle(color: textColor),
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: primary,
          linearTrackColor: scaffoldBackground,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: elevatedButtonBackground,
            shadowColor: elevatedButtonShadowColor,
          ),
        ),
        searchBarTheme: SearchBarThemeData(
          backgroundColor: WidgetStatePropertyAll<Color>(canvasColor),
          shadowColor: WidgetStatePropertyAll<Color>(canvasColor),
          textStyle: WidgetStatePropertyAll<TextStyle>(
            TextStyle(
              color: textColor,
              fontSize: 20,
            ),
          ),
        ),
        popupMenuTheme: PopupMenuThemeData(
          color: canvasColor,
          shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(Constant.borderRadius)),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: primary,
          ),
        ),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    WidgetsBinding.instance.addPostFrameCallback((final _) {
      NotificationsController.instance.init();
      Analytics.instance.logScreenView('home');
      PatchController.instance.patch(context);
    });
  }

  @override
  void dispose() {
    super.dispose();

    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: Constant.isAndroidOrIOS
            ? AppBar(
                elevation: 0,
                centerTitle: false,
                title: const Image(
                  image: AssetImage('assets/icon_450x450.png'),
                  width: 36,
                  height: 36,
                ),
                actions: <Widget>[
                  if (_currentIndex == 2)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          AnimeWeeklyController.instance.memberMode =
                              !AnimeWeeklyController.instance.memberMode;
                        });

                        AnimeWeeklyController.instance.init();
                      },
                      child: Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Icon(
                            AnimeWeeklyController.instance.memberMode
                                ? Icons.filter_alt
                                : Icons.filter_alt_off,
                          ),
                          const SizedBox(width: 8),
                          Text(AppLocalizations.of(context)!.watchlist),
                        ],
                      ),
                    ),
                  if (_currentIndex == 3)
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (final BuildContext context) =>
                                const AccountSettingsView(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.settings),
                    ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (final BuildContext context) =>
                              const SearchView(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              )
            : null,
        body: Constant.isAndroidOrIOS
            ? PageView(
                controller: pageController,
                onPageChanged: _changePage,
                children: const <Widget>[
                  HomeView(),
                  SimulcastView(),
                  CalendarView(),
                  AccountView(),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        children: <Widget>[
                          DrawerButton(
                            icon: StreamBuilder<List<MissedAnimeDto>>(
                              stream: MissedAnimeController
                                  .instance.streamController.stream,
                              initialData: MissedAnimeController.instance.items,
                              builder: (
                                final BuildContext context,
                                final AsyncSnapshot<List<MissedAnimeDto>>
                                    snapshot,
                              ) {
                                final Icon icon = Icon(
                                  _currentIndex == 0
                                      ? Icons.home
                                      : Icons.home_outlined,
                                );

                                if (snapshot.data!.isEmpty) {
                                  return icon;
                                }

                                return Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                        top: 8,
                                      ),
                                      child: icon,
                                    ),
                                    if (snapshot.data!.isNotEmpty)
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Pill(
                                          count: snapshot.data!
                                              .map(
                                                (final MissedAnimeDto e) =>
                                                    e.episodeMissed,
                                              )
                                              .reduce(
                                                (final int a, final int b) =>
                                                    a + b,
                                              ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                            isActive: _currentIndex == 0,
                            onTap: () {
                              pageController.jumpToPage(0);
                              _changePage(0);
                            },
                            label: AppLocalizations.of(context)!.home,
                          ),
                          const SizedBox(height: 12),
                          DrawerButton(
                            icon: const Icon(Icons.video_collection_outlined),
                            activeIcon: const Icon(Icons.video_collection),
                            isActive: _currentIndex == 1,
                            onTap: () {
                              pageController.jumpToPage(1);
                              _changePage(1);
                            },
                            label: AppLocalizations.of(context)!.catalog,
                          ),
                          const SizedBox(height: 12),
                          DrawerButton(
                            icon: const Icon(Icons.calendar_today_outlined),
                            activeIcon: const Icon(Icons.calendar_today),
                            isActive: _currentIndex == 2,
                            onTap: () {
                              pageController.jumpToPage(2);
                              _changePage(2);
                            },
                            label: AppLocalizations.of(context)!.calendar,
                          ),
                          const SizedBox(height: 12),
                          DrawerButton(
                            icon: StreamBuilder<MemberDto>(
                              stream: MemberController
                                  .instance.streamController.stream,
                              initialData: MemberController.instance.member,
                              builder: (
                                final BuildContext context,
                                final AsyncSnapshot<MemberDto> snapshot,
                              ) =>
                                  MemberImage(
                                member: snapshot.data,
                                width: 32,
                                height: 32,
                                hasBorder: false,
                              ),
                            ),
                            isActive: _currentIndex == 3,
                            onTap: () {
                              pageController.jumpToPage(3);
                              _changePage(3);
                            },
                            label: AppLocalizations.of(context)!.myAccount,
                          ),
                          const Spacer(),
                          DrawerButton(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (final BuildContext context) =>
                                      const SearchView(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.search),
                            label: AppLocalizations.of(context)!.search,
                          ),
                          const SizedBox(height: 12),
                          DrawerButton(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (final BuildContext context) =>
                                      const AccountSettingsView(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.settings),
                            label: AppLocalizations.of(context)!.settings,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: PageView(
                        controller: pageController,
                        onPageChanged: _changePage,
                        children: const <Widget>[
                          HomeView(),
                          SimulcastView(),
                          CalendarView(),
                          AccountView(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        bottomNavigationBar: Constant.isAndroidOrIOS
            ? BottomNavigationBar(
                showUnselectedLabels: true,
                currentIndex: _currentIndex,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: StreamBuilder<List<MissedAnimeDto>>(
                      stream: MissedAnimeController
                          .instance.streamController.stream,
                      initialData: MissedAnimeController.instance.items,
                      builder: (
                        final BuildContext context,
                        final AsyncSnapshot<List<MissedAnimeDto>> snapshot,
                      ) {
                        final Icon icon = Icon(
                          _currentIndex == 0 ? Icons.home : Icons.home_outlined,
                        );

                        if (snapshot.data!.isEmpty) {
                          return icon;
                        }

                        return Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 12,
                                top: 8,
                              ),
                              child: icon,
                            ),
                            if (snapshot.data!.isNotEmpty)
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Pill(
                                  count: snapshot.data!
                                      .map(
                                        (final MissedAnimeDto e) =>
                                            e.episodeMissed,
                                      )
                                      .reduce(
                                        (final int a, final int b) => a + b,
                                      ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    label: AppLocalizations.of(context)!.home,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.video_collection_outlined),
                    activeIcon: const Icon(Icons.video_collection),
                    label: AppLocalizations.of(context)!.catalog,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.calendar_today_outlined),
                    activeIcon: const Icon(Icons.calendar_today),
                    label: AppLocalizations.of(context)!.calendar,
                  ),
                  BottomNavigationBarItem(
                    icon: StreamBuilder<MemberDto>(
                      stream: MemberController.instance.streamController.stream,
                      initialData: MemberController.instance.member,
                      builder: (
                        final BuildContext context,
                        final AsyncSnapshot<MemberDto> snapshot,
                      ) =>
                          MemberImage(
                        member: snapshot.data,
                        width: 32,
                        height: 32,
                        hasBorder: _currentIndex == 3,
                      ),
                    ),
                    label: AppLocalizations.of(context)!.myAccount,
                  ),
                ],
                onTap: (final int index) {
                  if (index == _currentIndex) {
                    switch (index) {
                      case 0:
                        EpisodeController.instance.goToTop();
                      case 1:
                        AnimeController.instance.goToTop();
                      case 2:
                        AnimeWeeklyController.instance.goToTop();
                    }
                  } else {
                    pageController.jumpToPage(index);
                    _changePage(index);
                  }
                },
              )
            : null,
      );

  void _changePage(final int index) {
    setState(() {
      _currentIndex = index;
    });

    String screenName = '';

    switch (index) {
      case 0:
        screenName = 'home';
      case 1:
        screenName = 'catalog';
      case 2:
        screenName = 'calendar';
      case 3:
        screenName = 'account';
    }

    Analytics.instance.logScreenView(screenName);
  }
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

          setState(() {
            isHoverActive = true;
          });
        },
        onExit: (final _) {
          if (widget.isActive) {
            return;
          }

          setState(() {
            isHoverActive = false;
          });
        },
        child: GestureDetector(
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap!();

              setState(() {
                isHoverActive = false;
              });
            }
          },
          child: SizedBox(
            width: 105,
            child: Container(
              decoration: isHoverActive || widget.isActive
                  ? BoxDecoration(
                      color: Theme.of(context)
                          .elevatedButtonTheme
                          .style!
                          .backgroundColor!
                          .resolve(<WidgetState>{}),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(Constant.borderRadius),
                      ),
                    )
                  : null,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if ((isHoverActive || widget.isActive) &&
                      widget.activeIcon != null)
                    widget.activeIcon!
                  else
                    widget.icon,
                  const SizedBox(height: 8),
                  Text(widget.label),
                ],
              ),
            ),
          ),
        ),
      );
}
