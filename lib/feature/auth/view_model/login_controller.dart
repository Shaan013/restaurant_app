import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/locator/main_locator.dart';
import 'package:restaurant_app/data/repository/user_repository.dart';
import 'package:restaurant_app/router/app_route.dart';

import '../../../data/models/requasts/Login_model.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/app_overlay_loader.dart';
import '../../../widgets/message_snack_bar.dart';

class LoginController {
  final loginRepository = locator<AuthRepository>();
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
      AppOverlayLoader.show(context, message: S.current.smsLoginUser);
      final res = await loginRepository.checkLogin(getModel());
      if (res == true) {
        showMessage(
          context,
          S.of(context).smsYouLoginInSuccessfully,
          type: MessageType.success,
        );
        context.router.replace(HomeRoute());
      } else {
        showMessage(
          context,
          S.of(context).smsSomethingWantWrongPleaseTryAgain,
          type: MessageType.warning,
        );
      }

      if (context.mounted) {
        // context.router.replace(LoginRoute(isSigningPage: false));
      }
    } catch (e) {
      if (context.mounted) {
        showMessage(context, e.toString(), type: MessageType.error);
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
