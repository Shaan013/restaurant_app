import 'package:get_it/get_it.dart';

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
  // locator.resetSingleton(instance: RestorentRepository);
  // locator.registerSingleton(UserStore());
}
