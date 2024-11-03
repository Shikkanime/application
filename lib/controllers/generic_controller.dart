import 'dart:async';

import 'package:flutter/widgets.dart';

abstract class GenericController<T> {
  GenericController({
    this.addScrollListener = true,
  });

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

    if (position.pixels >= position.maxScrollExtent - 300 &&
        !isLoading &&
        canLoadMore) {
      nextPage();
    }
  }

  Future<void> goToTop() async {
    await scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    await init();
  }

  Future<void> nextPage() async {
    if (isLoading) {
      return;
    }

    isLoading = true;
    debugPrint('$runtimeType - Loading page $page');

    try {
      final Iterable<T> newItems = await fetchItems();
      items.addAll(newItems);

      streamController.add(items);
      canLoadMore = newItems.isNotEmpty;
    } on Exception catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      page++;
    }
  }

  Future<Iterable<T>> fetchItems();

  void dispose() {
    scrollController.removeListener(_scrollListener);
  }
}
