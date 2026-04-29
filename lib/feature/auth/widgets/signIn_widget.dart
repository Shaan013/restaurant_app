import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/feature/auth/view_model/signin_conttroler.dart';
import 'package:restaurant_app/router/app_route.dart';
import 'package:restaurant_app/util/app_validation.dart';
import 'package:restaurant_app/values/extensions/app_padding_ext.dart';
import 'package:restaurant_app/values/theme/app_colors.dart';
import 'package:restaurant_app/values/theme/app_input_decoration.dart';
import 'package:restaurant_app/widgets/elevated_button_full_width.dart';

import '../../../generated/l10n.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  late SingInConttroler loginConttroler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginConttroler = SingInConttroler();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loginConttroler.dispos();
  }

  @override
  Widget build(BuildContext context) {
    final texttheme = TextTheme.of(context);
    return SingleChildScrollView(
      child: Column(
        spacing: 7.h,
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Text(
            S.of(context).headinggetStartedWithLobster,
            style: texttheme.displayMedium,
            maxLines: 2,
          ),
          Text.rich(
            TextSpan(
              text: "Already have an account? ",
              style: texttheme.bodyLarge,
              children: [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      context.router.replace(LoginRoute(isSigningPage: false));
                    },
                    child: Text("Login Now", style: texttheme.titleLarge),
                  ),
                ),
              ],
            ),
          ),

          Form(
            key: loginConttroler.formKey,
            child: Column(
              spacing: 15.h,
              children: [
                TextFormField(
                  textInputAction: .next,
                  validator: (value) => ValidationHelper.noEmpty(value),
                  controller: loginConttroler.fullNameController,
                  decoration: AppInputDecoration.auth(prefixText: "Full Name "),
                ),
                TextFormField(
                  textInputAction: .next,
                  validator: (value) => ValidationHelper.validateEmail(value),
                  controller: loginConttroler.emailController,
                  decoration: AppInputDecoration.auth(
                    prefixText: "Enter Email",
                  ),
                ),
                TextFormField(
                  textInputAction: .next,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: .numberWithOptions(signed: false),
                  maxLength: 10,
                  validator: (value) => ValidationHelper.validatePhone(value),
                  controller: loginConttroler.phoneNoController,
                  decoration: AppInputDecoration.auth(
                    prefixText: "Enter Phone Number",
                  ),
                ),
                TextFormField(
                  textInputAction: .done,
                  validator: (value) => ValidationHelper.noEmpty(value),
                  controller: loginConttroler.passwordController,
                  decoration: AppInputDecoration.auth(
                    prefixText: "Enter Password",
                  ),
                ),
              ],
            ),
          ),

          fullWidthButton(
            text: "Sign in",
            color: AppColors.orange,
            onTap: () => loginConttroler.handleTrySubmit(context),
            style: texttheme.labelLarge,
          ).pvL,
          96.verticalSpace,
        ],
      ).phvM,
    );
  }
}
