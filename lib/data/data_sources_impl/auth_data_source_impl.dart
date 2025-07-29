import 'package:injectable/injectable.dart';

import '../../domain/model/auth.dart';
import '../../domain/result.dart';
import '../api/api_manager.dart';
import '../data_sources/online_data_source/auth_data_source.dart';
import '../model/requests/login_requests.dart';
import '../model/requests/register_request.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  ApiManager apiManager;
  @factoryMethod
  AuthDataSourceImpl(this.apiManager);

  @override
  Future<Result<Auth>> login(LoginRequest loginRequest) async {
    var result = await apiManager.login(loginRequest);

    switch (result) {
      case Success():
        {
          return Success(data: result.data.toDomain());
        }
      case ServerError():
        {
          return ServerError(result.exception);
        }
      case Error():
        {
          return Error(result.exception);
        }
    }
  }

  @override
  Future<Result<Auth>> register(RegisterRequest registerRequest) async {
    var result = await apiManager.register(registerRequest);

    switch (result) {
      case Success():
        {
          return Success(data: result.data.toDomain());
        }
      case ServerError():
        {
          return ServerError(result.exception);
        }
      case Error():
        {
          return Error(result.exception);
        }
    }
  }
}
