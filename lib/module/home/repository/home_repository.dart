
import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class HomeRepository  {
  Future<Response> getScreenHome() async {
    return await MyDio.createDio().post("/v1/api/modules/home/wording/homestatusactivity");
  }
}