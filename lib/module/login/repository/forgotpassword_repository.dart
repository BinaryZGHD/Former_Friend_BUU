
import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class ForgotPasswordRepository  {
  Future<Response> getScreenForgotPassword() async {
    return await MyDio.createDio().post("/v1/api/modules/login/wording/forgotpassword");
  }
}