import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:f2fbuu/utils/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreRepository {
  Future<Response> getScreenMoreInfo() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post("/v1/api/modules/home/more",
        data: jsonEncode({
          "token": globalKey
        })
    );
  }
  Future<Response> getScreenMoreBoardStudent() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post("/v1/api/modules/home/more/data/boardstudy",
        data: jsonEncode({
          "token": globalKey
        })
    );
  }

  Future<Response> getScreenMoreBoardTeacher() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post("/v1/api/modules/home/more/data/boardteacher",
        data: jsonEncode({
          "token": globalKey
        })
    );
  }

  Future<Response> getScreenMoreContactUs() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post("/v1/api/modules/home/wording/moreerror",
        data: jsonEncode({
          "token": globalKey
        })
    );
  }

  Future<Response> getScreenMoreFAQ() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post("/v1/api/modules/home/more/faq",
        data: jsonEncode({
          "token": globalKey
        })
    );
  }
  Future<Response> getScreenMoreDetailStudent() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post("/v1/api/modules/home/wording/moreerror",
        data: jsonEncode({
          "token": globalKey
        })
    );
  }
  Future<Response> getScreenMorePDPA() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post("/v1/api/modules/login/wording/PDPA",
        data: jsonEncode({
          "token": globalKey
        })
    );
  }

}
