import '../../../domain/auth_dio/entities/user_entity.dart';

class LoginResponseModel {
  final String userId;
  final String userName;
  final String email;
  final String token;

  LoginResponseModel({
    required this.userId,
    required this.userName,
    required this.email,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      userId: json["user_id"] ?? "",
      userName: json["user_name"] ?? "",
      email: json["email"] ?? "",
      token: json["token"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "user_name": userName,
      "email": email,
      "token": token,
    };
  }

  // 转换为领域实体 UserEntity
  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      userName: userName,
      email: email,
      token: token,
    );
  }
}
