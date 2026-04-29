import 'Categories.dart';
import 'NearbyHotels.dart';
import 'Recommended.dart';
import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));
String homeModelToJson(HomeModel data) => json.encode(data.toJson());
class HomeModel {
  HomeModel({
      String? location, 
      List<Categories>? categories, 
      List<NearbyHotels>? nearbyHotels, 
      List<Recommended>? recommended,}){
    _location = location;
    _categories = categories;
    _nearbyHotels = nearbyHotels;
    _recommended = recommended;
}

  HomeModel.fromJson(dynamic json) {
    _location = json['location'];
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
    if (json['nearby_hotels'] != null) {
      _nearbyHotels = [];
      json['nearby_hotels'].forEach((v) {
        _nearbyHotels?.add(NearbyHotels.fromJson(v));
      });
    }
    if (json['recommended'] != null) {
      _recommended = [];
      json['recommended'].forEach((v) {
        _recommended?.add(Recommended.fromJson(v));
      });
    }
  }
  String? _location;
  List<Categories>? _categories;
  List<NearbyHotels>? _nearbyHotels;
  List<Recommended>? _recommended;

  String? get location => _location;
  List<Categories>? get categories => _categories;
  List<NearbyHotels>? get nearbyHotels => _nearbyHotels;
  List<Recommended>? get recommended => _recommended;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['location'] = _location;
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    if (_nearbyHotels != null) {
      map['nearby_hotels'] = _nearbyHotels?.map((v) => v.toJson()).toList();
    }
    if (_recommended != null) {
      map['recommended'] = _recommended?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}