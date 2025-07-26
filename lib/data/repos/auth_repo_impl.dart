
import 'package:education/domain/model/auth.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/auth_repo.dart';
import '../../domain/result.dart';
import '../data_sources/online_data_source/auth_data_source.dart';
import '../model/requests/login_requests.dart';
import '../model/requests/register_request.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthDataSource authDataSource;

  AuthRepoImpl({required this.authDataSource});

  @override
  Future<Result<Auth?>> login(LoginRequest loginRequest) {
    return authDataSource.login(loginRequest);
  }

  @override
  Future<Result<Auth?>> register(RegisterRequest registerRequest) {
    return authDataSource.register(registerRequest);
  }
}
