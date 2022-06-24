
import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class HomeMoreRepository  {
  Future<Response> getScreenHomeMore() async {
    return await MyDio.createDio().post("/v1/api/modules/home/wording/more");
  }
}