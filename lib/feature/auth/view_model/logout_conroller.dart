import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/locator/main_locator.dart';
import '../../../data/local_data/share_prefrence_info.dart';
import '../../../data/repository/user_repository.dart';
import '../../../router/app_route.dart';
import '../../../widgets/app_overlay_loader.dart';
import '../../../widgets/message_snack_bar.dart';

class LogoutConroller {
  Future<void> handleTryLogout(BuildContext context) async {
    final logoutRepository = locator<AuthRepository>();
    try {
      AppOverlayLoader.show(context, message: "Adding User...");
      final bool res = await logoutRepository.logOut(1);

      if (res) {
        showMessage(context, "please tyr again  ", type: .error);
      }
      locator<SharePrefrenceInfo>().setLogedOut();
      context.router.replaceAll([LoginRoute()]);
      showMessage(context, "you log out sussecfully ", type: .success);
    } catch (e) {
      if (context.mounted) {
        showMessage(context, e.toString(), type: MessageType.error);
      }
    } finally {
      AppOverlayLoader.hide();
    }
  }
}
