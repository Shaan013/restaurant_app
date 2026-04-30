import 'package:shared_preferences/shared_preferences.dart';

class SharePrefrenceInfo {
  late final SharedPreferences _sharedPreferences;
  final String _isLogedIn = "isLogedIn";

  SharePrefrenceInfo(this._sharedPreferences);

  Future<bool> isLogedIn() async {
    final result = await _sharedPreferences.getBool(_isLogedIn);
    if (result == null) return false;
    return result;
  }

  Future<void> setLogedIn() async {
    _sharedPreferences.setBool(_isLogedIn, true);
  }

  Future<void> setLogedOut() async {
    _sharedPreferences.setBool(_isLogedIn, false);
  }
}
