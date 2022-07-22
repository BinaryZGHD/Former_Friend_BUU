import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:f2fbuu/utils/dio.dart';
import 'package:f2fbuu/utils/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {
  Future<Response> getScreenHome() async {
    final prefs = await SharedPreferences.getInstance();
    // String? userLanguage = prefs.getString('userLanguage');
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post("/v1/api/modules/home/home",
        // return await MyDio.createDioTest().post("/v1/api/modules/home/home",
        data: jsonEncode({"token": globalKey}));
  }

  Future<Response> getApiProfile() async {
    // final prefs = await SharedPreferences.getInstance();
    // String? globalKey = prefs.getString('globalKey');
    // String token = await getGlobalKey() ?? "";
    return await MyDio.createDioServerTest().post("/ServiceTest/profile/profilescreen",
        //   print(" token getGlobalKey() : $token");
        //   options: Options(headers["Authorization"] = "Bearer $token");
        // options: Options(headers: {"Authorization": "Bearer $token"}),
        // return await MyDio.createDioTest().post("/v1/api/modules/profile/wording/profile",
        data: jsonEncode({}));
  }

  Future<Response> getApiActivity() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post(
        "/v1/api/modules/activity/wording/statusactivity"
        // return await MyDio.createDio().post("/v1/api/modules/home/wording/homestatusactivity");
        ,
        data: jsonEncode({"token": globalKey}));
  }

  Future<Response> getLogoutHome() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post(
        "/response"
        // return await MyDio.createDio().post("/v1/api/modules/home/wording/homestatusactivity");
        ,
        data: jsonEncode({"token": globalKey}));
  }

  Future<Response> getChangeLanguageHome(String userLanguage) async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    String? userLanguage = prefs.getString('userLanguage');
    return await MyDio.createDioTest().post(
        "/response"
        // return await MyDio.createDio().post("/v1/api/modules/home/wording/homestatusactivity");
        ,
        data: jsonEncode({"token": globalKey, "Language": userLanguage}));
  }

  Future<Response> getAlertLogout() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post(
        "/alert/logout"
        // return await MyDio.createDio().post("/v1/api/modules/home/wording/homestatusactivity");
        ,
        data: jsonEncode({"token": globalKey}));
  }

  Future<Response> getAlertDeleteAccount() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post(
        "/alert/deleteaccount"
        // return await MyDio.createDio().post("/v1/api/modules/home/wording/homestatusactivity");
        ,
        data: jsonEncode({"token": globalKey}));
  }

  Future<Response> getApiNoActivity() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString('globalKey');
    return await MyDio.createDioTest().post(
        "/alert/noactivity"
        // return await MyDio.createDio().post("/v1/api/modules/home/wording/homestatusactivity");
        ,
        data: jsonEncode({"token": globalKey}));
  }
}
