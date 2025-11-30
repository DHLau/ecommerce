import '../../../../core/network/dio_client.dart';
import '../models/login_response_model.dart';

class AuthRemoteDataSource {
  final DioClient client;

  AuthRemoteDataSource(this.client);

  Future<LoginResponseModel> login(String email, String password) async {
    final response = await client.post(
      "/login",
      data: {"email": email, "password": password},
    );
    return LoginResponseModel.fromJson(response.data);
  }
}
