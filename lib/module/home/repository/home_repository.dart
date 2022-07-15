
import 'dart:convert';

import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository  {
  Future<Response> getScreenHome() async {
    final prefs = await SharedPreferences.getInstance();
    String? _userLanguage = prefs.getString('userLanguage');
    String? global_key = prefs.getString('global_key');
    return await MyDio.createDioTest().post("/v1/api/modules/home/wording/homemore",
        data: jsonEncode({
          "Language": _userLanguage
        })
    );
  }
  Future<Response> getApiProfile() async {
    final prefs = await SharedPreferences.getInstance();
    String? global_key = prefs.getString('global_key');
    return await MyDio.createDioTest().post("/v1/api/modules/profile/wording/profile",
        data: jsonEncode({
          "token": global_key
        })
    );
  }
  Future<Response> getApiActivity() async {
    final prefs = await SharedPreferences.getInstance();
    String? global_key = prefs.getString('global_key');
    return await MyDio.createDioTest().post("/v1/api/modules/activity/wording/statusactivity"
        // return await MyDio.createDio().post("/v1/api/modules/home/wording/homestatusactivity");
        , data: jsonEncode({
          "token": global_key
        })
    );

  }
}