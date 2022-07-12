import 'dart:convert';

import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class ProfileRepository {
  Future<Response> getApiProfile(
      // String user,String password,
      ) async {
    return await MyDio.createDioTest().post(
      "/v1/api/modules/profile/wording/profile",
      // data: jsonEncode()
    );
  }
  Future<Response> getProfileGeneralData(
      String token,
      String name,
      String surname,
      String nickname,
      String tel
      ) async {
    return await MyDio.createDioTest().post(
      "/v1/api/modules/profile/editgeneral",
        data: jsonEncode({
          "token":"string",
          "name": "string",
          "surname": "string",
          "nickname": "string"
        })
    );
  }
  Future<Response> getProfileEducationData(
      // String user,String password,
      ) async {
    return await MyDio.createDioTest().post(
      "/v1/api/modules/profile/editgeneral",
      // data: jsonEncode()
    );
  } Future<Response> getProfileAddressData(
      // String user,String password,
      ) async {
    return await MyDio.createDioTest().post(
      "/v1/api/modules/profile/wording/profile",
      // data: jsonEncode()
    );
  }
  Future<Response> getProfileContactData(
      // String user,String password,
      ) async {
    return await MyDio.createDioTest().post(
      "/v1/api/modules/profile/wording/profile",
      // data: jsonEncode()
    );
  }
  Future<Response> getProfileCareerData(
      // String user,String password,
      ) async {
    return await MyDio.createDioTest().post(
      "/v1/api/modules/profile/wording/profile",
      // data: jsonEncode()
    );
  }
}
