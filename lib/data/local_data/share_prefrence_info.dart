import 'package:shared_preferences/shared_preferences.dart';

class SharePrefrenceInfo {
  late final SharedPreferences _sharedPreferences;
  final String _isLogedIn = "isLogedIn";
  final String _logedInId = "loginId";

  SharePrefrenceInfo(this._sharedPreferences);

  Future<bool> isLogedIn() async {
    final result = await _sharedPreferences.getBool(_isLogedIn);
    if (result == null) return false;
    return result;
  }

  Future<void> setLogedIn(int id) async {
    _sharedPreferences.setBool(_isLogedIn, true);
    _sharedPreferences.setInt(_logedInId, id);
  }

  Future<void> setLogedOut() async {
    _sharedPreferences.setBool(_isLogedIn, false);
    _sharedPreferences.setInt(_logedInId, 0);
  }

  int? getId() {
    return _sharedPreferences.getInt(_logedInId);
  }
}
