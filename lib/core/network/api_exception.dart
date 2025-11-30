import 'package:dio/dio.dart';

class ApiException extends DioException {
  final String message;
  final int? code;

  ApiException({
    required this.message,
    this.code,
    required RequestOptions requestOptions,
  }) : super(
          requestOptions: requestOptions,
          error: message,
          type: DioExceptionType.badResponse,
        );
}
