
import 'package:education/domain/model/auth.dart';

import '../../../domain/result.dart';
import '../../model/requests/login_requests.dart';
import '../../model/requests/register_request.dart';

abstract class AuthDataSource {
  Future<Result<Auth>> login(LoginRequest loginRequest);
  Future<Result<Auth>> register(RegisterRequest registerRequest);
}
