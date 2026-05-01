import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:restaurant_app/data/models/responses/Home_model.dart';
import 'package:restaurant_app/data/store/home_store.dart';
import '../../../generated/l10n.dart';

class HomeObserver extends StatelessWidget {
  final HomeStore homeStore;
  final Widget Function(HomeModel user) showData;

  const HomeObserver({
    super.key,
    required this.homeStore,
    required this.showData,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (homeStore.hasError) {
          debugPrint("${S.current.smsErrorMessage} ${homeStore.errorMessage}");
          return Center(child: Text(homeStore.errorMessage.toString()));
        }
        if (homeStore.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (homeStore.isSuccess) {
          final HomeModel? userList = homeStore.homeInfo.value;
          if (userList == null) {
            return Text(S.of(context).somethingWantWrongWithData);
          }
          return showData(userList);
        }
        return Text(S.current.somethingWantWrongWithData);
      },
    );
  }
}
