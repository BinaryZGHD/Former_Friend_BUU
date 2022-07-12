
import 'dart:convert';

import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class PDPARepository  {
  Future<Response> getScreenPDPA(String userLanguage) async {
    return await MyDio.createDioServerTest().post("/ServiceTest/login/pdpascreen",
    // return await MyDio.createDioTest().post("/v1/api/modules/login/wording/PDPA",
        data: jsonEncode({
          "Language": "$userLanguage",
        })
    );
  }

}
