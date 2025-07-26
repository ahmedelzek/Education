
import 'package:education/domain/model/auth.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/requests/login_requests.dart';
import '../repos/auth_repo.dart';
import '../result.dart';

@injectable
class LoginUseCase {
  AuthRepo authRepo;

  LoginUseCase({required this.authRepo});

  Future<Result<Auth?>> call(LoginRequest loginRequest) async {
    return await authRepo.login(loginRequest);
  }
}
