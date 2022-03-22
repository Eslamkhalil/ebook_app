import '../../../../models/user_model.dart';

abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates{

  String uId;

  RegisterSuccessState({required this.uId});
}

class RegisterErrorState extends RegisterStates{
  String error;

  RegisterErrorState(this.error);
}
class CreateSuccessState extends RegisterStates{



  CreateSuccessState();
}

class CreateErrorState extends RegisterStates{
  String error;

  CreateErrorState(this.error);
}

class PasswordChangeRegisterVisibility extends RegisterStates{}

class RegisterCheckBoxState extends RegisterStates{}