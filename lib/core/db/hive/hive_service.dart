import 'dart:developer';

import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:restaurant_app/core/db/hive/white_list.dart';
import 'package:restaurant_app/data/models/responses/Recommended.dart';
import 'package:restaurant_app/data/models/responses/Recommended.dart';
import 'model_address.dart';

class HiveService {
  static const String whiteListBox = "White_list_boc";

  static Future<void> init() async {
    await Hive.initFlutter();

    // Register Adapters
    _registerAdapters();

    // Open Boxes
    await _openBoxes();
  }

  static void _registerAdapters() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(WhiteListAdapter());
    }
  }

  static Future<void> _openBoxes() async {
    await Hive.openBox<Recommended>(whiteListBox);
  }

  // Generic methods for productivity
  static Box<T> getBox<T>(String name) => Hive.box<T>(name);

  static Future<void> addFoodToWhit(Recommended address) async {
    log(" : i am in  add food white list food title is  :${address.title}");
    final box = getBox<Recommended>(whiteListBox);
    await box.add(address);
    final res = getAllAddresses();

    print("res ${res}");
  }

  static List<Recommended> getAllAddresses() {
    final box = getBox<Recommended>(whiteListBox);
    return box.values.toList();
  }

  static bool checkIsIt(int? id) {
    if (id == null) return false;
    final res = getAllAddresses();

    print("res ${res}");
    return false;
  }

  static Future<void> clearAll() async {
    await Hive.box<Recommended>(whiteListBox).clear();
  }
}
