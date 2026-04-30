import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:restaurant_app/core/locator/main_locator.dart';
import 'package:restaurant_app/core/network/api_client.dart';
import 'package:restaurant_app/core/network/base_response.dart';
import 'package:restaurant_app/data/models/responses/Home_model.dart';
import 'package:restaurant_app/data/repository/restorent_repository.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  ObservableFuture<HomeModel?> homeInfo = ObservableFuture.value(null);

  @observable
  String? errorMessage;

  @computed
  bool get isLoading => homeInfo.status == FutureStatus.pending;

  @computed
  bool get hasError => homeInfo.status == FutureStatus.rejected;

  @computed
  bool get isSuccess => homeInfo.status == FutureStatus.fulfilled;

  @action
  Future<void> featchHomeInfo() async {
    try {
      errorMessage = null;
      final restrepo = locator<RestorentRepository>();
      homeInfo = ObservableFuture(restrepo.getHomedetail());
      await homeInfo;
      // final BaseResponse<HomeModel> result = await ;
    } catch (e) {
      errorMessage = e.toString();
      log("errorMassage  : ${e.toString()}");
    }
  }
}
