
import 'dart:convert';

import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPasswordRepository  {
  Future<Response> getScreenForgotPassword() async {

    final prefs = await SharedPreferences.getInstance();
    String? _userLanguage = prefs.getString('userLanguage');
    return await MyDio.createDioServerTest().post("/ServiceTest/login/forgotscreen",
    // return await MyDio.createDioTest().post("/v1/api/modules/login/wording/forgotpassword",
        data: jsonEncode({
          "Language": "$_userLanguage",
        })
    );
  }
  Future<Response> getSubmitForgotPassword(String userID ,String email ) async {
    final prefs = await SharedPreferences.getInstance();
    String? _userLanguage = prefs.getString('userLanguage');
    return await MyDio.createDioServerTest().post("/ServiceTest/login/sendotpforgot",
    //     return await MyDio.createDioTest().post("/response",
        data: jsonEncode({
          "userID": "$userID",
          "email": "$email",
        })
    );
  }
  Future<Response> getSubmitSetNewForgotPassword(String userID ,String email,String otp ) async {
    final prefs = await SharedPreferences.getInstance();
    String? _userLanguage = prefs.getString('userLanguage');
    // return await MyDio.createDioServerTest().post("/ServiceTest/login/forgotscreen",
    return await MyDio.createDioTest().post("/response",
        data: jsonEncode({
          "userid": "$userID",
          "email": "$email",
          "otp": "$otp",
        })
    );
  } Future<Response> getReSendOTPSetNewForgotPassword(String userID ,String email ) async {
    final prefs = await SharedPreferences.getInstance();
    String? _userLanguage = prefs.getString('userLanguage');
    return await MyDio.createDioServerTest().post("/ServiceTest/login/resendotpforgotpassword",
    // return await MyDio.createDioTest().post("/response",
        data: jsonEncode({
          "userID": "$userID",
          "email": "$email",
        })
    );
  }
}