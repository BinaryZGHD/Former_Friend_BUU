
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

}
