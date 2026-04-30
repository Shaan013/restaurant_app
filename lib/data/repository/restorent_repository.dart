import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:restaurant_app/core/locator/main_locator.dart';
import 'package:restaurant_app/core/network/api_client.dart';
import 'package:restaurant_app/core/network/base_response.dart';
import 'package:restaurant_app/data/models/responses/Food_model.dart';
import 'package:restaurant_app/data/models/responses/Home_model.dart';

import '../../core/exceptions/dio_exception_util.dart';

class RestorentRepository {
  final _apiClaint = locator<ApiClient>();

  dynamic chackSussece(BaseResponse<dynamic> model) {
    if (model.code == 200.toString() && model.data != null) {
      print("i am in 200");
      return model.data!;
    } else if (model.data == null) {
      throw "empty data found";
    } else {
      print("i am in wrong place");
      throw "some thing want wrong !!!";
      // return false;
    }
  }

  Future<HomeModel> getHomedetail() async {
    try {
      final BaseResponse<HomeModel> result = await _apiClaint.getHomeInfo();

      return chackSussece(result);
    } on DioException catch (e) {
      log("message  : ${e.message}");

      final massage = DioExceptionUtil.handleError(e);
      log("error massege : $massage");
      throw massage;
    } catch (e) {
      print("e ${e}");
      rethrow;
    }
  }

  Future<FoodModel> getFoodDatail({required int id}) async {
    try {
      final BaseResponse<FoodModel> result = await _apiClaint.getFoodDetailById(
        id,
      );

      return chackSussece(result);
    } on DioException catch (e) {
      log("message  : ${e.message}");

      final massage = DioExceptionUtil.handleError(e);
      log("error massege : $massage");
      throw massage;
    } catch (e) {
      print("e ${e}");
      rethrow;
    }
  }
}
