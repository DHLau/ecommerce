import 'package:dio/dio.dart';
import 'app_interceptor.dart';

class DioClient {
  final Dio _dio;

  DioClient(Dio dio, AppInterceptor interceptor)
      : _dio = dio..interceptors.add(interceptor);

  Future<Response> get(String path,
      {Map<String, dynamic>? params, Options? options}) {
    return _dio.get(path, queryParameters: params, options: options);
  }

  Future<Response> post(String path, {dynamic data, Options? options}) {
    return _dio.post(path, data: data, options: options);
  }

  Future<Response> put(String path, {dynamic data, Options? options}) {
    return _dio.put(path, data: data, options: options);
  }

  Future<Response> delete(String path, {dynamic data, Options? options}) {
    return _dio.delete(path, data: data, options: options);
  }
}
