import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/feature/auth/view_model/login_controller.dart';
import 'package:restaurant_app/util/app_validation.dart';
import 'package:restaurant_app/values/extensions/app_padding_ext.dart';
import 'package:restaurant_app/values/theme/app_colors.dart';
import 'package:restaurant_app/values/theme/app_input_decoration.dart';
import 'package:restaurant_app/widgets/elevated_button_full_width.dart';
import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../router/app_route.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late final LoginController _loginController;
  final List<Map<String, dynamic>> diffrentLoingMap = [
    {
      "name": "FaceBook",
      "svgUrl": Assets.svgs.facebookLogo.path,
      "color": AppColors.blue,
    },
    {
      "name": "Google",
      "svgUrl": Assets.svgs.googleLogo.path,
      "color": AppColors.white,
      "styleColor": AppColors.grey,
    },

    {
      "name": "Apple",
      "svgUrl": Assets.svgs.appleLogo.path,
      "color": AppColors.grey,
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginController = LoginController();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return SingleChildScrollView(
      child: Column(
        spacing: 7.h,
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Text(
            S.of(context).headinggetStartedWithLobster,
            style: textTheme.displayMedium,
            maxLines: 2,
          ),
          Text.rich(
            TextSpan(
              text: "Don’t have an account? ",
              style: textTheme.bodyLarge,
              children: [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      context.router.replace(LoginRoute(isSigningPage: true));
                    },
                    child: Text("Signup Now", style: textTheme.titleLarge),
                  ),
                ),
              ],
            ),
          ),
          Form(
            key: _loginController.formKey,
            child: Column(
              crossAxisAlignment: .end,
              spacing: 15.h,
              children: [
                TextFormField(
                  textInputAction: .next,
                  keyboardType: .emailAddress,
                  controller: _loginController.emailController,
                  validator: (value) => ValidationHelper.validateEmail(value),
                  decoration: AppInputDecoration.auth(prefixText: S.of(context).lblEmail),
                ),
                TextFormField(
                  textInputAction: .done,
                  controller: _loginController.passwordController,
                  validator: (value) => ValidationHelper.noEmpty(value),
                  decoration: AppInputDecoration.auth(prefixText: S.of(context).lblPassword),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(S.of(context).lblForgotPassword, style: textTheme.bodyLarge),
                ),
              ],
            ),
          ),
          fullWidthButton(
            text: S.of(context).logIn,
            color: Theme.of(context).colorScheme.primary,
            style: textTheme.labelLarge,
            onTap: () => _loginController.handleTrySubmit(context),
          ),
          Center(child: Text("Or Continue", style: textTheme.titleMedium)),
          ...diffrentLoingMap.map((item) {
            return fullWidthButton(
              text: item["name"],
              color: item['color'],
              label: SvgPicture.asset(item['svgUrl']),
              style: item["styleColor"] == null
                  ? textTheme.labelLarge
                  : textTheme.labelLarge!.copyWith(color: item['styleColor']),
            ).pvS;
          }),
        ],
      ).phvM,
    );
  }
}
