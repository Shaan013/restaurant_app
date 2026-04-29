import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static late SharedPreferences _prefs;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Generic method to save data
  static Future<bool> setData<T>(String key, T value) async {
    if (value is String) return await _prefs.setString(key, value);
    if (value is int) return await _prefs.setInt(key, value);
    if (value is bool) return await _prefs.setBool(key, value);
    if (value is double) return await _prefs.setDouble(key, value);
    if (value is List<String>) return await _prefs.setStringList(key, value);
    return false;
  }

  // Generic method to get data
  static T? getData<T>(String key) {
    return _prefs.get(key) as T?;
  }

  // Remove specific key
  static Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  // Clear all data
  static Future<bool> clear() async {
    return await _prefs.clear();
  }

  // Keys for productivity
  static const String keyIsLoggedIn = "is_logged_in";
  static const String keyUserToken = "user_token";
  static const String keyUserName = "user_name";

  // Helper methods
  static bool get isLoggedIn => getData<bool>(keyIsLoggedIn) ?? false;
  static set isLoggedIn(bool value) => setData(keyIsLoggedIn, value);

  static String? get userToken => getData<String>(keyUserToken);
  static set userToken(String? value) => value != null ? setData(keyUserToken, value) : remove(keyUserToken);
}
