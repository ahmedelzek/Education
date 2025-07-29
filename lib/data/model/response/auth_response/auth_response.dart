import 'package:education/data/model/response/auth_response/user.dart';
import 'package:education/domain/model/auth.dart';

class AuthResponse {
  String? message;
  User? user;
  String? token;

  AuthResponse({this.message, this.user, this.token});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    message: json['message'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    token: json['token'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'message': message,
    'user': user?.toJson(),
    'token': token,
  };

  Auth toDomain() {
    return Auth(
      message: message,
      user: user,
      token: token,
    );
  }
}
