import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));
String loginModelToJson(LoginModel data) => json.encode(data.toJson());
class LoginModel {
  LoginModel({
      String? fullName, 
      String? email, 
      String? phone, 
      String? password,}){
    _fullName = fullName;
    _email = email;
    _phone = phone;
    _password = password;
}

  LoginModel.fromJson(dynamic json) {
    _fullName = json['full_name'];
    _email = json['email'];
    _phone = json['phone'];
    _password = json['password'];
  }
  String? _fullName;
  String? _email;
  String? _phone;
  String? _password;

  String? get fullName => _fullName;
  String? get email => _email;
  String? get phone => _phone;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['full_name'] = _fullName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['password'] = _password;
    return map;
  }

}