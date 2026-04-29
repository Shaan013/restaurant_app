import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../core/locator/main_locator.dart';
import '../feature/auth/view/login_page.dart';
import '../feature/home/view/home_page.dart';

part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRoute extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page:LoginRoute.page , initial: true),
    AutoRoute(page:HomeRoute.page),
    // AutoRoute(page: ProfileDetailRoute.page),
    // AutoRoute(page: AddUserRoute.page),
    // AutoRoute(page: HiveTestRoute.page),
  ];
}

final appRoute = locator<AppRoute>();
