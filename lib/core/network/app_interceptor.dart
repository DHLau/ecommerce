import 'package:dio/dio.dart';
import '../../domain/auth_dio/repository/auth_dio_repository.dart';

class AppInterceptor extends Interceptor {
  final AuthDioRepository authRepository;

  AppInterceptor(this.authRepository);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = authRepository.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 可在这里统一处理 HTTP 错误，例如 401、500
    handler.next(err);
  }
}
