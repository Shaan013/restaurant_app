import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:restaurant_app/core/network/base_response.dart';
import 'package:restaurant_app/data/local_data/share_prefrence_info.dart';
import 'package:restaurant_app/data/models/requasts/Login_model.dart';
import 'package:restaurant_app/data/models/requasts/Logout_model.dart';
import 'package:restaurant_app/data/models/responses/User_model.dart';
import '../../core/exceptions/dio_exception_util.dart';
import '../../core/locator/main_locator.dart';
import '../../core/network/api_client.dart';

class AuthRepository {
  final ApiClient _apiClient = locator<ApiClient>();

  bool chackSussece(String? code) {
    if (code == 200.toString()) {
      print("i am in 200");
      return true;
    } else {
      print("i am in wrong place");
      return false;
    }
  }

  Future<bool> checkLogin(LoginModel loginInfo) async {
    try {
      final BaseResponse<UserModel> result = await _apiClient.login(loginInfo);
      print("result.code  ${result.code}");
      if (result.code == 200.toString()) {
        locator<SharePrefrenceInfo>().setLogedIn(result.data!.id!);
      }
      return chackSussece(result.code);
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

  Future<bool> signin(LoginModel user) async {
    try {
      final BaseResponse<UserModel> result = await _apiClient.signInAccount(
        user,
      );
      print("result.code  ${result.code} ${result.code.runtimeType}");

      if (result.code == 200.toString()) {
        locator<SharePrefrenceInfo>().setLogedIn(result.data!.id!);
        print("i am in 200");
        return true;
      } else {
        print("i am in wrong place");
        return false;
      }
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

  Future<bool> logOut() async {
    try {
      final int uid = locator<SharePrefrenceInfo>().getId()!;
      final BaseResponse<dynamic> result = await _apiClient.logOut(
        LogoutModel(userId: uid),
      );
      if (result.code == 200.toString()) {
        locator<SharePrefrenceInfo>().setLogedOut();
      }
      return chackSussece(result.code);
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

  // Future<List<UserModel>> getAllUser() async {
  //   try {
  //     final List<UserModel> result = await _apiClient.getAllUser();
  //     return result;
  //   } on DioException catch (e) {
  //     log("message  : ${e.message}");
  //
  //     final massage = DioExceptionUtil.handleError(e);
  //     log("error massege : $massage");
  //     throw massage;
  //   } catch (e) {
  //     print("e ${e}");
  //     rethrow;
  //   }
  // }
  //
  // Future<UserModel> getUserById(int id) async {
  //   try {
  //     final UserModel userModel = await _apiClient.getUserById(id);
  //     print("object : user :${userModel.id}");
  //     return userModel;
  //   } on DioException catch (e) {
  //     log("message  : ${e.message}");
  //     final massage = DioExceptionUtil.handleError(e);
  //     log("error massege : $massage");
  //     throw massage;
  //   } catch (e) {
  //     print("e ${e}");
  //     rethrow;
  //   }
  // }
  //
  // Future<bool> addUser(UserModel user) async {
  //   try {
  //     final res = await _apiClient.addUser(user);
  //     print("add result :  ${res.id}");
  //     if (res != null) {
  //       return true;
  //     }
  //   } on DioException catch (e) {
  //     log("message  : ${e.message}");
  //     final massage = DioExceptionUtil.handleError(e);
  //     log("error massege : $massage");
  //     throw massage;
  //   } catch (e) {
  //     print("e ${e}");
  //     rethrow;
  //   }
  // }
}
