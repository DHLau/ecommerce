import 'package:dio/dio.dart';
import 'app_interceptor.dart';
import '../../domain/auth_dio/repository/auth_repository.dart';

class DioClient {
  final Dio dio;

  DioClient(AuthRepository authRepository)
      : dio = Dio(
          BaseOptions(
            baseUrl: "https://example.com/api",
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 5),
          ),
        ) {
    dio.interceptors.add(AppInterceptor(authRepository));
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
  }) {
    return dio.get(path, queryParameters: params, options: options);
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Options? options,
  }) {
    return dio.post(path, data: data, options: options);
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Options? options,
  }) {
    return dio.put(path, data: data, options: options);
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Options? options,
  }) {
    return dio.delete(path, data: data, options: options);
  }
}
