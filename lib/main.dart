import 'package:application/components/member_image.dart';
import 'package:application/components/pill.dart';
import 'package:application/controllers/anime_controller.dart';
import 'package:application/controllers/anime_weekly_controller.dart';
import 'package:application/controllers/followed_anime_controller.dart';
import 'package:application/controllers/followed_episode_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/missed_anime_controller.dart';
import 'package:application/controllers/notifications_controller.dart';
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
import 'package:application/controllers/episode_controller.dart';
import 'package:application/controllers/simulcast_controller.dart';
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
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await MemberController.instance.init();

    await Future.wait([
      EpisodeController.instance.init(),
      MissedAnimeController.instance.init(),
      SimulcastController.instance
          .init()
          .then((value) => AnimeController.instance.init()),
      AnimeWeeklyController.instance.init(),
      FollowedAnimeController.instance.init(),
      FollowedEpisodeController.instance.init(),
      // Without call to the API
      SortController.instance.init(),
    ]);

    hasInternet = true;
  } catch (e) {
    debugPrint(e.toString());
  }

  runApp(MyApp(hasInternet: hasInternet));
}

class MyApp extends StatelessWidget {
  final bool hasInternet;

  const MyApp({super.key, required this.hasInternet});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: _buildTheme(
        brightness: Brightness.light,
        scaffoldBackground: const Color(0xfff0f0f0),
        primary: Colors.black,
        canvasColor: Colors.white,
        textColor: Colors.black,
        snackBarBackground: Colors.white,
        selectedSegmentedButtonBackground: const Color(0xfff6f6f6),
        unselectedSegmentedButtonBackground: Colors.white,
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
        selectedSegmentedButtonBackground: const Color(0xff1f1f1f),
        unselectedSegmentedButtonBackground: Colors.black,
        elevatedButtonBackground: const Color(0xff1f1f1f),
        elevatedButtonShadowColor: Colors.grey[900]!,
      ),
      home: hasInternet ? const MyHomePage() : const NoInternet(),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData _buildTheme({
    required Brightness brightness,
    required Color scaffoldBackground,
    required Color primary,
    required Color canvasColor,
    required Color textColor,
    required Color snackBarBackground,
    required Color selectedSegmentedButtonBackground,
    required Color unselectedSegmentedButtonBackground,
    required Color elevatedButtonBackground,
    required Color elevatedButtonShadowColor,
  }) {
    return ThemeData(
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
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: SegmentedButton.styleFrom(
          selectedForegroundColor: primary,
          selectedBackgroundColor: selectedSegmentedButtonBackground,
          foregroundColor: primary,
          backgroundColor: unselectedSegmentedButtonBackground,
          textStyle: const TextStyle(fontSize: 12),
        ),
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
      popupMenuTheme: PopupMenuThemeData(
        color: canvasColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constant.borderRadius),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      NotificationsController.instance.init();
      Analytics.instance.logScreenView('home');
    });
  }

  @override
  dispose() {
    super.dispose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: const Image(
          image: AssetImage('assets/icon_450x450.png'),
          width: 36,
          height: 36,
        ),
        actions: [
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
                children: [
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
                  MaterialPageRoute(
                    builder: (context) => const AccountSettingsView(),
                  ),
                );
              },
              icon: const Icon(Icons.settings),
            ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchView(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          _changePage(index);
        },
        children: const [
          HomeView(),
          SimulcastView(),
          CalendarView(),
          AccountView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: StreamBuilder<List<MissedAnimeDto>>(
              stream: MissedAnimeController.instance.streamController.stream,
              initialData: MissedAnimeController.instance.items,
              builder: (context, snapshot) {
                final icon =
                    Icon(_currentIndex == 0 ? Icons.home : Icons.home_outlined);

                if (snapshot.data!.isEmpty) {
                  return icon;
                }

                return Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, top: 8),
                      child: icon,
                    ),
                    if (snapshot.data!.isNotEmpty)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Pill(
                          count: snapshot.data!
                              .map((e) => e.episodeMissed)
                              .reduce((a, b) => a + b),
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
              builder: (context, snapshot) {
                final member = snapshot.data;

                return MemberImage(
                  member: member,
                  width: 32,
                  height: 32,
                  hasBorder: _currentIndex == 3,
                );
              },
            ),
            label: AppLocalizations.of(context)!.myAccount,
          ),
        ],
        onTap: (index) {
          if (index == _currentIndex) {
            switch (index) {
              case 0:
                EpisodeController.instance.goToTop();
                break;
              case 1:
                AnimeController.instance.goToTop();
                break;
              case 2:
                AnimeWeeklyController.instance.goToTop();
                break;
            }
          } else {
            pageController.jumpToPage(index);
            _changePage(index);
          }
        },
      ),
    );
  }

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });

    String screenName = '';

    switch (index) {
      case 0:
        screenName = 'home';
        break;
      case 1:
        screenName = 'catalog';
        break;
      case 2:
        screenName = 'calendar';
        break;
      case 3:
        screenName = 'account';
        break;
    }

    Analytics.instance.logScreenView(screenName);
  }
}
