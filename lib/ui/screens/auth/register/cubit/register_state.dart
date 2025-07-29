sealed class RegisterState {}

class RegisterSuccessState extends RegisterState {
  RegisterSuccessState();
}

class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  Exception? exception;
  RegisterErrorState(this.exception);
}