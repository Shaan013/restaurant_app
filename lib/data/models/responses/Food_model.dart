import 'Food.dart';
import 'dart:convert';

FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));
String foodModelToJson(FoodModel data) => json.encode(data.toJson());
class FoodModel {
  FoodModel({
      Food? food,}){
    _food = food;
}

  FoodModel.fromJson(dynamic json) {
    _food = json['food'] != null ? Food.fromJson(json['food']) : null;
  }
  Food? _food;

  Food? get food => _food;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_food != null) {
      map['food'] = _food?.toJson();
    }
    return map;
  }

}