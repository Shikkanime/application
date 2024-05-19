import 'package:application/components/pill.dart';
import 'package:application/components/update_available_component.dart';
import 'package:application/controllers/anime_controller.dart';
import 'package:application/controllers/anime_search_controller.dart';
import 'package:application/controllers/anime_weekly_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/missed_anime_controller.dart';
import 'package:application/dtos/missed_anime_dto.dart';
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
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

import 'firebase_options.dart';

final shorebirdCodePush = ShorebirdCodePush();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool hasInternet = false;

  if (kDebugMode && Constant.apiUrl == 'https://api.shikkanime.fr') {
    throw Exception('You must change the API URL in the Constant class');
  }

  try {
    await MemberController.instance.init();

    await Future.wait([
      EpisodeController.instance.init(),
      MissedAnimeController.instance.init(),
      SimulcastController.instance
          .init()
          .then((value) => AnimeController.instance.init()),
      AnimeWeeklyController.instance.init(),
    ]);

    AnimeSearchController.instance.init();

    await _initFirebase();
    hasInternet = true;
  } catch (e) {
    debugPrint(e.toString());
  }

  runApp(MyApp(hasInternet: hasInternet));
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final response =
      await FirebaseMessaging.instance.requestPermission(provisional: true);

  if (response.authorizationStatus == AuthorizationStatus.authorized) {
    await FirebaseMessaging.instance.subscribeToTopic('global');
  }
}

class MyApp extends StatelessWidget {
  final bool hasInternet;

  const MyApp({super.key, required this.hasInternet});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: 'Satoshi',
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.white,
          primary: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black.withOpacity(0.8),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.grey,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: Colors.grey[900],
          contentTextStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        segmentedButtonTheme: SegmentedButtonThemeData(
          style: SegmentedButton.styleFrom(
            selectedForegroundColor: Colors.white,
            selectedBackgroundColor: const Color(0x40b1cbd0),
            foregroundColor: Colors.grey,
            backgroundColor: Colors.black,
            textStyle: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ),
      home: hasInternet ? const MyHomePage() : const NoInternet(),
      debugShowCheckedModeBanner: false,
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
  final _isShorebirdAvailable = shorebirdCodePush.isShorebirdAvailable();

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_isShorebirdAvailable) {
        shorebirdCodePush
            .currentPatchNumber()
            .then((currentPatchVersion) async {
          // Ask the Shorebird servers if there is a new patch available.
          final isUpdateAvailable =
              await shorebirdCodePush.isNewPatchAvailableForDownload();

          if (mounted && isUpdateAvailable) {
            showModalBottomSheet(
              context: context,
              builder: (context) => const UpdateAvailableComponent(),
            );
          }
        });
      }
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
        title: const Image(
          image: AssetImage('assets/icon_128x128.png'),
          width: 36,
          height: 36,
        ),
        actions: [
          if (_currentIndex == 2)
            IconButton(
              onPressed: () {
                setState(() {
                  AnimeWeeklyController.instance.memberMode =
                      !AnimeWeeklyController.instance.memberMode;
                });

                AnimeWeeklyController.instance.init();
              },
              icon: Icon(
                AnimeWeeklyController.instance.memberMode
                    ? Icons.filter_alt
                    : Icons.filter_alt_off,
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
          setState(() {
            _currentIndex = index;
          });
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
              initialData: MissedAnimeController.instance.missedAnimes,
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
            icon: const Icon(Icons.person_outline),
            activeIcon: const Icon(Icons.person),
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

            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
    );
  }
}
