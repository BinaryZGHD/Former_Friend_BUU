
import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class LoginRepository  {
  Future<Response> getScreenLogin() async {
    return await MyDio.createDio().post("/v1/api/modules/login/wording/login");
  }
}