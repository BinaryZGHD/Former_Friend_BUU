import 'dart:convert';

import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class ProfileRepository {
  Future<Response> getApiProfile(
      // String user,String password,
      String language,
      String token
      ) async {
    return await MyDio.createDioTest().post(
      "/v1/api/modules/profile/wording/profile",
      data: jsonEncode({
        "language": language,
        "token": token
      })
    );
  }
  Future<Response> sentProfileGeneralData(
      String token,
      String name,
      String surname,
      String nickname,
      String tel
      ) async {
    return await MyDio.createDioTest().post(
      "/v1/api/modules/profile/editgeneral",
        data: jsonEncode({
          "token": "string",
          "name": "string",
          "surname": "string",
          "nickname": "string",
          "tel": "0"
        })
    );
  }
  Future<Response> sentProfileEducationData(
      String token,
      String gpajh,
      String gpash,
      String gpabd
      ) async {
    return await MyDio.createDioServerTest().post(
      "/ServiceTest/profile/educational",
      data: jsonEncode({
        "token": "string",
        "gpAbd": "0",
        "gpAjhs": "0",
        "gpAshs": "0"
      })
    );
  } Future<Response> sentProfileAddressData(
      String token,
      String number,
      String road,
      String subdistrict,
      String district,
      String province,
      String zipcode
      ) async {
    return await MyDio.createDioServerTest().post(
      "/ServiceTest/profile/address",
      data: jsonEncode(
          {
            "token": token,
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
      String token,
      String phone,
      String line,
      String facebook,
      String instragram,
      String twitter,
      String youtube
      ) async {
    return await MyDio.createDioServerTest().post(
      "/ServiceTest/profile/contact",
      data: jsonEncode(
          {
            "token": "string",
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
      String token,
      String attention,
      String status,
      String jobtype,
      String career,
      String company
      ) async {
    return await MyDio.createDioServerTest().post(
      "/ServiceTest/profile/career",
      data: jsonEncode(
          {
            "token": "string",
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
