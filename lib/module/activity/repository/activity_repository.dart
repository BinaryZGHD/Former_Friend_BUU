import 'dart:convert';
import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivityRepository  {
  Future<Response> getScreenActivity() async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString("globalKey");
    return await MyDio.createDioTest().post("/v1/api/modules/activity/wording/add_edit_activity",
    data: jsonEncode({
      "token": globalKey
    })
    );
  }
  Future<Response> submitAddEditActivity(
      String id,
      String activityName,
      String year,
      String term,
      String sDate,
      String fDate,
      String totalTime,
      String venue,
      String approver,
      String detail,
      ) async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString("globalKey");
    return await MyDio.createDioTest().post("/response",
    data: jsonEncode({
      "token": globalKey,
      "activityname": activityName,
      "year": year,
      "term": term,
      "sdate": sDate,
      "fdate": fDate,
      "totaltime": totalTime,
      "venue": venue,
      "approver": approver,
      "detail": detail
    })
    );
  }
  Future<Response> submitDeleteActivity(
      String id,
      ) async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString("globalKey");
    return await MyDio.createDioTest().post("/response",
    data: jsonEncode({
      "token": globalKey,
      "id": id
    })
    );
  }

// Future<Response> getScreenForgotPassword2() async {
//   return await MyDio.createDio().post("/v1/api/modules/login/wording/forgotpassword");
// }
}