
import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class HomeRepository  {
  Future<Response> getScreenHome() async {
    return await MyDio.createDioTest().post("/v1/api/modules/home/wording/homemore");
  }
  Future<Response> getApiProfile() async {
    return await MyDio.createDioTest().post("/v1/api/modules/profile/wording/profile");
  }
  Future<Response> getApiActivity() async {
    return await MyDio.createDioTest().post("/v1/api/modules/activity/wording/statusactivity");
    // return await MyDio.createDio().post("/v1/api/modules/home/wording/homestatusactivity");
  }
}