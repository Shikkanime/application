import 'package:application/components/animes/anime_component.dart';
import 'package:application/controllers/anime_search_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    AnimeSearchController.instance.dispose();
    super.dispose();
  }

  List<Widget> _buildAnimeList(List<AnimeDto> animes) {
    final widgets = <Widget>[];

    for (int i = 0; i < animes.length; i += 2) {
      widgets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: AnimeComponent(anime: animes[i])),
            if (i + 1 < animes.length)
              Expanded(child: AnimeComponent(anime: animes[i + 1]))
            else
              const Spacer(),
          ],
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          controller: _controller,
          autoFocus: true,
          hintText: AppLocalizations.of(context)!.search,
          trailing: [
            if (_controller.text.isNotEmpty)
              IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  AnimeSearchController.instance.search('');

                  setState(() {
                    _controller.clear();
                  });
                },
              ),
          ],
          onChanged: (query) {
            AnimeSearchController.instance.search(query);
            setState(() {});
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: StreamBuilder<List<AnimeDto>>(
          stream: AnimeSearchController.instance.streamController.stream,
          initialData: AnimeSearchController.instance.animes,
          builder: (context, snapshot) {
            final list = _buildAnimeList(snapshot.data!);

            return ListView.builder(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              shrinkWrap: true,
              controller: AnimeSearchController.instance.scrollController,
              itemCount: list.length,
              itemBuilder: (context, index) => list[index],
            );
          },
        ),
      ),
    );
  }
}
