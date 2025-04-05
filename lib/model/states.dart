import 'package:alamal/model/loginModel.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  late final UserData loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}

class LoginChangePassVisible extends LoginStates {}

// Register States

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  late final UserData loginModel;

  RegisterSuccessState(this.loginModel);
}

class RegisterErrorState extends RegisterStates {
  final String error;

  RegisterErrorState(this.error);
}

class RegisterChangePassVisible extends RegisterStates {}

// App States

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppLoadingState extends AppStates {}

class AppSuccessState extends AppStates {}

class AppErrorState extends AppStates {
  final String error;

  AppErrorState(this.error);
}

// Written Advices States

abstract class ConsultationStates {}

class ConsultationInitialState extends ConsultationStates {}

class ConsultationLoadingState extends ConsultationStates {}

class ConsultationSuccessState extends ConsultationStates {
  // late final UserData loginModel;

  // ConsultationSuccessState(this.loginModel);
}

class ConsultationErrorState extends ConsultationStates {
  final String error;

  ConsultationErrorState(this.error);
}

abstract class MyAdviceStates {}

class MyAdviceInitialState extends MyAdviceStates {}

class MyAdviceLoadingState extends MyAdviceStates {}

class MyAdviceSuccessState extends MyAdviceStates {
  // late final UserData loginModel;

  // MyAdviceSuccessState(this.loginModel);
}

class MyAdviceErrorState extends MyAdviceStates {
  final String error;

  MyAdviceErrorState(this.error);
}

//
abstract class DrAccountsStates {}

class DrAccountsInitialState extends DrAccountsStates {}

class DrAccountsLoadingState extends DrAccountsStates {}

class DrAccountsSuccessState extends DrAccountsStates {
  // late final UserData loginModel;

  // DrAcountsSuccessState(this.loginModel);
}

class DrAccountsErrorState extends DrAccountsStates {
  final String error;

  DrAccountsErrorState(this.error);
}

//
abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {
  // late final UserData loginModel;

  // ProfileSuccessState(this.loginModel);
}

class ProfileErrorState extends ProfileStates {
  final String error;

  ProfileErrorState(this.error);
}
