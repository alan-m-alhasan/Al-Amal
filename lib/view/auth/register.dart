// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, avoid_unnecessary_containers, sized_box_for_whitespace, unrelated_type_equality_checks, prefer_final_fields, deprecated_member_use, library_private_types_in_public_api

import 'package:alamal/controller/alamal_icons.dart';
import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/custom_button.dart';
import 'package:alamal/controller/custom_snackbar.dart';
import 'package:alamal/db/sql_helper.dart';
import 'package:alamal/db/users_auth.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/cubit.dart';
import 'package:alamal/model/states.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/view/pages/verifiedEmail.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var password = TextEditingController();
  var age = TextEditingController();
  DatabaseHelper db = DatabaseHelper();

  List<DropdownMenuItem> _dropdownTestItem = [];
  var _selectedTest;

  List<DropdownMenuItem> buildDropdownTestItems(List testList) {
    List<DropdownMenuItem> items = [];
    for (var i in testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['gender']),
        ),
      );
    }
    return items;
  }

  String setGender(String gender) {
    if (gender == 'ذكر' || gender == 'Male') {
      return 'male';
    }
    return 'female';
  }

  onChangeDropdownTests(selectedTest) {
    print(selectedTest);
    setState(() {
      _selectedTest = selectedTest;
    });
  }

  bool isLoadingLogin = false;
  List<dynamic> testList = [];
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    db.getUsers().then((data) {
      setState(() {
        users.addAll(data);
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      testList.addAll([
        {'gender': DemoLocalization.of(context)?.getTranslatedValue('male')},
        {'gender': DemoLocalization.of(context)?.getTranslatedValue('female')},
      ]);
      _dropdownTestItem.addAll(buildDropdownTestItems(testList));
    });
    super.initState();
  }

  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            CustomSnackBar(
              context: context,
              translateKey: 'emailValid',
            );
          }
          if (state is RegisterSuccessState) {
            CustomSnackBar(
              context: context,
              translateKey: 'registerSuccess',
            );
            CacheHelper.saveData(key: 'name', value: state.loginModel.name);
            CacheHelper.saveData(key: 'email', value: state.loginModel.email);
            CacheHelper.saveData(key: 'phone', value: state.loginModel.phone);
            CacheHelper.saveData(key: 'age', value: state.loginModel.age);
            CacheHelper.saveData(key: 'gender', value: state.loginModel.gender);
            CacheHelper.saveData(key: 'type', value: state.loginModel.type);
            CacheHelper.saveData(key: 'id', value: state.loginModel.id);
            CacheHelper.saveData(
              key: 'api_token',
              value: state.loginModel.api_token,
            ).then(
              (value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerifiedEmail(
                      email: email.text.trim(),
                      password: password.text,
                    ),
                  ),
                );
              },
            );
          }
        },
        builder: (context, state) =>
            BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              key: scaffoldKey,
              body: Center(
                child: SingleChildScrollView(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: SvgPicture.asset(
                          "assets/imgs/Group6.svg",
                          color: state.color,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 26.0,
                          ),
                          child: Flex(
                            direction: Axis.vertical,
                            children: [
                              Text(
                                "${DemoLocalization.of(context)!.getTranslatedValue('newSignUp')}",
                                style: TextStyle(
                                    color: state.color,
                                    fontSize: 40.0,
                                    fontFamily: CacheHelper.getData(
                                                key: 'languageCode') ==
                                            'en'
                                        ? poppinsMedium
                                        : tajawalMedium),
                              ),
                              const SizedBox(
                                height: 50.0,
                              ),
                              Container(
                                width: fullWidth(context) * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[300]!,
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "${DemoLocalization.of(context)!.getTranslatedValue('plzFillField')}";
                                          }
                                          return null;
                                        },
                                        controller: name,
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                        cursorColor: state.color,
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: state.color,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          hintStyle: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                          hintText:
                                              "${DemoLocalization.of(context)!.getTranslatedValue('name')}",
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "${DemoLocalization.of(context)!.getTranslatedValue('plzFillField')}";
                                          }
                                          return null;
                                        },
                                        controller: email,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.next,
                                        cursorColor: state.color,
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: state.color,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          hintStyle: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                          hintText:
                                              "${DemoLocalization.of(context)!.getTranslatedValue('email')}",
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "${DemoLocalization.of(context)!.getTranslatedValue('plzFillField')}";
                                          }
                                          return null;
                                        },
                                        controller: phone,
                                        keyboardType: TextInputType.phone,
                                        textInputAction: TextInputAction.next,
                                        cursorColor: state.color,
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: state.color,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          hintStyle: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                          hintText:
                                              "${DemoLocalization.of(context)!.getTranslatedValue('phone')}",
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "${DemoLocalization.of(context)!.getTranslatedValue('plzFillField')}";
                                          }
                                          return null;
                                        },
                                        controller: password,
                                        obscureText: RegisterCubit.get(context)
                                            .isPassVisible,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        textInputAction: TextInputAction.next,
                                        cursorColor: state.color,
                                        decoration: InputDecoration(
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                            ),
                                            child: IconButton(
                                              color: state.color,
                                              onPressed: () {
                                                RegisterCubit.get(context)
                                                    .changePassVisible();
                                              },
                                              icon: Icon(
                                                RegisterCubit.get(context)
                                                    .suffix,
                                              ),
                                            ),
                                          ),
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: state.color,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          hintStyle: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                          hintText:
                                              "${DemoLocalization.of(context)!.getTranslatedValue('password')}",
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "${DemoLocalization.of(context)!.getTranslatedValue('plzFillField')}";
                                          }
                                          return null;
                                        },
                                        buildCounter: (
                                          context, {
                                          required currentLength,
                                          required isFocused,
                                          maxLength,
                                        }) =>
                                            null,
                                        controller: age,
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.done,
                                        maxLength: 2,
                                        cursorColor: state.color,
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: state.color,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          hintStyle: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                          hintText:
                                              "${DemoLocalization.of(context)!.getTranslatedValue('age')}",
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      DropdownBelow(
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: state.color,
                                        ),
                                        itemWidth: 100,
                                        boxHeight: 60,
                                        boxPadding: const EdgeInsets.all(10.0),
                                        boxDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        itemTextstyle: TextStyle(
                                          color: Colors.black,
                                          fontFamily: CacheHelper.getData(
                                                      key: 'languageCode') ==
                                                  'ar'
                                              ? tajawalMedium
                                              : poppinsMedium,
                                        ),
                                        boxTextstyle: TextStyle(
                                          fontFamily: CacheHelper.getData(
                                                      key: 'languageCode') ==
                                                  'ar'
                                              ? tajawalMedium
                                              : poppinsMedium,
                                          color: Colors.black,
                                        ),
                                        onBoxStateChanged: (change) => true,
                                        value: _selectedTest,
                                        onChanged: onChangeDropdownTests,
                                        items: _dropdownTestItem,
                                        hint: Text(
                                          "${DemoLocalization.of(context)!.getTranslatedValue('gender')}",
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontFamily: CacheHelper.getData(
                                                        key: 'languageCode') ==
                                                    'ar'
                                                ? tajawalRegular
                                                : poppinsRegular,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Builder(
                                        builder: (context) => !isLoadingLogin
                                            ? CustomButton(
                                                primaryColor: state.color,
                                                height: 60.0,
                                                width: fullWidth(context) * 0.8,
                                                bgColor: state.color,
                                                context: context,
                                                onPressed: () {
                                                  if (formKey.currentState!
                                                          .validate() &&
                                                      (_selectedTest != null)) {
                                                    setState(() {
                                                      isLoadingLogin = true;
                                                    });
                                                    Future.delayed(
                                                      const Duration(
                                                          seconds: 2),
                                                      () {
                                                        setState(() {
                                                          isLoadingLogin =
                                                              false;
                                                        });
                                                        UsersAuth()
                                                            .userRegisterChecking(
                                                          accountType: 'user',
                                                          // 0 Is Type User || 1 Is Type Doctor
                                                          userData: users,
                                                          userName: name.text,
                                                          userPassword:
                                                              password.text,
                                                          userEmail:
                                                              email.text.trim(),
                                                          userPhone: phone.text,
                                                          userAge: age.text,
                                                          userGender: setGender(
                                                              _selectedTest[
                                                                      'gender']
                                                                  .toString()),
                                                          context: context,
                                                          mounted: mounted,
                                                        );
                                                      },
                                                    );
                                                  }
                                                  if (_selectedTest == null) {
                                                    CustomSnackBar(
                                                      context: context,
                                                      translateKey:
                                                          'plzChooseGen',
                                                    );
                                                  }
                                                },
                                                translateKey: 'signWithUs',
                                              )
                                            : Container(
                                                height: 60.0,
                                                width: fullWidth(context) * 0.8,
                                                alignment: Alignment.center,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: state.color,
                                                ),
                                              ),
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        "${DemoLocalization.of(context)!.getTranslatedValue('enterBy')}",
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CustomButton(
                                            primaryColor: state.color,
                                            width: 55.0,
                                            height: 55.0,
                                            radius: 50.0,
                                            bgColor: state.color,
                                            hasBorder: false,
                                            elevation: 0.0,
                                            context: context,
                                            onPressed: () {},
                                            hasChild: true,
                                            padding: EdgeInsets.zero,
                                            child: const Icon(
                                              AmalIcons.facebook,
                                              color: Colors.white,
                                              size: 26.0,
                                            ),
                                          ),
                                          CustomButton(
                                            primaryColor: state.color,
                                            width: 55.0,
                                            height: 55.0,
                                            radius: 50.0,
                                            bgColor: state.color,
                                            hasBorder: false,
                                            elevation: 0.0,
                                            context: context,
                                            onPressed: () {},
                                            hasChild: true,
                                            padding: EdgeInsets.zero,
                                            child: const Icon(
                                              AmalIcons.apple,
                                              color: Colors.white,
                                              size: 26.0,
                                            ),
                                          ),
                                          CustomButton(
                                            primaryColor: state.color,
                                            width: 55.0,
                                            height: 55.0,
                                            radius: 50.0,
                                            bgColor: state.color,
                                            hasBorder: false,
                                            elevation: 0.0,
                                            context: context,
                                            onPressed: () {},
                                            hasChild: true,
                                            padding: EdgeInsets.zero,
                                            child: const Icon(
                                              AmalIcons.google,
                                              color: Colors.white,
                                              size: 26.0,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40.0,
                              ),
                              CustomButton(
                                primaryColor: state.color,
                                height: 60.0,
                                width: fullWidth(context) * 0.75,
                                context: context,
                                translateKey: 'login',
                                titleColor: state.color,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
