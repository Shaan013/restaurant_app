import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:restaurant_app/data/models/responses/Food_model.dart';
import 'package:restaurant_app/data/store/food_detail_store.dart';
import '../../../generated/l10n.dart';

class FoodPageObserver extends StatelessWidget {
  final FoodPageStore modelStore;
  final Widget Function(FoodModel model) showData;

  const FoodPageObserver({
    super.key,
    required this.modelStore,
    required this.showData,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (modelStore.hasError) {
          debugPrint(
            "${S.of(context).smsErrorMessage}  ${modelStore.errorMessage}",
          );
          return Center(child: Text(modelStore.errorMessage.toString()));
        }
        if (modelStore.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (modelStore.isSuccess) {
          final FoodModel? userList = modelStore.foodInfo.value;
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
