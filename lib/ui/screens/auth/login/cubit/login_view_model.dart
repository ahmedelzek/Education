import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/model/requests/login_requests.dart';
import '../../../../../domain/result.dart';
import '../../../../../domain/use_cases/login_use_case.dart';
import '../../../../core/app_storage.dart';
import 'login_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  LoginViewModel(this.loginUseCase) : super(LoginLoadingState());

  void login(LoginRequest loginRequest) async {
    emit(LoginLoadingState());
    // call api
    var result = await loginUseCase.call(loginRequest);
    switch (result) {
      case Success():
        {
          AppStorage.setToken(result.data?.token);
          emit(LoginSuccessState());
        }
      case Error():
        {
          emit(LoginErrorState(result.exception));
        }
      case ServerError():
        emit(LoginErrorState(result.exception));
    }
    // send data to view
  }
}