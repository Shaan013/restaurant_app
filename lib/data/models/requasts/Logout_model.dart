import 'dart:convert';

LogoutModel logoutModelFromJson(String str) => LogoutModel.fromJson(json.decode(str));
String logoutModelToJson(LogoutModel data) => json.encode(data.toJson());
class LogoutModel {
  LogoutModel({
      int? userId,}){
    _userId = userId;
}

  LogoutModel.fromJson(dynamic json) {
    _userId = json['user_id'];
  }
  int? _userId;

  int? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    return map;
  }

}