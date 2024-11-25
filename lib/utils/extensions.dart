extension ExtensionsList<T> on List<T> {
  List<R> mapIndexed<R>(final R Function(int index, T e) f) {
    final List<R> result = <R>[];

    for (int i = 0; i < length; i++) {
      result.add(f(i, this[i]));
    }

    return result;
  }

  List<T> separatedBy(final T separator) {
    final List<T> result = <T>[];

    for (int i = 0; i < length; i++) {
      result.add(this[i]);

      if (i != length - 1) {
        result.add(separator);
      }
    }

    return result;
  }
}
