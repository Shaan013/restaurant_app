import 'dart:convert';

Recommended recommendedFromJson(String str) => Recommended.fromJson(json.decode(str));
String recommendedToJson(Recommended data) => json.encode(data.toJson());
class Recommended {
  Recommended({
      int? id, 
      String? title, 
      int? price, 
      double? rating, 
      int? reviewsCount, 
      String? distance, 
      String? imageUrl,}){
    _id = id;
    _title = title;
    _price = price;
    _rating = rating;
    _reviewsCount = reviewsCount;
    _distance = distance;
    _imageUrl = imageUrl;
}

  Recommended.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _price = json['price'];
    _rating = json['rating'];
    _reviewsCount = json['reviews_count'];
    _distance = json['distance'];
    _imageUrl = json['image_url'];
  }
  int? _id;
  String? _title;
  int? _price;
  double? _rating;
  int? _reviewsCount;
  String? _distance;
  String? _imageUrl;

  int? get id => _id;
  String? get title => _title;
  int? get price => _price;
  double? get rating => _rating;
  int? get reviewsCount => _reviewsCount;
  String? get distance => _distance;
  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['price'] = _price;
    map['rating'] = _rating;
    map['reviews_count'] = _reviewsCount;
    map['distance'] = _distance;
    map['image_url'] = _imageUrl;
    return map;
  }

}