import 'dart:math';

import 'package:application/components/advanced_search_card.dart';
import 'package:application/components/animes/anime_component.dart';
import 'package:application/controllers/anime_search_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/utils/widget_builder.dart' as wb;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _controller = TextEditingController();
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      AnimeSearchController.instance.init();
    });
  }

  @override
  void dispose() {
    AnimeSearchController.instance.dispose();
    super.dispose();
  }

  List<Widget> _buildAnimeList(BuildContext context, List<AnimeDto> animes) {
    final smallestDimension = MediaQuery.of(context).size.width;

    return [
      _isOpen
          ? AdvancedSearchCard(controller: _controller)
          : const SizedBox.shrink(),
      ...wb.WidgetBuilder.instance.buildRowWidgets(
        animes.map((anime) => AnimeComponent(anime: anime)),
        maxElementsPerRow: max(2, (smallestDimension * 3 / 600).floor()),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SearchBar(
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
            IconButton(
              onPressed: () {
                setState(() {
                  _isOpen = !_isOpen;
                });
              },
              icon: const Icon(Icons.tune),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: StreamBuilder<List<AnimeDto>>(
          stream: AnimeSearchController.instance.streamController.stream,
          initialData: AnimeSearchController.instance.items,
          builder: (context, snapshot) {
            final list = _buildAnimeList(context, snapshot.data!);

            return ListView.builder(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
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
