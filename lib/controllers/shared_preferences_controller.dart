import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController {
  static final SharedPreferencesController instance =
      SharedPreferencesController();
  late final SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  bool containsKey(final String key) => _sharedPreferences.containsKey(key);

  int? getInt(final String key) => _sharedPreferences.getInt(key);

  Future<bool> setInt(final String key, final int value) =>
      _sharedPreferences.setInt(key, value);

  String? getString(final String key) => _sharedPreferences.getString(key);

  Future<bool> setString(final String key, final String value) =>
      _sharedPreferences.setString(key, value);

  Future<bool> remove(final String key) => _sharedPreferences.remove(key);
}
