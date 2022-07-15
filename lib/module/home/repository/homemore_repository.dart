import 'dart:convert';

import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeMoreRepository {
  Future<Response> getScreenHomeMoreBoardStudent() async {
    final prefs = await SharedPreferences.getInstance();
    String? global_key = prefs.getString('global_key');
    return await MyDio.createDioTest().post("/v1/api/modules/home/more/data/boardstudy",
        data: jsonEncode({
          "token": global_key
        })
    );
  }

  Future<Response> getScreenHomeMoreBoardTeacher() async {
    final prefs = await SharedPreferences.getInstance();
    String? global_key = prefs.getString('global_key');
    return await MyDio.createDioTest().post("/v1/api/modules/home/more/data/boardteacher",
        data: jsonEncode({
          "token": global_key
        })
    );
  }

  Future<Response> getScreenHomeMoreContactUs() async {
    final prefs = await SharedPreferences.getInstance();
    String? global_key = prefs.getString('global_key');
    return await MyDio.createDioTest().post("/v1/api/modules/home/wording/moreerror",
        data: jsonEncode({
          "token": global_key
        })
    );
  }

  Future<Response> getScreenHomeMoreFAQ() async {
    final prefs = await SharedPreferences.getInstance();
    String? global_key = prefs.getString('global_key');
    return await MyDio.createDioTest().post("/v1/api/modules/home/more/faq",
        data: jsonEncode({
          "token": global_key
        })
    );
  }
  Future<Response> getScreenHomeMoreDetailStudent() async {
    final prefs = await SharedPreferences.getInstance();
    String? global_key = prefs.getString('global_key');
    return await MyDio.createDioTest().post("/v1/api/modules/home/wording/moreerror",
        data: jsonEncode({
          "token": global_key
        })
    );
  }
  Future<Response> getScreenHomeMorePDPA() async {
    final prefs = await SharedPreferences.getInstance();
    String? global_key = prefs.getString('global_key');
    return await MyDio.createDioTest().post("/v1/api/modules/login/wording/PDPA",
        data: jsonEncode({
          "token": global_key
        })
    );
  }

}
