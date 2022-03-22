

abstract class  LoginState {}

class LoginInitialState extends LoginState {}
class LoginSuccessState extends LoginState {}
class LoginOnErrorState extends LoginState {
  final String error;

  LoginOnErrorState({required this.error});
}
class PasswordChangeVisibility extends LoginState {}