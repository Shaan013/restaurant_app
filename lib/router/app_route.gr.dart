// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

/// generated route for
/// [FoodDetailPage]
class FoodDetailRoute extends PageRouteInfo<FoodDetailRouteArgs> {
  FoodDetailRoute({Key? key, required int id, List<PageRouteInfo>? children})
    : super(
        FoodDetailRoute.name,
        args: FoodDetailRouteArgs(key: key, id: id),
        initialChildren: children,
      );

  static const String name = 'FoodDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FoodDetailRouteArgs>();
      return FoodDetailPage(key: args.key, id: args.id);
    },
  );
}

class FoodDetailRouteArgs {
  const FoodDetailRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'FoodDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FoodDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    bool isSigningPage = true,
    List<PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(key: key, isSigningPage: isSigningPage),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return LoginPage(key: args.key, isSigningPage: args.isSigningPage);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.isSigningPage = true});

  final Key? key;

  final bool isSigningPage;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, isSigningPage: $isSigningPage}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginRouteArgs) return false;
    return key == other.key && isSigningPage == other.isSigningPage;
  }

  @override
  int get hashCode => key.hashCode ^ isSigningPage.hashCode;
}
