// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables, avoid_print, deprecated_member_use

import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/custom_button.dart';
import 'package:alamal/controller/custom_snackbar.dart';
import 'package:alamal/db/sql_helper.dart';
import 'package:alamal/db/users_auth.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/cubit.dart';
import 'package:alamal/model/google_sign_in_api.dart';
import 'package:alamal/model/states.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterWithGoogle extends StatefulWidget {
  final String name;
  final String email;
  final String photoUrl;

  const RegisterWithGoogle({
    super.key,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  @override
  _RegisterWithGoogleState createState() => _RegisterWithGoogleState();
}

class _RegisterWithGoogleState extends State<RegisterWithGoogle> {
  var phone = TextEditingController();
  var password = TextEditingController();
  var age = TextEditingController();
  DatabaseHelper db = DatabaseHelper();

  final List<DropdownMenuItem> _dropdownTestItem = [];
  var _selectedTest;

  List<DropdownMenuItem> buildDropdownTestItems(List testList) {
    List<DropdownMenuItem> items = [];
    for (var i in testList) {
      items.add(DropdownMenuItem(value: i, child: Text(i['gender'])));
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
        {'gender': AppLocalization.of(context)?.getTranslatedValue('male')},
        {'gender': AppLocalization.of(context)?.getTranslatedValue('female')},
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
        listener: (context, state) {},
        builder:
            (context, state) => BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
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
                                    Container(
                                      width: fullWidth(context) * 0.8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          30.0,
                                        ),
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
                                              keyboardType: TextInputType.name,
                                              textInputAction:
                                                  TextInputAction.next,
                                              cursorColor: state.color,
                                              decoration: InputDecoration(
                                                border:
                                                    const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                            Radius.circular(
                                                              20.0,
                                                            ),
                                                          ),
                                                    ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: state.color,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20.0,
                                                          ),
                                                    ),
                                                hintStyle: const TextStyle(
                                                  color: Colors.black,
                                                ),
                                                enabled: false,
                                                hintText: widget.name,
                                              ),
                                            ),
                                            const SizedBox(height: 5.0),
                                            TextFormField(
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              textInputAction:
                                                  TextInputAction.next,
                                              cursorColor: state.color,
                                              decoration: InputDecoration(
                                                border:
                                                    const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                            Radius.circular(
                                                              20.0,
                                                            ),
                                                          ),
                                                    ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: state.color,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20.0,
                                                          ),
                                                    ),
                                                hintStyle: const TextStyle(
                                                  color: Colors.black,
                                                ),
                                                enabled: false,
                                                hintText: widget.email,
                                              ),
                                            ),
                                            const SizedBox(height: 5.0),
                                            TextFormField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "${AppLocalization.of(context)!.getTranslatedValue('plzFillField')}";
                                                }
                                                return null;
                                              },
                                              controller: phone,
                                              keyboardType: TextInputType.phone,
                                              textInputAction:
                                                  TextInputAction.next,
                                              cursorColor: state.color,
                                              decoration: InputDecoration(
                                                border:
                                                    const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                            Radius.circular(
                                                              20.0,
                                                            ),
                                                          ),
                                                    ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: state.color,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20.0,
                                                          ),
                                                    ),
                                                hintStyle: const TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                hintText:
                                                    "${AppLocalization.of(context)!.getTranslatedValue('phone')}",
                                              ),
                                            ),
                                            const SizedBox(height: 5.0),
                                            TextFormField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "${AppLocalization.of(context)!.getTranslatedValue('plzFillField')}";
                                                }
                                                return null;
                                              },
                                              controller: password,
                                              obscureText:
                                                  RegisterCubit.get(
                                                    context,
                                                  ).isPassVisible,
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              textInputAction:
                                                  TextInputAction.next,
                                              cursorColor: state.color,
                                              decoration: InputDecoration(
                                                suffixIcon: Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 10.0,
                                                      ),
                                                  child: IconButton(
                                                    color: state.color,
                                                    onPressed: () {
                                                      RegisterCubit.get(
                                                        context,
                                                      ).changePassVisible();
                                                    },
                                                    icon: Icon(
                                                      RegisterCubit.get(
                                                        context,
                                                      ).suffix,
                                                    ),
                                                  ),
                                                ),
                                                border:
                                                    const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                            Radius.circular(
                                                              20.0,
                                                            ),
                                                          ),
                                                    ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: state.color,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20.0,
                                                          ),
                                                    ),
                                                hintStyle: const TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                hintText:
                                                    "${AppLocalization.of(context)!.getTranslatedValue('password')}",
                                              ),
                                            ),
                                            const SizedBox(height: 5.0),
                                            TextFormField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "${AppLocalization.of(context)!.getTranslatedValue('plzFillField')}";
                                                }
                                                return null;
                                              },
                                              buildCounter:
                                                  (
                                                    context, {
                                                    required currentLength,
                                                    required isFocused,
                                                    maxLength,
                                                  }) => null,
                                              controller: age,
                                              keyboardType:
                                                  TextInputType.number,
                                              textInputAction:
                                                  TextInputAction.done,
                                              maxLength: 2,
                                              cursorColor: state.color,
                                              decoration: InputDecoration(
                                                border:
                                                    const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                            Radius.circular(
                                                              20.0,
                                                            ),
                                                          ),
                                                    ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: state.color,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20.0,
                                                          ),
                                                    ),
                                                hintStyle: const TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                hintText:
                                                    "${AppLocalization.of(context)!.getTranslatedValue('age')}",
                                              ),
                                            ),
                                            const SizedBox(height: 5.0),
                                            DropdownBelow(
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color: state.color,
                                              ),
                                              itemWidth: 100,
                                              boxHeight: 60,
                                              boxPadding: const EdgeInsets.all(
                                                10.0,
                                              ),
                                              boxDecoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              itemTextstyle: TextStyle(
                                                color: Colors.black,
                                                fontFamily:
                                                    CacheHelper.getData(
                                                              key:
                                                                  'languageCode',
                                                            ) ==
                                                            'ar'
                                                        ? tajawalMedium
                                                        : poppinsMedium,
                                              ),
                                              boxTextstyle: TextStyle(
                                                fontFamily:
                                                    CacheHelper.getData(
                                                              key:
                                                                  'languageCode',
                                                            ) ==
                                                            'ar'
                                                        ? tajawalMedium
                                                        : poppinsMedium,
                                                color: Colors.black,
                                              ),
                                              onBoxStateChanged:
                                                  (change) => true,
                                              value: _selectedTest,
                                              onChanged: onChangeDropdownTests,
                                              items: _dropdownTestItem,
                                              hint: Text(
                                                "${AppLocalization.of(context)!.getTranslatedValue('gender')}",
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontFamily:
                                                      CacheHelper.getData(
                                                                key:
                                                                    'languageCode',
                                                              ) ==
                                                              'ar'
                                                          ? tajawalRegular
                                                          : poppinsRegular,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20.0),
                                            Builder(
                                              builder:
                                                  (context) =>
                                                      !isLoadingLogin
                                                          ? CustomButton(
                                                            primaryColor:
                                                                state.color,
                                                            height: 60.0,
                                                            width:
                                                                fullWidth(
                                                                  context,
                                                                ) *
                                                                0.8,
                                                            bgColor:
                                                                state.color,
                                                            context: context,
                                                            onPressed: () {
                                                              if (formKey
                                                                      .currentState!
                                                                      .validate() &&
                                                                  (_selectedTest !=
                                                                      null)) {
                                                                setState(() {
                                                                  isLoadingLogin =
                                                                      true;
                                                                });
                                                                Future.delayed(
                                                                  const Duration(
                                                                    seconds: 2,
                                                                  ),
                                                                  () {
                                                                    setState(() {
                                                                      isLoadingLogin =
                                                                          false;
                                                                    });
                                                                    UsersAuth().userRegisterWithGoogle(
                                                                      accountType:
                                                                          'user',
                                                                      // 0 Is Type User || 1 Is Type Doctor
                                                                      userData:
                                                                          users,
                                                                      userPassword:
                                                                          password
                                                                              .text,
                                                                      userPhone:
                                                                          phone
                                                                              .text,
                                                                      userAge:
                                                                          age.text,
                                                                      userGender: setGender(
                                                                        _selectedTest['gender']
                                                                            .toString(),
                                                                      ),
                                                                      context:
                                                                          context,
                                                                      mounted:
                                                                          mounted,
                                                                    );
                                                                  },
                                                                );
                                                              }
                                                              if (_selectedTest ==
                                                                  null) {
                                                                CustomSnackBar(
                                                                  context:
                                                                      context,
                                                                  translateKey:
                                                                      'plzChooseGen',
                                                                );
                                                              }
                                                            },
                                                            translateKey:
                                                                'signWithUs',
                                                          )
                                                          : Container(
                                                            height: 60.0,
                                                            width:
                                                                fullWidth(
                                                                  context,
                                                                ) *
                                                                0.8,
                                                            alignment:
                                                                Alignment
                                                                    .center,
                                                            child:
                                                                CircularProgressIndicator(
                                                                  color:
                                                                      state
                                                                          .color,
                                                                ),
                                                          ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 40.0),
                                    CustomButton(
                                      primaryColor: state.color,
                                      height: 60.0,
                                      width: fullWidth(context) * 0.75,
                                      context: context,
                                      translateKey: 'change_account',
                                      titleColor: state.color,
                                      onPressed: () async {
                                        await GoogleSignInApi.logout();
                                        pop(context: context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      ),
    );
  }
}
