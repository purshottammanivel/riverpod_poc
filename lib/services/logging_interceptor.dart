import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("Request to: ${options.uri}");
    print("Headers: ${options.headers}");
    print("Body: ${options.data}");
    handler.next(options); // continue
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("Response from: ${response.requestOptions.uri}");
    print("Status code: ${response.statusCode}");
    print("Headers: ${response.headers}");
    print("Body: ${response.data}");
    handler.next(response); // continue
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("Error: ${err.message}");
    handler.next(err); // continue
  }
}
