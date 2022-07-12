import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class HomeMoreRepository {
  Future<Response> getScreenHomeMoreBoardStudent() async {
    return await MyDio.createDioTest().post("/v1/api/modules/home/more/data/boardstudy");
  }

  Future<Response> getScreenHomeMoreBoardTeacher() async {
    return await MyDio.createDioTest().post("/v1/api/modules/home/more/data/boardteacher");
  }

  Future<Response> getScreenHomeMoreContactUs() async {
    return await MyDio.createDioTest().post("/v1/api/modules/home/wording/moreerror");
  }

  Future<Response> getScreenHomeMoreFAQ() async {
    return await MyDio.createDioTest().post("/v1/api/modules/home/more/faq");
  }
  Future<Response> getScreenHomeMoreDetailStudent() async {
    return await MyDio.createDioTest().post("/v1/api/modules/home/wording/moreerror");
  }
  Future<Response> getScreenHomeMorePDPA() async {
    return await MyDio.createDioTest().post("/v1/api/modules/login/wording/PDPA");
  }

}
