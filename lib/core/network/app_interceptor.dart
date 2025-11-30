import 'package:dio/dio.dart';
import '../../domain/auth_dio/repository/auth_repository.dart';

class AppInterceptor extends Interceptor {
  final AuthRepository authRepository;

  AppInterceptor(this.authRepository);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = authRepository.getToken();
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await authRepository.logout(); // 清除 Token
      // 可以让 AppBloc 做跳转处理
    }
    handler.next(err);
  }
}
