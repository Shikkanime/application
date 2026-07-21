import 'dart:async';

import 'package:flutter/widgets.dart';

abstract class GenericController<T> {
  GenericController({this.addScrollListener = true});

  final List<T> items = <T>[];
  final ScrollController scrollController = ScrollController();
  final StreamController<List<T>> streamController =
      StreamController<List<T>>.broadcast();
  final bool addScrollListener;
  int page = 1;
  bool isLoading = false;
  bool canLoadMore = true;

  Future<void> init() async {
    items.clear();
    streamController.add(items);

    page = 1;
    isLoading = false;
    canLoadMore = true;
    await nextPage();

    if (addScrollListener) {
      scrollController
        ..removeListener(_scrollListener)
        ..addListener(_scrollListener);
    }
  }

  void _scrollListener() {
    final ScrollPosition position = scrollController.position;
    // If 90% of the list is scrolled, load more items
    final bool isAtBottom = position.pixels >= position.maxScrollExtent * 0.9;

    if (isAtBottom && !isLoading && canLoadMore) {
      nextPage();
    }
  }

  Future<void> goToTop() async {
    if (scrollController.hasClients) {
      await scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    await init();
  }

  Future<void> nextPage() async {
    if (isLoading || !canLoadMore) {
      return;
    }

    isLoading = true;
    streamController.add(items);

    final Stopwatch stopwatch = Stopwatch()..start();
    debugPrint('$runtimeType - Loading page $page...');

    try {
      final Pair<Iterable<T>, int> newItems = await fetchItems();
      items.addAll(newItems.first);
      canLoadMore = newItems.second > items.length;
      page++;
    } on Exception catch (e) {
      debugPrint(e.toString());
    } finally {
      stopwatch.stop();
      debugPrint(
        '$runtimeType - Page loaded in ${stopwatch.elapsedMilliseconds}ms',
      );
      isLoading = false;
      streamController.add(items);
    }
  }

  Future<Pair<Iterable<T>, int>> fetchItems();

  void dispose() {
    scrollController.removeListener(_scrollListener);
  }
}

class Pair<A, B> {
  Pair(this.first, this.second);

  final A first;
  final B second;
}
