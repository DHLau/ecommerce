import '../repository/auth_dio_repository.dart';

class LogoutUseCase {
  final AuthDioRepository repository;

  LogoutUseCase(this.repository);

  Future<void> call() => repository.logout();
}
