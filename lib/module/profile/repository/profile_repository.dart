import 'dart:convert';

import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ProfileRepository {
  Future<Response> getApiProfile(
      // String user,String password,
      ) async {
    final prefs = await SharedPreferences.getInstance();
    String? global_key = prefs.getString("global_key");
    return await MyDio.createDioTest().post(
      "/v1/api/modules/profile/wording/profile",
      data: jsonEncode({
        "token": global_key
      })
    );
  }
  Future<Response> sentProfileGeneralData(
      String name,
      String surname,
      String nickname,
      String tel
      ) async {
    final prefs = await SharedPreferences.getInstance();
    String? global_key = prefs.getString("global_key");
    return await MyDio.createDioTest().post(
      "/v1/api/modules/profile/editgeneral",
        data: jsonEncode({
          "token": global_key,
          "name": "string",
          "surname": "string",
          "nickname": "string",
          "tel": "0"
        })
    );
  }
  Future<Response> sentProfileEducationData(
      String gpajh,
      String gpash,
      String gpabd
      ) async {
    final prefs = await SharedPreferences.getInstance();
    String? global_key = prefs.getString("global_key");
    return await MyDio.createDioServerTest().post(
      "/ServiceTest/profile/educational",
      data: jsonEncode({
        "token": global_key,
        "gpAbd": "0",
        "gpAjhs": "0",
        "gpAshs": "0"
      })
    );
  } Future<Response> sentProfileAddressData(
      String number,
      String road,
      String subdistrict,
      String district,
      String province,
      String zipcode
      ) async {
    final prefs = await SharedPreferences.getInstance();
    String? global_key = prefs.getString("global_key");
    return await MyDio.createDioServerTest().post(
      "/ServiceTest/profile/address",
      data: jsonEncode(
          {
            "token": global_key,
            "number": number,
            "village": "village",
            "road": road,
            "subdistrict": subdistrict,
            "district": district,
            "province": province,
            "zipcode": "20000"
          }
      )
    );
  }
  Future<Response> sentProfileContactData(
      String phone,
      String line,
      String facebook,
      String instragram,
      String twitter,
      String youtube
      ) async {
    final prefs = await SharedPreferences.getInstance();
    String? global_key = prefs.getString("global_key");
    return await MyDio.createDioServerTest().post(
      "/ServiceTest/profile/contact",
      data: jsonEncode(
          {
            "token": global_key,
            "phone": "0",
            "line": "string",
            "facebook": "string",
            "instragram": "string",
            "twitter": "string",
            "youtube": "string"
          }
      )
    );
  }
  Future<Response> sentProfileCareerData(
      String attention,
      String status,
      String jobtype,
      String career,
      String company
      ) async {
    final prefs = await SharedPreferences.getInstance();
    String? global_key = prefs.getString("global_key");
    return await MyDio.createDioServerTest().post(
      "/ServiceTest/profile/career",
      data: jsonEncode(
          {
            "token": global_key,
            "attention": "string",
            "status": "string",
            "jobtype": "string",
            "career": "string",
            "company": "string"
          }
      )
    );
  }
}
