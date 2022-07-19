
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:f2fbuu/utils/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PDPARepository  {
  Future<Response> getScreenPDPA() async {

    final prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguage');

    return await MyDio.createDioServerTest().post("/ServiceTest/login/pdpascreen",
    // return await MyDio.createDioTest().post("/v1/api/modules/login/wording/PDPA",
        data: jsonEncode({
          "Language": "$userLanguage",
        })
    );
  }

}
