// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/custom_snackbar.dart';
import 'package:alamal/db/sql_helper.dart';
import 'package:alamal/db/users_json.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/google_sign_in_api.dart';
import 'package:alamal/view/auth/login.dart';
import 'package:alamal/view/auth/register_google.dart';
import 'package:alamal/view/pages/doctor/doctor_home.dart';
import 'package:alamal/view/pages/profile.dart';
import 'package:alamal/view/pages/splashScreen.dart';
import 'package:alamal/view/pages/zoom_drawer_home.dart';
import 'package:flutter/material.dart';

class UsersAuth {
  DatabaseHelper db = DatabaseHelper();

  userRegister({
    required String userName,
    required String userPassword,
    required String userEmail,
    required String userPhone,
    required String userAge,
    required String userGender,
    required String accountType,
    required BuildContext context,
    required bool mounted,
  }) async {
    var res = await db.createUser(
      Users(
        userName: userName,
        userPassword: userPassword,
        userEmail: userEmail,
        userPhone: userPhone,
        userAge: userAge,
        userGender: userGender,
        accountType: accountType,
      ),
    );
    if (res > 0) {
      if (mounted) {
        pushAndRmvUntil(
          context: context,
          page:
              accountType == 'doctor' ? const DoctorHome() : const MainScreen(),
        );
        CustomSnackBar(context: context, translateKey: 'registerSuccess');
        CacheHelper.saveData(
          key: 'accountType',
          value: accountType == 'doctor' ? 'doctor' : 'user',
        );
        CacheHelper.saveData(key: 'email', value: userEmail);
        CacheHelper.saveData(key: 'hasLogged', value: true);
      } else {
        CustomSnackBar(context: context, translateKey: 'errorHappened');
      }
    }
  }

  void userRegisterChecking({
    required List<Map<String, dynamic>> userData,
    required String userName,
    required String userPassword,
    required String userEmail,
    required String userPhone,
    required String userAge,
    required String userGender,
    required String accountType,
    required BuildContext context,
    required bool mounted,
  }) {
    if (userData.any((element) {
          return element.containsValue(userEmail);
        }) ==
        false) {
      userRegister(
        userName: userName,
        userPassword: userPassword,
        userEmail: userEmail,
        userPhone: userPhone,
        userAge: userAge,
        userGender: userGender,
        accountType: accountType,
        context: context,
        mounted: mounted,
      );
    } else {
      CustomSnackBar(context: context, translateKey: 'accountExist');
    }
  }

  void userLogin({
    required String userPassword,
    required String userEmail,
    required String accountType,
    required BuildContext context,
    required bool mounted,
  }) async {
    var res = await db.userAuthenticate(
      Users(userEmail: userEmail, userPassword: userPassword),
    );
    // GoogleSignInApi.login();
    if (res == true) {
      if (mounted) {
        pushAndRmvUntil(
          context: context,
          page:
              accountType == 'doctor' ? const DoctorHome() : const MainScreen(),
        );
        CustomSnackBar(context: context, translateKey: 'enterSuccess');
        CacheHelper.saveData(
          key: 'accountType',
          value: accountType == 'doctor' ? 'doctor' : 'user',
        );
        CacheHelper.saveData(key: 'email', value: userEmail);
        CacheHelper.saveData(key: 'hasLogged', value: true);
      } else {
        CustomSnackBar(context: context, translateKey: 'errorHappened');
      }
    } else {
      CustomSnackBar(context: context, translateKey: 'wrongData');
    }
    debugPrint(res.toString());
  }

  void userLoginWithGoogle({
    required List<Map<String, dynamic>> userData,
    required BuildContext context,
    required bool mounted,
  }) async {
    final user = await GoogleSignInApi.login();
    if (userData.any((element) {
          return element.containsValue(user?.email.toString());
        }) ==
        false) {
      push(
        context: context,
        page: RegisterWithGoogle(
          name: user!.displayName.toString(),
          email: user.email.toString(),
          photoUrl: user.photoUrl.toString(),
        ),
      );
    } else if (user == null) {
      CustomSnackBar(context: context, translateKey: 'errorHappened');
    } else if (userData.any((element) {
          return element.containsValue(user.email.toString());
        }) ==
        true) {
      print('Login ...........');
      int index = userData.indexWhere(
        (element) => element['userEmail'] == user.email,
      );
      userLogin(
        userPassword: userData[index]['userPassword'],
        userEmail: user.email,
        accountType: userData[index]['accountType'],
        context: context,
        mounted: mounted,
      );
    }
  }

  void userRegisterWithGoogle({
    required List<Map<String, dynamic>> userData,
    required String userPassword,
    required String userPhone,
    required String userAge,
    required String userGender,
    required String accountType,
    required BuildContext context,
    required bool mounted,
  }) async {
    try {
      final user = await GoogleSignInApi.login();
      userRegisterChecking(
        userData: userData,
        userName: user!.displayName.toString(),
        userPassword: userPassword,
        userEmail: user.email.toString(),
        userPhone: userPhone,
        userAge: userAge,
        userGender: userGender,
        accountType: accountType,
        context: context,
        mounted: mounted,
      );
      CustomSnackBar(context: context, translateKey: 'enterSuccess');
      pushAndRmvUntil(
        context: context,
        page: accountType == 'doctor' ? const DoctorHome() : const MainScreen(),
      );
      CacheHelper.saveData(
        key: 'accountType',
        value: accountType == 'doctor' ? 'doctor' : 'user',
      );
      CacheHelper.saveData(key: 'email', value: user.email);
      CacheHelper.saveData(key: 'profileImg', value: user.photoUrl);
      CacheHelper.saveData(key: 'id', value: user.id);
      CacheHelper.saveData(key: 'hasLogged', value: true);
    } catch (error) {
      print(error);
    }
  }

  void deleteAccount({
    required int id,
    required BuildContext context,
    required bool mounted,
  }) async {
    var res = await db.deleteUser(id);
    if (res > 0) {
      if (mounted) {
        CacheHelper.saveData(key: 'hasLogged', value: false);
        CacheHelper.removeData(key: 'accountType');
        CacheHelper.removeData(key: 'email');
        pushAndRmvUntil(context: context, page: const LoginPage());
        CustomSnackBar(context: context, translateKey: 'accountDeletedSuccess');
      } else {
        CustomSnackBar(context: context, translateKey: 'errorHappened');
      }
    }
  }

  void verifyAccountAsDoctor({
    required int id,
    required BuildContext context,
    required bool mounted,
  }) async {
    var res = await db.updateUserToDoctor(id);
    if (res > 0) {
      if (mounted) {
        pushAndRmvUntil(context: context, page: const SplashScreen());
        CacheHelper.saveData(key: 'accountType', value: 'doctor');
      }
    } else {
      CustomSnackBar(context: context, translateKey: 'errorHappened');
    }
  }

  userUpdate({
    required String userName,
    required String userPassword,
    required String userEmail,
    required String userPhone,
    required String userAge,
    required String userGender,
    required int userId,
    required String accountType,
    required BuildContext context,
    required bool mounted,
  }) async {
    var res = await db.updateUser(
      Users(
        userName: userName,
        userPassword: userPassword,
        userEmail: userEmail,
        userPhone: userPhone,
        userAge: userAge,
        userGender: userGender,
        accountType: accountType,
        userId: userId,
      ),
    );
    if (res > 0) {
      if (mounted) {
        CustomSnackBar(context: context, translateKey: 'modify_success');
        pushReplacement(context: context, page: const ProfilePage());
        CacheHelper.saveData(key: 'email', value: userEmail);
      } else {
        CustomSnackBar(context: context, translateKey: 'errorHappened');
      }
    }
  }
}
