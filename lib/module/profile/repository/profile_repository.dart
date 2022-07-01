import 'dart:convert';

import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class ProfileRepository  {
  Future<Response> getApiProfile(
      // String user,String password,
      ) async {
    return await MyDio.createDio().post("/v1/api/modules/profile/wording/profile",
      // data: jsonEncode()
    );
  }
}