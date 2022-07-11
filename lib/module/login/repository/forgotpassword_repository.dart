
import 'dart:convert';

import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class ForgotPasswordRepository  {
  Future<Response> getScreenForgotPassword(String userLanguage) async {
    return await MyDio.createDioServerTest().post("/ServiceTest/login/forgotscreen",
    // return await MyDio.createDioTest().post("/v1/api/modules/login/wording/forgotpassword",
        data: jsonEncode({
          "Language": "$userLanguage",
        })
    );
  }
  Future<Response> getSubmitForgotPassword(String userID ,String email ) async {
    // return await MyDio.createDioServerTest().post("/ServiceTest/login/forgotscreen",
        return await MyDio.createDioTest().post("/response",
        data: jsonEncode({
          "userid": "$userID",
          "email": "$email",
        })
    );
  }
  Future<Response> getSubmitSetNewForgotPassword(String userID ,String email,String otp ) async {
    // return await MyDio.createDioServerTest().post("/ServiceTest/login/forgotscreen",
    return await MyDio.createDioTest().post("/response",
        data: jsonEncode({
          "userid": "$userID",
          "email": "$email",
          "otp": "$otp",
        })
    );
  }

}