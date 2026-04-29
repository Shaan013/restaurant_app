import 'package:flutter/material.dart';

import '../../../data/models/requasts/Login_model.dart';
import '../../../widgets/app_overlay_loader.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  LoginModel getModel() {
    return LoginModel(
      email: emailController.text,
      // phone: phoneNoController.text,
      password: passwordController.text,
    );
  }

  Future<void> handleTrySubmit(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    try {
      AppOverlayLoader.show(context, message: "Adding User...");
      print("on loging");
      await Future.delayed(Duration(seconds: 2));
      print("on loging");

      if (context.mounted) {
        // context.router.replace(LoginRoute(isSigningPage: false));
      }
    } catch (e) {
      if (context.mounted) {
        // showMessage(context, e.toString(), type: MessageType.error);
      }
    } finally {
      AppOverlayLoader.hide();
    }
  }

  void dispos() {
    // fullNameController.dispose();
    emailController.dispose();
    // phoneNoController.dispose();
    passwordController.dispose();
  }
}
