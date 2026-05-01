import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:restaurant_app/core/db/hive/white_list.dart';
import 'package:restaurant_app/data/models/responses/Recommended.dart';

class HiveService {
  static const String whiteListBox = "White_list_boc";
  static const String cartListBox = "cart_list_boc";

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
    await Hive.openBox<WhiteList>(whiteListBox);
    await Hive.openBox<WhiteList>(cartListBox);
  }

  // Generic methods for productivity
  static Box<T> getBox<T>(String name) => Hive.box<T>(name);

  static Future<void> toggeleWhishList(Recommended recommnended) async {
    log(
      " : i am in  add food white list food title is  :${recommnended.title}",
    );
    final box = getBox<WhiteList>(whiteListBox);
    bool result = false;
    if (box.containsKey(recommnended.id)) {
      box.delete(recommnended.id);
    } else {
      await box.put(recommnended.id, WhiteList.fromRecommended(recommnended));
      final res = getAllAddresses();
      print("res ${res}");
    }
  }

  static List<WhiteList> getAllAddresses() {
    final box = getBox<WhiteList>(whiteListBox);
    return box.values.toList();
  }

  static bool checkIsIt(int? id) {
    if (id == null) return false;
    final box = getBox<WhiteList>(whiteListBox);

    // print("res ${res}");
    return box.containsKey(id);
  }

  static Future<void> clearAll() async {
    await Hive.box<Recommended>(whiteListBox).clear();
  }

  static Future<void> addToCart(Recommended rec) async {
    final box = getBox<WhiteList>(cartListBox);
    if (box.containsKey(rec.id)) {
      return;
    }
    print(" add to cart in ");
    return await box.put(rec.id, WhiteList.fromRecommended(rec));
  }

  static int chackCArt(int id) {
    final box = getBox<WhiteList>(cartListBox);
    if (!box.containsKey(id)) return 0;
    final cout = box.get(id)?.count;
    return cout ?? 0;
  }

  static Future<void> getCart(
    Recommended rec, {
    bool isIncreement = true,
  }) async {
    print(" i am in get cart ");
    final box = getBox<WhiteList>(cartListBox);
    if (!box.containsKey(rec.id)) {
      await addToCart(rec);
    }
    final WhiteList? pro = box.get(rec.id);
    if (pro != null) {
      if (isIncreement) {
        pro.countIncrement();
        print("object : ${pro.count}");
      } else {
        if (pro.count == 1) {
          box.delete(rec.id);
        }
        pro.countDecrement();
      }
      pro.save();
    }

    // ValueNotifier();
  }

  static List<Recommended> converter(List<WhiteList> whiteList) {
    List<Recommended> listRes = [];
    for (WhiteList itme in whiteList) {
      listRes.add(itme.getModel());
    }
    return listRes;
  }

  static List<Recommended> getListOfWhish() {
    print("i am in list wish list");
    final List<WhiteList> list = getAllAddresses();
    return converter(list);
  }

  static List<Recommended> getListOfCart() {
    final List<WhiteList> list = getBox<WhiteList>(cartListBox).values.toList();
    return converter(list);
  }
}
