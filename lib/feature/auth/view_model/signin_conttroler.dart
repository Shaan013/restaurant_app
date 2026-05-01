import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/core/locator/main_locator.dart';
import 'package:restaurant_app/data/local_data/share_prefrence_info.dart';
import 'package:restaurant_app/data/repository/user_repository.dart';
import 'package:restaurant_app/router/app_route.dart';
import 'package:restaurant_app/widgets/message_snack_bar.dart';

import '../../../data/models/requasts/Login_model.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/app_overlay_loader.dart';

class SingInConttroler {
  final signInRepository = locator<AuthRepository>();
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final passwordController = TextEditingController();

  LoginModel getModel() {
    return LoginModel(
      fullName: fullNameController.text,
      email: emailController.text,
      phone: phoneNoController.text,
      password: passwordController.text,
    );
  }

  Future<void> handleTrySubmit(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    try {
      AppOverlayLoader.show(context, message: S.of(context).smsSingInUser);
      // print("on loging");
      final bool res = await signInRepository.signin(getModel());
      // print("on loging res  : ${res}");
      if (res == true) {

        showMessage(
          context,
          S.of(context).smsYouSignInSuccessfully,
          type: MessageType.success,
        );

        context.router.replace(HomeRoute());
      } else {
        showMessage(
          context,
          S.current.somethingWentWrongPleaseTryAfterSometime,
          type: MessageType.warning,
        );
      }
      // if (context.mounted) {
      //    context.router.replace(LoginRoute(isSigningPage: false));
      // }
    } catch (e) {
      if (context.mounted) {
        showMessage(context, e.toString(), type: MessageType.error);
      }
    } finally {
      AppOverlayLoader.hide();
    }
  }

  void dispos() {
    fullNameController.dispose();
    emailController.dispose();
    phoneNoController.dispose();
    passwordController.dispose();
  }
}
