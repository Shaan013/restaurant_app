import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'model_address.dart';

class HiveService {
  static const String addressBoxName = "address_box";

  static Future<void> init() async {
    await Hive.initFlutter();
    
    // Register Adapters
    _registerAdapters();
    
    // Open Boxes
    await _openBoxes();

  }

  static void _registerAdapters() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ModelAddressAdapter());
    }
  }

  static Future<void> _openBoxes() async {
    await Hive.openBox<ModelAddress>(addressBoxName);
  }

  // Generic methods for productivity
  static Box<T> getBox<T>(String name) => Hive.box<T>(name);
  
  static Future<void> addAddress(ModelAddress address) async {
    final box = getBox<ModelAddress>(addressBoxName);
    await box.add(address);
  }

  static List<ModelAddress> getAllAddresses() {
    final box = getBox<ModelAddress>(addressBoxName);
    return box.values.toList();
  }

  static Future<void> clearAll() async {
    await Hive.box<ModelAddress>(addressBoxName).clear();
  }
}
