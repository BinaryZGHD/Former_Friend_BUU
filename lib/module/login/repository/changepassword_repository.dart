
import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class ChangePasswordRepository  {
  Future<Response> getScreenChangePassword() async {
    return await MyDio.createDioTest().post("/v1/api/modules/login/wording/changpassword");
  }
}