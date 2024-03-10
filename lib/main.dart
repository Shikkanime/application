import 'dart:convert';

import 'package:application/dtos/episode_dto.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final episodes = <EpisodeDto>[];

  try {
    final response = await http.get(
      Uri.parse(
          'https://api.shikkanime.fr/v1/episodes?sort=releaseDateTime&desc=releaseDateTime&limit=30'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load episodes');
    }

    episodes.addAll((jsonDecode(response.body)['data'] as List)
        .map((e) => EpisodeDto.fromJson(e as Map<String, dynamic>)));
  } catch (e) {
    debugPrint(e.toString());
  }

  runApp(MyApp(episodes: episodes));
}

class MyApp extends StatelessWidget {
  final List<EpisodeDto> episodes;

  const MyApp({super.key, required this.episodes});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black.withOpacity(0.8),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          title: const Image(
            image: AssetImage('assets/icon_128x128.png'),
            width: 36,
            height: 36,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            itemCount: episodes.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Episode(
              episode: episodes[index],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined),
              activeIcon: Icon(Icons.video_collection),
              label: 'Simulcast',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Mon compte',
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Episode extends StatelessWidget {
  final EpisodeDto episode;

  const Episode({
    super.key,
    required this.episode,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: episode.image,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: (context, url) => Container(
                      color: Colors.grey, width: double.infinity, height: 210),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 5,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  color: Colors.black,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.play_arrow,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Lecture',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  )
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  color: Colors.black,
                  child: Text(
                    '${Duration(seconds: episode.duration).inMinutes.remainder(60)} min',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              episode.anime.shortName,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Text(
            'Saison ${episode.season} | Épisode ${episode.number}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              episode.langType == 'SUBTITLES' ? 'Sous-titrage' : 'Doublage',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
