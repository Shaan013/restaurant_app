import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:restaurant_app/data/models/responses/Food_model.dart';

import '../../core/locator/main_locator.dart';
import '../repository/restorent_repository.dart';

part 'food_detail_store.g.dart';

class FoodPageStore = FoodPageStoreBase with _$FoodPageStore;

abstract class FoodPageStoreBase with Store {
  @observable
  ObservableFuture<FoodModel?> foodInfo = ObservableFuture.value(null);

  @observable
  String? errorMessage;

  @computed
  bool get isLoading => foodInfo.status == FutureStatus.pending;

  @computed
  bool get hasError => foodInfo.status == FutureStatus.rejected;

  @computed
  bool get isSuccess => foodInfo.status == FutureStatus.fulfilled;

  @action
  Future<void> featchFoodInfo(int id) async {
    try {
      errorMessage = null;
      final restrepo = locator<RestorentRepository>();
      foodInfo = ObservableFuture(restrepo.getFoodDatail(id: id));
      await foodInfo;
      // final BaseResponse<HomeModel> result = await ;
    } catch (e) {
      errorMessage = e.toString();
      log("errorMassage  : ${e.toString()}");
    }
  }
}
