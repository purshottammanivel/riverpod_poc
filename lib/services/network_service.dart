import 'package:dio/dio.dart';
import 'logging_interceptor.dart';

class NetworkService {
  final Dio _dio;

  NetworkService(String baseUrl)
      : _dio = Dio(BaseOptions(baseUrl: baseUrl)) {
    _dio.interceptors.add(LoggingInterceptor());
  }

  Future<Response> get(String endpoint) async {
    final response = await _dio.get(endpoint);
    return response;
  }
}
