import 'dart:math';

import 'package:application/components/advanced_search_card.dart';
import 'package:application/components/animes/anime_component.dart';
import 'package:application/controllers/anime_search_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/l10n/generated/app_localizations.dart';
import 'package:application/utils/widget_builder.dart' as wb;
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((final _) {
      AnimeSearchController.instance.init();
    });
  }

  @override
  void dispose() {
    AnimeSearchController.instance.dispose();
    super.dispose();
  }

  List<Widget> _buildAnimeList(
    final BuildContext context,
    final List<AnimeDto> animes,
  ) {
    final double smallestDimension = MediaQuery.sizeOf(context).width;

    return <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: AdvancedSearchCard(
          controller: _controller,
          scrollController: _scrollController,
        ),
      ),
      ...wb.WidgetBuilder.instance.buildRowWidgets(
        animes.map((final AnimeDto anime) => AnimeComponent(anime: anime)),
        maxElementsPerRow: max(2, (smallestDimension * 3 / 600).floor()),
      ),
    ];
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          title: SearchBar(
            shadowColor: WidgetStateProperty.all(Colors.transparent),
            controller: _controller,
            autoFocus: true,
            hintText: AppLocalizations.of(context)!.search,
            trailing: <Widget>[
              if (_controller.text.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    AnimeSearchController.instance.search('');
                    setState(_controller.clear);
                  },
                ),
            ],
            onChanged: (final String query) {
              AnimeSearchController.instance.search(query);
              setState(() {});
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: StreamBuilder<List<AnimeDto>>(
            stream: AnimeSearchController.instance.streamController.stream,
            initialData: AnimeSearchController.instance.items,
            builder: (
              final BuildContext context,
              final AsyncSnapshot<List<AnimeDto>> snapshot,
            ) {
              final List<Widget> list =
                  _buildAnimeList(context, snapshot.data!);

              return ListView.builder(
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: false,
                controller: AnimeSearchController.instance.scrollController,
                itemCount: list.length,
                itemBuilder: (final BuildContext context, final int index) =>
                    list[index],
              );
            },
          ),
        ),
      );
}
