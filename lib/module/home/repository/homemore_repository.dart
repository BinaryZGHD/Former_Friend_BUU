import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class HomeMoreRepository {
  Future<Response> getScreenHomeMoreBoardStudent() async {
    return await MyDio.createDio().post("/v1/api/modules/home/more/data/boardstudy");
  }

  Future<Response> getScreenHomeMoreBoardTeacher() async {
    return await MyDio.createDio().post("/v1/api/modules/home/more/data/boardteacher");
  }
}
