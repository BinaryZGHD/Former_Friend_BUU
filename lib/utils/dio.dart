import 'package:dio/dio.dart';

class MyDio {
  static final _options = BaseOptions(
    baseUrl: 'https://webzbinaryz.web.app/',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  static Dio createDio() {
    Dio dio = Dio(_options);
    dio.interceptors.add(MyInterceptors());
    return dio;
  }
}

class MyInterceptors extends Interceptor {
  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   // TODO: implement onError
  //   super.onError(err, handler);
  // }

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   // TODO: implement onRequest
  //   super.onRequest(options, handler);
  // }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   // TODO: implement onResponse
  //   super.onResponse(response, handler);
  // }
}
