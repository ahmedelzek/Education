import '../../data/model/requests/login_requests.dart';
import '../../data/model/requests/register_request.dart';
import '../model/auth.dart';
import '../result.dart';

abstract class AuthRepo {
  Future<Result<Auth?>> login(LoginRequest loginRequest);

  Future<Result<Auth?>> register(RegisterRequest registerRequest);
}
