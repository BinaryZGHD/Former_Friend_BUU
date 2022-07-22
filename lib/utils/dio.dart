import 'package:dio/dio.dart';
import 'package:f2fbuu/utils/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDio {
  static final _optionsBinary = BaseOptions(
    baseUrl: 'https://webzbinaryz.web.app/',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  static Dio createDioTest() {
    Dio dio = Dio(_optionsBinary);
    dio.interceptors.add(MyInterceptors());
    return dio;
  }

  static final _optionsServerTest = BaseOptions(
    baseUrl: 'http://msd.buu.ac.th/',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  static Dio createDioServerTest () {
    Dio dio = Dio(_optionsServerTest);
    dio.interceptors.add(MyInterceptors());
    return dio;
  }

}


class MyInterceptors extends Interceptor  {
  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   // TODO: implement onError
  //   super.onError(err, handler);
  // }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler)  async{
    // String? token = prefs.getString('globalKey');
    // String? token = getGlobalKey() ;
    String token = await getGlobalKey() ?? "";
    // options.headers["Authorization"] = "Bearer ${getGlobalKey()??""}";
    print(" token getGlobalKey() : $token");
    options.headers["Authorization"] = "Bearer $token";
    super.onRequest(options, handler);
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   // TODO: implement onResponse
  //   super.onResponse(response, handler);
  // }
}
