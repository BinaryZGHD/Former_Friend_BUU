
import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class LoginRepository  {
  Future<Response> getScreenLogin() async {
    return await MyDio.createDioTest().post("/v1/api/modules/login/wording/login");
  }
  // Future<Response> getScreenForgotPassword2() async {
  //   return await MyDio.createDio().post("/v1/api/modules/login/wording/forgotpassword");
  // }
}
