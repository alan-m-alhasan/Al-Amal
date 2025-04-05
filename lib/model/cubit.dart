// ignore_for_file: avoid_print, annotate_overrides, avoid_renaming_method_parameters, non_constant_identifier_names, unused_import

import 'package:alamal/controller/alamal_icons.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/dioHelper.dart';
import 'package:alamal/model/endPoints.dart';
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

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      loginModel = UserData.fromJson(value?.data);
      // print(loginModel.api_token);

      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

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

  late UserData loginModel;

  void userRegister({
    required String email,
    required String password,
    required String phone,
    required String name,
    required String age,
    required String gender,
    required String type,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'email': email,
        'password': password,
        'phone': phone,
        'name': name,
        'age': age,
        'gender': gender,
        'type': type,
      },
    ).then((value) {
      loginModel = UserData.fromJson(value?.data);
      print(value?.data);
      emit(RegisterSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  IconData suffix = AmalIcons.visible;
  bool isPassVisible = true;
  void changePassVisible() {
    isPassVisible = !isPassVisible;
    suffix = isPassVisible ? AmalIcons.visible : AmalIcons.invisible;
    emit(RegisterChangePassVisible());
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      loginModel = UserData.fromJson(value?.data);
      // print(loginModel.api_token);

      emit(RegisterSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
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

  void questionPost({
    required String type,
    required String msg,
    required String token,
    required dynamic doctor_id,
  }) {
    emit(ConsultationLoadingState());
    DioHelper.postData(
      url: ADDQUES,
      data: {
        'type': type,
        'msg': msg,
        'token': token,
        'doctor_id': doctor_id,
      },
    ).then((value) {
      print(value?.data);
      emit(ConsultationSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ConsultationErrorState(error.toString()));
    });
  }
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

  void postAnswer(
    String token,
    int user_id,
    String answer,
  ) {
    emit(DrAccountsLoadingState());
    DioHelper.postData(
      url: ADDANSWER,
      data: {
        'answer': answer,
        'token': token,
        'id': user_id,
      },
    ).then((value) {
      print(value?.data);
      emit(DrAccountsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DrAccountsErrorState(error.toString()));
    });
  }
}

//
//

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  void editProfile(
    String token,
    String name,
    String age,
    String gender,
    String phone,
  ) {
    emit(ProfileLoadingState());
    DioHelper.postData(
      url: EDITPROFILE,
      data: {
        'name': name,
        'token': token,
        'age': age,
        'gender': gender,
        'phone': phone,
      },
    ).then((value) {
      print(value?.data);
      emit(ProfileSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ProfileErrorState(error.toString()));
    });
  }
}
