import 'package:hive_ce/hive.dart';
import 'package:restaurant_app/data/models/responses/Recommended.dart';

part 'white_list.g.dart';

@HiveType(typeId: 0)
class WhiteList extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  int? price;

  @HiveField(3)
  double? rating;

  @HiveField(4)
  int? reviewsCount;

  @HiveField(5)
  String? distance;

  @HiveField(6)
  String? imageUrl;

  @HiveField(7)
  int count = 1;

  WhiteList.fromRecommended(Recommended recomand) {
    id = recomand.id;
    title = recomand.title;
    price = recomand.price;
    rating = recomand.rating;
    reviewsCount = recomand.reviewsCount;
    distance = recomand.distance;
    imageUrl = recomand.imageUrl;
  }

  WhiteList({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.distance,
    required this.rating,
    required this.price,
    required this.reviewsCount,
  });

  int get getCount => count;

  void countIncrement() {
    count++;
  }

  void countDecrement() {
    count--;
  }


  Recommended getModel() {
    return Recommended(
      id: id,
      reviewsCount: reviewsCount,
      price: price,
      rating: rating,
      distance: distance,
      imageUrl: imageUrl,
      title: title,
    );
  }
}
