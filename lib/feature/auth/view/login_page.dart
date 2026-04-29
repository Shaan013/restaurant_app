import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/requasts/Login_model.dart';
import 'package:restaurant_app/data/repository/user_repository.dart';
import 'package:restaurant_app/generated/assets.dart';

import '../../../core/locator/main_locator.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;
    return Scaffold(
      bottomSheet: BottomSheet(
        enableDrag: false,
        animationController: AnimationController(vsync: this),
        backgroundColor: themeColors.surface,
        dragHandleSize: Size(100, 10),
        showDragHandle: true,
        onClosing: () {},
        builder: (context) {
          return Text(" data");
        },
      ),
      backgroundColor: themeColors.primaryContainer,
      body: Stack(
        children: [
          Align(
            alignment: .topRight,
            child: Image.asset(Assets.images.pizza.path),
          ),
          // BottomSheet(
          //   backgroundColor: themeColors.surface,
          //   dragHandleSize: Size(100, 10),
          //   showDragHandle: true,
          //   onClosing: () {},
          //   builder: (context) {
          //     return Text(" data");
          //   },
          // ),
        ],
      ),
    );
  }
}
