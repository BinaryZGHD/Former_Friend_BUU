<<<<<<< HEAD

import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';


=======
import 'package:dio/src/response.dart';
import 'package:f2fbuu/utils/dio.dart';

>>>>>>> 074d24dae644391c83ddb11a6214474f25035344
class LoginRepository  {
  Future<Response> getScreenLogin() async {
    return await MyDio.createDio().post("/v1/api/modules/login/wording/login");
  }
}