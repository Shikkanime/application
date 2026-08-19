import 'package:application/core/network/http_client.dart';
import 'package:application/core/theme/app_theme.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/repositories/anime_repository.dart';
import 'package:application/repositories/grouped_episode_repository.dart';
import 'package:application/repositories/simulcast_repository.dart';
import 'package:application/repositories/weekly_repository.dart';
import 'package:application/viewmodels/anime_view_model.dart';
import 'package:application/viewmodels/grouped_episode_view_model.dart';
import 'package:application/viewmodels/navigation_view_model.dart';
import 'package:application/viewmodels/simulcast_view_model.dart';
import 'package:application/viewmodels/weekly_view_model.dart';
import 'package:application/views/catalog/catalog_view.dart';
import 'package:application/views/grouped_episodes/grouped_episodes_view.dart';
import 'package:application/views/weekly/weekly_view.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => const HttpClient()),
        Provider(
          create: (context) =>
              GroupedEpisodeRepository(context.read<HttpClient>()),
        ),
        Provider(
          create: (context) => SimulcastRepository(context.read<HttpClient>()),
        ),
        Provider(
          create: (context) => AnimeRepository(context.read<HttpClient>()),
        ),
        Provider(
          create: (context) => WeeklyRepository(context.read<HttpClient>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              GroupedEpisodeViewModel(context.read<GroupedEpisodeRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              SimulcastViewModel(context.read<SimulcastRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => AnimeViewModel(
            context.read<AnimeRepository>(),
            context.read<SimulcastViewModel>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              WeeklyViewModel(context.read<WeeklyRepository>()),
        ),
        ChangeNotifierProvider(create: (_) => NavigationViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    localizationsDelegates: const [
      ...GlobalMaterialLocalizations.delegates,
      ...AppLocalizations.localizationsDelegates,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
    home: const MyHomePage(),
    debugShowCheckedModeBanner: false,
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([.portraitUp, .portraitDown]);

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      .landscapeRight,
      .landscapeLeft,
      .portraitUp,
      .portraitDown,
    ]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NavigationViewModel>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const _AppAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const .only(left: 8, right: 8, bottom: 8),
          child: PageView(
            controller: viewModel.controller,
            onPageChanged: viewModel.onChange,
            children: const [
              GroupedEpisodesView(),
              CatalogView(),
              WeeklyView(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.onChange,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          switch (viewModel.currentIndex) {
            case 0:
              context.read<GroupedEpisodeViewModel>().init(bypass: true);
              break;
            case 1:
              context.read<AnimeViewModel>().init(bypass: true);
              break;
            case 2:
              context.read<WeeklyViewModel>().init(bypass: true);
              break;
          }
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class _AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: Image(
        image: Theme.of(context).extension<AppThemeExtension>()!.iconImage,
        width: 36,
        height: 36,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
