import 'dart:async';

import 'package:flutter/widgets.dart';

abstract class GenericController<T> {
  final items = <T>[];
  final scrollController = ScrollController();
  final streamController = StreamController<List<T>>.broadcast();
  final bool addScrollListener;
  int page = 1;
  bool isLoading = false;
  bool canLoadMore = true;

  GenericController({
    this.addScrollListener = true,
  });

  Future<void> init() async {
    items.clear();
    streamController.add(items);

    page = 1;
    isLoading = false;
    canLoadMore = true;
    await nextPage();

    if (addScrollListener) {
      scrollController.removeListener(_scrollListener);
      scrollController.addListener(_scrollListener);
    }
  }

  void _scrollListener() {
    final position = scrollController.position;

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
    if (isLoading) return;

    isLoading = true;
    debugPrint('$runtimeType - Loading page $page');

    try {
      final newItems = await fetchItems();
      items.addAll(newItems);

      streamController.add(items);
      canLoadMore = newItems.isNotEmpty;
    } catch (e) {
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