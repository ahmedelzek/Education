import 'package:education/ui/screens/auth/register/cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/model/requests/register_request.dart';
import '../../../../../domain/result.dart';
import '../../../../../domain/use_cases/register_use_case.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;
  RegisterViewModel(this.registerUseCase) : super(RegisterLoadingState());

  void register(RegisterRequest registerRequest) async {
    emit(RegisterLoadingState());
    // call api
    var result = await registerUseCase(registerRequest);
    switch (result) {
      case Success():
        {
          emit(RegisterSuccessState());
        }
      case Error():
        {
          emit(RegisterErrorState(result.exception));
        }
      case ServerError():
        emit(RegisterErrorState(result.exception));
    }
    // send data to view
  }
}