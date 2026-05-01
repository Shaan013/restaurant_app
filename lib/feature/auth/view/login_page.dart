import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/feature/auth/widgets/login_widget.dart';
import 'package:restaurant_app/feature/auth/widgets/signIn_widget.dart';
import 'package:restaurant_app/generated/assets.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  final bool isSigningPage;

  const LoginPage({super.key, this.isSigningPage = true});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: themeColors.primaryContainer,
      body: Stack(
        children: [
          Align(
            alignment: .topRight,
            child: Image.asset(Assets.images.pizza.path),
          ),
          Align(
            alignment: .bottomCenter,
            child: BottomSheet(
              enableDrag: false,
              // animationController: AnimationController(vsync: this),
              backgroundColor: themeColors.surface,
              dragHandleSize: Size(100, 10),
              // showDragHandle: true,
              onClosing: () {},
              builder: (context) {
                return widget.isSigningPage ? SignupWidget() : LoginWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
