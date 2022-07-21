import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:f2fbuu/utils/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreRepository {
  Future<Response> getScreenHomeMoreBoardStudent() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post("/v1/api/modules/home/more/data/boardstudy",
        data: jsonEncode({
          "token": globalKey
        })
    );
  }

  Future<Response> getScreenHomeMoreBoardTeacher() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post("/v1/api/modules/home/more/data/boardteacher",
        data: jsonEncode({
          "token": globalKey
        })
    );
  }

  Future<Response> getScreenHomeMoreContactUs() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post("/v1/api/modules/home/wording/moreerror",
        data: jsonEncode({
          "token": globalKey
        })
    );
  }

  Future<Response> getScreenHomeMoreFAQ() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post("/v1/api/modules/home/more/faq",
        data: jsonEncode({
          "token": globalKey
        })
    );
  }
  Future<Response> getScreenHomeMoreDetailStudent() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post("/v1/api/modules/home/wording/moreerror",
        data: jsonEncode({
          "token": globalKey
        })
    );
  }
  Future<Response> getScreenHomeMorePDPA() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post("/v1/api/modules/login/wording/PDPA",
        data: jsonEncode({
          "token": globalKey
        })
    );
  }

}
