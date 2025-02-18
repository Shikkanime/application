import 'package:application/controllers/episode_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/missed_anime_controller.dart';
import 'package:application/controllers/navigation_controller.dart';
import 'package:application/controllers/notifications_controller.dart';
import 'package:application/controllers/patch_controller.dart';
import 'package:application/controllers/review_controller.dart';
import 'package:application/controllers/shared_preferences_controller.dart';
import 'package:application/controllers/sort_controller.dart';
import 'package:application/controllers/update_controller.dart';
import 'package:application/firebase_options.dart';
import 'package:application/l10n/generated/app_localizations.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/constant.dart';
import 'package:application/utils/extensions.dart';
import 'package:application/views/account_view.dart';
import 'package:application/views/calendar_view.dart';
import 'package:application/views/home_view.dart';
import 'package:application/views/no_internet.dart';
import 'package:application/views/simulcast_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

    final int start = DateTime.now().millisecondsSinceEpoch;
    debugPrint('Logging in...');

    await SharedPreferencesController.instance.init();
    await MemberController.instance.init();
    await SortController.instance.init();

    debugPrint(
      'Logged in in ${DateTime.now().millisecondsSinceEpoch - start}ms',
    );

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
          iconImage: const AssetImage('assets/dark_icon.png'),
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
          iconImage: const AssetImage('assets/light_icon.png'),
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
    required final AssetImage iconImage,
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
          backgroundColor: scaffoldBackground.withValues(alpha: 0.8),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primary,
          unselectedItemColor: Colors.grey,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primary,
          foregroundColor: canvasColor,
        ),
        canvasColor: canvasColor,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: const TextStyle(
            color: Colors.grey,
          ),
          bodySmall: const TextStyle(
            color: Colors.grey,
            fontSize: 11,
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
            backgroundColor: canvasColor,
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
        dialogTheme: DialogTheme(
          backgroundColor: canvasColor,
        ),
      )
        ..addInputDecorationTheme(
          ElevatedButton.styleFrom(
            backgroundColor: elevatedButtonBackground,
            shadowColor: elevatedButtonShadowColor,
          ),
        )
        ..addImageDecorationTheme(iconImage);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      ReviewController.instance.requestReview();
      UpdateController.instance.checkIfStoreUpdateIsAvailable(context);

      MissedAnimeController.instance.init();
      EpisodeController.instance.init();
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
  Widget build(final BuildContext context) {
    final PageView pageView = PageView(
      controller: NavigationController.instance.pageController,
      onPageChanged: (final int index) {
        NavigationController.instance
            .setIndex(index, NavigationSource.pageView);
      },
      children: const <Widget>[
        HomeView(),
        SimulcastView(),
        CalendarView(),
        AccountView(),
      ],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: Constant.isAndroidOrIOS ? const ApplicationAppBar() : null,
      body: Constant.isAndroidOrIOS
          ? pageView
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: StreamBuilder<int>(
                      stream:
                          NavigationController.instance.streamController.stream,
                      initialData: NavigationController.instance.currentIndex,
                      builder: (
                        final BuildContext context,
                        final AsyncSnapshot<int> snapshot,
                      ) =>
                          Column(
                        spacing: 8,
                        children: NavigationController.instance
                            .getDrawerItems(context),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: pageView,
                  ),
                ),
              ],
            ),
      bottomNavigationBar: Constant.isAndroidOrIOS
          ? StreamBuilder<int>(
              stream: NavigationController.instance.streamController.stream,
              builder: (
                final BuildContext context,
                final AsyncSnapshot<int> snapshot,
              ) =>
                  BottomNavigationBar(
                showUnselectedLabels: true,
                currentIndex: NavigationController.instance.currentIndex,
                items: NavigationController.instance
                    .getBottomNavigationBarItems(context),
                onTap: (final int index) {
                  NavigationController.instance
                      .setIndex(index, NavigationSource.bottomNavigationBar);
                },
              ),
            )
          : null,
    );
  }
}

class ApplicationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ApplicationAppBar({super.key});

  @override
  Widget build(final BuildContext context) => StreamBuilder<int>(
        stream: NavigationController.instance.streamController.stream,
        initialData: NavigationController.instance.currentIndex,
        builder:
            (final BuildContext context, final AsyncSnapshot<int> snapshot) =>
                AppBar(
          elevation: 0,
          centerTitle: false,
          title: GestureDetector(
            onTap: () {
              NavigationController.instance
                  .setIndex(0, NavigationSource.appBar);
            },
            child: Image(
              image: Theme.of(context).getIconImage()!,
              width: 36,
              height: 36,
            ),
          ),
          actions:
              NavigationController.instance.getAppbarNavigationItems(context),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
