import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:restaurant_app/core/locator/main_locator.dart';
import 'package:restaurant_app/router/app_route.dart';

import '../data/local_data/share_prefrence_info.dart';

class AuthGard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final bool islogedIn = await locator<SharePrefrenceInfo>().isLogedIn();
    if (islogedIn) {
      resolver.next(true);
    } else {
      router.push(LoginRoute());
    }
  }
}
