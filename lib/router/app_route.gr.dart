// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

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
