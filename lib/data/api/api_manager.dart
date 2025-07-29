import 'package:dio/dio.dart';
import 'package:education/data/api/success_code.dart';
import 'package:injectable/injectable.dart';

import '../../domain/result.dart';
import '../model/requests/login_requests.dart';
import '../model/requests/register_request.dart';
import '../model/response/auth_response/auth_response.dart';
import '../model/response/error_response.dart';
import 'end_points.dart';

@singleton
class ApiManager {
  final dio = Dio();


  Future<Result<AuthResponse>> login(LoginRequest loginRequest) async {
    try {
      var response = await dio.post(
        EndPoints.loginEndpoint,
        data: loginRequest.toJson(),
      );
      var authResponse = AuthResponse.fromJson(response.data);

      if (response.statusCode?.isSuccessCall() == true) {
        return Success(data: authResponse);
      }
      var errorResponse = ErrorResponse.fromJson(response.data);

      return ServerError(
          ServerErrorException(errorResponse.statusMsg, errorResponse.message));
    } on Exception catch (ex) {
      return Error(ex);
    }
  }

  Future<Result<AuthResponse>> register(RegisterRequest registerRequest) async {
    try {
      var response = await dio.post(
        EndPoints.registerEndpoint,
        data: registerRequest.toJson(),
      );
      var authResponse = AuthResponse.fromJson(response.data);

      if (response.statusCode?.isSuccessCall() == true) {
        return Success(data: authResponse);
      }
      var errorResponse = ErrorResponse.fromJson(response.data);

      return ServerError(
          ServerErrorException(errorResponse.statusMsg, errorResponse.message));
    } on Exception catch (ex) {
      return Error(ex);
    }
  }
}