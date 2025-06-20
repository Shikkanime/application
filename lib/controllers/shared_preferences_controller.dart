import 'package:application/dtos/enums/config_property_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController {
  static final SharedPreferencesController instance =
      SharedPreferencesController();
  late final SharedPreferences _sharedPreferences;
  bool _isInitialized = false;

  Future<void> init() async {
    if (_isInitialized) {
      return;
    }

    _sharedPreferences = await SharedPreferences.getInstance();
    _isInitialized = true;
  }

  bool containsKey(final ConfigPropertyKey key) =>
      _sharedPreferences.containsKey(key.name);

  int? getInt(final ConfigPropertyKey key) =>
      _sharedPreferences.getInt(key.name);

  Future<bool> setInt(final ConfigPropertyKey key, final int value) =>
      _sharedPreferences.setInt(key.name, value);

  String? getString(final ConfigPropertyKey key) =>
      _sharedPreferences.getString(key.name);

  Future<bool> setString(final ConfigPropertyKey key, final String value) =>
      _sharedPreferences.setString(key.name, value);

  bool getBool(final ConfigPropertyKey key) =>
      _sharedPreferences.getBool(key.name) ?? false;

  Future<bool> setBool(final ConfigPropertyKey key, final bool value) =>
      _sharedPreferences.setBool(key.name, value);

  Future<bool> remove(final ConfigPropertyKey key) =>
      _sharedPreferences.remove(key.name);
}
