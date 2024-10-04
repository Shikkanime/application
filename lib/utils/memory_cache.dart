class MemoryCache {
  static final instance = MemoryCache();
  final _cache = <String, dynamic>{};

  T? get<T>(final String key) {
    return _cache[key] as T?;
  }

  void set<T>(final String key, final T value) {
    _cache[key] = value;
  }
}
