
import 'dart:convert';

import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class RegisterRepository  {
  Future<Response> getScreenRegister(String userLanguage) async {
    // return await MyDio.createDioTest().post("/v1/api/modules/login/wording/register",
    return await MyDio.createDioServerTest().post("ServiceTest/login/registerscreen",
        data: jsonEncode({
          "Language": "$userLanguage",
        })
    );
  }
  Future<Response> getSubmitRegister(
      String userID,
      String email,
      String phone,
      String name,
      String lastName,
      String password,
      String confirmPassword,
      String userLanguage ) async {
    return await MyDio.createDioServerTest().post("ServiceTest/login/registersubmit",
        data: jsonEncode({
          "userID": "$userID",
          "phone": "$phone",
          "email": "$email",
          "name": "$name",
          "surname": "$lastName",
          "password":"$password",
          "confirmPassword": "$confirmPassword"
        })
    );
  }
  Future<Response> getReSendOTPConfirmRegister(String userID ,String email, String userLanguage ) async {
    return await MyDio.createDioServerTest().post("/ServiceTest/login/resendotpregister",
        // return await MyDio.createDioTest().post("/response",
        data: jsonEncode({
          "userID": "$userID",
          "email": "$email",
        })
    );
  }Future<Response> geSubmitConfirmRegister(String userID ,String email,String otp, String userLanguage ) async {
    return await MyDio.createDioServerTest().post("/ServiceTest/login/registersubmitotp",
        // return await MyDio.createDioTest().post("/response","email": "$email",
        data: jsonEncode({
          "otp": "$userID",
        })
    );
  }

}
