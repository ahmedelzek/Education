sealed class LoginState {}

class LoginSuccessState extends LoginState {
  LoginSuccessState();
}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  Exception? exception;
  LoginErrorState(this.exception);
}