import 'package:dio/dio.dart';
import 'package:restaurant_app/core/network/api_endpoint.dart';
import 'package:restaurant_app/data/models/requasts/Login_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../data/models/responses/User_model.dart';
import 'base_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "http://192.168.1.243:2365/api/1/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST(ApiEndpoint.login)
  Future<BaseResponse<UserModel>> login(@Body() LoginModel loginInfo);
  
  @POST(ApiEndpoint.signup)
  Future<BaseResponse<UserModel>> signInAccount(@Body() LoginModel loginInfo);


  // @GET(ApiEndpoint.h)

  //
  // @GET("users/{id}")
  // Future<UserModel> getUserById(@Path('id') int id);
  //
  // @POST("users")
  // Future<UserModel> addUser(@Body() UserModel user);
  //
  // @PUT("users/{id}")
  // // @Header("Content-Type", "application/json")
  // Future<UserModel> updateUser(@Path("id") int id, @Body() UserModel user);
  //
  // @DELETE("users/{id}")
  // Future<UserModel> deleteUser(@Path('id') int it);
}
