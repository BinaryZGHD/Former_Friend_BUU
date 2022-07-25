import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:f2fbuu/utils/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ProfileRepository {
  Future<Response> getApiProfile(
      // String user,String password,
      ) async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString("globalKey");
    if (kDebugMode) {
      print(globalKey);
    }
    return await MyDio.createDioTest().post(
      "/v1/api/modules/profile/wording/profile",
      data: jsonEncode({
      })
    );
  }
  Future<Response> sentProfileGeneralData(
      String name,
      String surname,
      String nickname,
      String tel
      ) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? globalKey = prefs.getString("globalKey");
    return await MyDio.createDioTest().post(
      "/v1/api/modules/profile/editgeneral",
        data: jsonEncode({
          "name": name,
          "surname": surname,
          "nickname": nickname,
          "tel": "0"
        })
    );
  }
  Future<Response> sentProfileEducationData(
      String gpaJh,
      String gpaSh,
      String gpaBd
      ) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? globalKey = prefs.getString("globalKey");
    return await MyDio.createDioServerTest().post(
      "/ServiceTest/profile/educational",
      data: jsonEncode({
        "gpAbd": gpaBd,
        "gpAjhs": gpaJh,
        "gpAshs": gpaSh
      })
    );
  } Future<Response> sentProfileAddressData(
      String number,
      String road,
      String subDistrict,
      String district,
      String province,
      String zipcode
      ) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? globalKey = prefs.getString("globalKey");
    return await MyDio.createDioServerTest().post(
      "/ServiceTest/profile/address",
      data: jsonEncode(
          {
            "number": number,
            "village": "village",
            "road": road,
            "subdistrict": subDistrict,
            "district": district,
            "province": province,
            "zipcode": zipcode
          }
      )
    );
  }
  Future<Response> sentProfileContactData(
      String phone,
      String line,
      String facebook,
      String instagram,
      String twitter,
      String youtube
      ) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? globalKey = prefs.getString("globalKey");
    return await MyDio.createDioServerTest().post(
      "/ServiceTest/profile/contact",
      data: jsonEncode(
          {
            "phone": phone,
            "line": line,
            "facebook": facebook,
            "instragram": instagram,
            "twitter": twitter,
            "youtube": youtube
          }
      )
    );
  }
  Future<Response> sentProfileCareerData(
      String attention,
      String status,
      String jobType,
      String career,
      String company,
      String workplace
      ) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? globalKey = prefs.getString("globalKey");
    return await MyDio.createDioServerTest().post(
      "/ServiceTest/profile/career",
      data: jsonEncode(
          {
            "attention": attention,
            "status": status,
            "jobtype": jobType,
            "career": career,
            "company": company,
            "workplace" : workplace
          }
      )
    );
  }
}
