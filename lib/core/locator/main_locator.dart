import 'package:get_it/get_it.dart';
import 'package:restaurant_app/core/db/hive/hive_service.dart';
import 'package:restaurant_app/data/local_data/share_prefrence_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repository/restorent_repository.dart';
import '../../data/repository/user_repository.dart';
import '../../data/store/user_list_store.dart';
import '../../router/app_route.dart';
import '../network/api_client.dart';
import '../network/dio_client.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // locator.registerSingleton();

  locator.registerSingleton<AppRoute>(AppRoute());
  locator.registerSingleton(ApiClient(DioClient.dioMain));
  locator.registerSingleton(AuthRepository());
  locator.registerSingleton(RestorentRepository());
  locator.registerSingleton(HiveService());
  locator.registerSingleton(
    SharePrefrenceInfo(await SharedPreferences.getInstance()),
  );
  // locator.resetSingleton(instance: RestorentRepository);
  // locator.registerSingleton(UserStore());
}
