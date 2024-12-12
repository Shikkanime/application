extension ExtensionsList<T> on List<T> {
  List<R> mapIndexed<R>(final R Function(int index, T e) f) {
    final List<R> result = <R>[];

    for (int i = 0; i < length; i++) {
      result.add(f(i, this[i]));
    }

    return result;
  }
}
