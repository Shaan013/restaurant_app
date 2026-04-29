import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());
class UserModel {
  UserModel({
      int? id, 
      String? fullName, 
      String? email, 
      String? phone,}){
    _id = id;
    _fullName = fullName;
    _email = email;
    _phone = phone;
}

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    _email = json['email'];
    _phone = json['phone'];
  }
  int? _id;
  String? _fullName;
  String? _email;
  String? _phone;

  int? get id => _id;
  String? get fullName => _fullName;
  String? get email => _email;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['full_name'] = _fullName;
    map['email'] = _email;
    map['phone'] = _phone;
    return map;
  }

}