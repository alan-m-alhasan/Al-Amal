// ignore_for_file: avoid_print, annotate_overrides, avoid_renaming_method_parameters, non_constant_identifier_names, unused_import

import 'package:alamal/controller/alamal_icons.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/dioHelper.dart';
import 'package:alamal/model/loginModel.dart';
import 'package:alamal/model/states.dart';
import 'package:alamal/view/auth/login.dart';
import 'package:alamal/view/pages/doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  late UserData loginModel;

  IconData suffix = AmalIcons.visible;
  bool isPassVisible = true;

  void changePassVisible() {
    isPassVisible = !isPassVisible;
    suffix = isPassVisible ? AmalIcons.visible : AmalIcons.invisible;
    emit(LoginChangePassVisible());
  }
}

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  IconData suffix = AmalIcons.visible;
  bool isPassVisible = true;

  void changePassVisible() {
    isPassVisible = !isPassVisible;
    suffix = isPassVisible ? AmalIcons.visible : AmalIcons.invisible;
    emit(RegisterChangePassVisible());
  }
}

//
//

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
}

//
//

class ConsultationCubit extends Cubit<ConsultationStates> {
  ConsultationCubit() : super(ConsultationInitialState());

  static ConsultationCubit get(context) => BlocProvider.of(context);
}

class MyAdviceCubit extends Cubit<MyAdviceStates> {
  MyAdviceCubit() : super(MyAdviceInitialState());

  static MyAdviceCubit get(context) => BlocProvider.of(context);

  // late UserData loginModel;
}

//
//

class DrAccountsCubit extends Cubit<DrAccountsStates> {
  DrAccountsCubit() : super(DrAccountsInitialState());

  static DrAccountsCubit get(context) => BlocProvider.of(context);
}

//
//

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);
}
