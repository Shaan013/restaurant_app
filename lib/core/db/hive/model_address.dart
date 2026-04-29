
import 'package:hive_ce/hive.dart';
part "model_address.g.dart";

@HiveType(typeId: 0)
class ModelAddress {
  @HiveField(0)
  final String address;

  @HiveField(1)
  final String unitNo;

  @HiveField(2)
  final String city;

  @HiveField(3)
  final String state;

  @HiveField(4)
  final String zipcode;

  @HiveField(5)
  final String instruction;

  ModelAddress(
    this.address,
    this.unitNo,
    this.city,
    this.state,
    this.zipcode,
    this.instruction,
  );

  String getString() {
    return "$unitNo $address $city $state ,$zipcode";
  }
}
