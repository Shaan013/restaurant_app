import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/values/extensions/app_padding_ext.dart';

import '../../../generated/l10n.dart';
import '../../../router/app_route.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return SingleChildScrollView(
      child: Column(
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
        ],
      ).phvM,
    );
  }
}
