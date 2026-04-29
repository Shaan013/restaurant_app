import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));
String categoriesToJson(Categories data) => json.encode(data.toJson());
class Categories {
  Categories({
      int? id, 
      String? name, 
      String? imageUrl,}){
    _id = id;
    _name = name;
    _imageUrl = imageUrl;
}

  Categories.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _imageUrl = json['image_url'];
  }
  int? _id;
  String? _name;
  String? _imageUrl;

  int? get id => _id;
  String? get name => _name;
  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image_url'] = _imageUrl;
    return map;
  }

}