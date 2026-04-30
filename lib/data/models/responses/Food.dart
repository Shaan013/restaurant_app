import 'Recommended.dart';
import 'dart:convert';

Food foodFromJson(String str) => Food.fromJson(json.decode(str));
String foodToJson(Food data) => json.encode(data.toJson());
class Food {
  Food({
      List<String>? tags, 
      int? id, 
      String? title, 
      String? description, 
      int? price, 
      double? rating, 
      int? reviewsCount, 
      String? distance, 
      String? imageUrl, 
      List<Recommended>? recommended,}){
    _tags = tags;
    _id = id;
    _title = title;
    _description = description;
    _price = price;
    _rating = rating;
    _reviewsCount = reviewsCount;
    _distance = distance;
    _imageUrl = imageUrl;
    _recommended = recommended;
}

  Food.fromJson(dynamic json) {
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _price = json['price'];
    _rating = json['rating'];
    _reviewsCount = json['reviews_count'];
    _distance = json['distance'];
    _imageUrl = json['image_url'];
    if (json['recommended'] != null) {
      _recommended = [];
      json['recommended'].forEach((v) {
        _recommended?.add(Recommended.fromJson(v));
      });
    }
  }
  List<String>? _tags;
  int? _id;
  String? _title;
  String? _description;
  int? _price;
  double? _rating;
  int? _reviewsCount;
  String? _distance;
  String? _imageUrl;
  List<Recommended>? _recommended;

  List<String>? get tags => _tags;
  int? get id => _id;
  String? get title => _title;
  String? get description => _description;
  int? get price => _price;
  double? get rating => _rating;
  int? get reviewsCount => _reviewsCount;
  String? get distance => _distance;
  String? get imageUrl => _imageUrl;
  List<Recommended>? get recommended => _recommended;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tags'] = _tags;
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['price'] = _price;
    map['rating'] = _rating;
    map['reviews_count'] = _reviewsCount;
    map['distance'] = _distance;
    map['image_url'] = _imageUrl;
    if (_recommended != null) {
      map['recommended'] = _recommended?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}