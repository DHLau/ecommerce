import '../../../domain/auth_dio/repository/auth_repository.dart';
import '../source/auth_local_datasource.dart';
import '../source/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final AuthLocalDataSource local;

  AuthRepositoryImpl(this.remote, this.local);

  @override
  Future<String> login(String email, String password) async {
    final result = await remote.login(email, password);
    await local.saveToken(result.token);
    return result.token;
  }

  @override
  Future<void> logout() async {
    await local.clearToken();
  }

  @override
  String? getToken() => local.getToken();
}
