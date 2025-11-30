import '../repository/auth_dio_repository.dart';

class LoginUseCase {
  final AuthDioRepository repository;

  LoginUseCase(this.repository);

  Future<String> call(String email, String password) {
    return repository.login(email, password);
  }
}
