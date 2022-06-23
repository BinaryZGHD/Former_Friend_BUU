
import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

class PDPARepository  {
  Future<Response> getScreenPDPA() async {
    return await MyDio.createDio().post("/v1/api/modules/login/wording/PDPA");
  }

}
