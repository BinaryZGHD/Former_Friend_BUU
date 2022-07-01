import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class ProfileRepository  {
  Future<Response> getApiProfile() async {
    return await MyDio.createDioTest().post("/v1/api/modules/profile/wording/profile");
  }
}