
import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class ActivityRepository  {
  Future<Response> getScreenActivity() async {
    return await MyDio.createDio().post("/v1/api/modules/activity/wording/add_edit_activity");
  }
// Future<Response> getScreenForgotPassword2() async {
//   return await MyDio.createDio().post("/v1/api/modules/login/wording/forgotpassword");
// }
}