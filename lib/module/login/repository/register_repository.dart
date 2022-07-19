import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:f2fbuu/utils/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterRepository {
  Future<Response> getScreenRegister() async {
    final prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguage');
    // String? globalKey = prefs.getString('globalKey')
    // return await MyDio.createDioTest().post("/v1/api/modules/login/wording/register",
    return await MyDio.createDioServerTest().post("ServiceTest/login/registerscreen",
        data: jsonEncode({
          "Language": "$userLanguage",
        }));
  }

  Future<Response> getSubmitRegister(
    String userID,
    String email,
    String phone,
    String name,
    String lastName,
    String password,
    String confirmPassword,
  ) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? userLanguage = prefs.getString('userLanguage');
    // String? globalKey = prefs.getString('globalKey')
    return await MyDio.createDioServerTest().post("ServiceTest/login/registersubmit",
        data: jsonEncode({
          "userID": userID,
          "phone": phone,
          "email": email,
          "name": name,
          "surname": lastName,
          "password": password,
          "confirmPassword": confirmPassword
        }));
  }

  Future<Response> getReSendOTPConfirmRegister(
    String userID,
    String email,
  ) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? userLanguage = prefs.getString('userLanguage');
    // String? globalKey = prefs.getString('globalKey')
    return await MyDio.createDioServerTest().post("/ServiceTest/login/resendotpregister",
        // return await MyDio.createDioTest().post("/response",
        data: jsonEncode({
          "userID": userID,
          "email": email,
        }));
  }

  Future<Response> geSubmitConfirmRegister(
    String userID,
    String email,
    String otp,
  ) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? userLanguage = prefs.getString('userLanguage');
    // String? globalKey = prefs.getString('globalKey')
    return await MyDio.createDioServerTest().post("/ServiceTest/login/registersubmitotp",
        // return await MyDio.createDioTest().post("/response","email": "$email",
        data: jsonEncode({
          "otp": userID,
        }));
  }
}
