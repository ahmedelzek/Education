
import 'package:education/domain/model/auth.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/requests/register_request.dart';
import '../repos/auth_repo.dart';
import '../result.dart';

@injectable
class RegisterUseCase {
  AuthRepo authRepo;

  RegisterUseCase({required this.authRepo});

  Future<Result<Auth?>> call(RegisterRequest registerRequest) async {
    return await authRepo.register(registerRequest);
  }
}
