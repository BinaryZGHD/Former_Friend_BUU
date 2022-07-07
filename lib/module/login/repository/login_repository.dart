import 'dart:convert';

import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class LoginRepository {
  Future<Response> getScreenLogin(String userLanguage) async {
    return await MyDio.createDioServerTest().post("/ServiceTest/login/loginscreen",
        // queryParameters: {"Language": userLanguage} // for get
        data: jsonEncode({
          "Language": "$userLanguage",
        }) //for post
        );
  }
  // Future<Response> getScreenForgotPassword2() async {
  //   return await MyDio.createDio().post("/v1/api/modules/login/wording/forgotpassword");
  // }
}
