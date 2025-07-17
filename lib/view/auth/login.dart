// ignore_for_file: unrelated_type_equality_checks, library_private_types_in_public_api, prefer_typing_uninitialized_variables, deprecated_member_use, use_build_context_synchronously

import 'package:alamal/controller/alamal_icons.dart';
import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/custom_button.dart';
import 'package:alamal/controller/custom_snackbar.dart';
import 'package:alamal/db/sql_helper.dart';
import 'package:alamal/db/users_auth.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/cubit.dart';
import 'package:alamal/model/lang_bloc.dart';
import 'package:alamal/model/states.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/view/auth/register.dart';
import 'package:alamal/view/pages/doctor/doctor_home.dart';
import 'package:alamal/view/pages/section_choose.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum LoadingStates {
  loadingPage,
  loadingLogin,
  loadingGoogle,
  loadingApple,
  loadingFacebook,
  loadingNone,
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var email = TextEditingController();
  var password = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final List<DropdownMenuItem> _dropdownTestItem = [];

  List<DropdownMenuItem> buildDropdownTestItems(List testList) {
    List<DropdownMenuItem> items = [];
    for (var i in testList) {
      items.add(
        DropdownMenuItem(
          alignment: AlignmentDirectional.center,
          value: i,
          child: Center(child: Text(i['lang'], textAlign: TextAlign.center)),
        ),
      );
    }
    return items;
  }

  List<dynamic> testList = [];

  @override
  void initState() {
    db.getUsers().then((data) {
      setState(() {
        users.addAll(data);
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      testList.addAll([
        {'lang': 'العربية'},
        {'lang': 'English'},
      ]);
      _dropdownTestItem.addAll(buildDropdownTestItems(testList));
    });

    super.initState();
  }

  LoadingStates loadingStates = LoadingStates.loadingNone;
  DatabaseHelper db = DatabaseHelper();
  List<Map<String, dynamic>> users = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
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
            ).then((value) {
              if (LoginCubit.get(context).loginModel.type == 'doctor') {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const DoctorHome()),
                  (Route<dynamic> route) => false,
                );
              } else {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Sections()),
                  (Route<dynamic> route) => false,
                );
              }
            });
          }

          if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "${AppLocalization.of(context)!.getTranslatedValue('makeSureInfo')}",
                  style: TextStyle(fontFamily: poppinsRegular),
                ),
              ),
            );
          }
        },
        builder:
            (context, state) => BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return SafeArea(
                  child: Scaffold(
                    key: scaffoldKey,
                    body:
                        loadingStates == LoadingStates.loadingPage
                            ? Center(
                              child: CircularProgressIndicator(
                                color: state.color,
                              ),
                            )
                            : SingleChildScrollView(
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
                                        vertical: 16.0,
                                      ),
                                      child: Flex(
                                        direction: Axis.vertical,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0,
                                            ),
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional.topStart,
                                              child: DropdownBelow(
                                                hint: Icon(
                                                  AmalIcons.earth,
                                                  color: state.color,
                                                ),
                                                itemWidth: 100,
                                                boxWidth: 60,
                                                boxHeight: 60,
                                                boxPadding:
                                                    const EdgeInsetsDirectional.only(
                                                      start: 17.0,
                                                    ),
                                                itemTextstyle: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: tajawalRegular,
                                                ),
                                                boxTextstyle: TextStyle(
                                                  fontFamily: poppinsMedium,
                                                  color: Colors.black,
                                                ),
                                                onBoxStateChanged:
                                                    (change) => true,
                                                onChanged: (value) {
                                                  switch (value['lang']) {
                                                    case 'English':
                                                      context
                                                          .read<LanguageBloc>()
                                                          .add(
                                                            ChangeLanguage(
                                                              'en',
                                                            ),
                                                          );
                                                      if (CacheHelper.getData(
                                                            key: 'languageCode',
                                                          ) ==
                                                          'ar') {
                                                        setState(() {
                                                          loadingStates =
                                                              LoadingStates
                                                                  .loadingPage;
                                                        });
                                                        Future.delayed(
                                                          const Duration(
                                                            seconds: 1,
                                                          ),
                                                          () {
                                                            setState(() {
                                                              loadingStates =
                                                                  LoadingStates
                                                                      .loadingNone;
                                                            });
                                                          },
                                                        );
                                                      }

                                                      break;
                                                    case 'العربية':
                                                      context
                                                          .read<LanguageBloc>()
                                                          .add(
                                                            ChangeLanguage(
                                                              'ar',
                                                            ),
                                                          );
                                                      if (CacheHelper.getData(
                                                            key: 'languageCode',
                                                          ) ==
                                                          'en') {
                                                        setState(() {
                                                          loadingStates =
                                                              LoadingStates
                                                                  .loadingPage;
                                                        });
                                                        Future.delayed(
                                                          const Duration(
                                                            seconds: 1,
                                                          ),
                                                          () {
                                                            setState(() {
                                                              loadingStates =
                                                                  LoadingStates
                                                                      .loadingNone;
                                                            });
                                                          },
                                                        );
                                                      }
                                                      break;
                                                    default:
                                                  }
                                                },
                                                items: _dropdownTestItem,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${AppLocalization.of(context)!.getTranslatedValue('login')}",
                                            style: TextStyle(
                                              color: state.color,
                                              fontSize: 40.0,
                                              fontFamily:
                                                  CacheHelper.getData(
                                                            key: 'languageCode',
                                                          ) ==
                                                          'en'
                                                      ? poppinsMedium
                                                      : tajawalMedium,
                                            ),
                                          ),
                                          const SizedBox(height: 75.0),
                                          Container(
                                            width: fullWidth(context) * 0.8,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
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
                                              padding: const EdgeInsets.all(
                                                15.0,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  TextFormField(
                                                    cursorWidth: 1.0,
                                                    maxLines: 1,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "${AppLocalization.of(context)!.getTranslatedValue('plzFillField')}";
                                                      }
                                                      return null;
                                                    },
                                                    controller: email,
                                                    keyboardType:
                                                        TextInputType
                                                            .emailAddress,
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
                                                            borderSide:
                                                                BorderSide(
                                                                  color:
                                                                      state
                                                                          .color,
                                                                ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  20.0,
                                                                ),
                                                          ),
                                                      hintStyle:
                                                          const TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                      hintText:
                                                          "${AppLocalization.of(context)!.getTranslatedValue('email')}",
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10.0),
                                                  TextFormField(
                                                    cursorWidth: 1.0,
                                                    maxLines: 1,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "${AppLocalization.of(context)!.getTranslatedValue('plzFillField')}";
                                                      }
                                                      return null;
                                                    },
                                                    controller: password,
                                                    keyboardType:
                                                        TextInputType
                                                            .visiblePassword,
                                                    obscureText:
                                                        LoginCubit.get(
                                                          context,
                                                        ).isPassVisible,
                                                    textInputAction:
                                                        TextInputAction.done,
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
                                                            LoginCubit.get(
                                                              context,
                                                            ).changePassVisible();
                                                          },
                                                          icon: Icon(
                                                            LoginCubit.get(
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
                                                            borderSide:
                                                                BorderSide(
                                                                  color:
                                                                      state
                                                                          .color,
                                                                ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  20,
                                                                ),
                                                          ),
                                                      hintStyle:
                                                          const TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                      hintText:
                                                          "${AppLocalization.of(context)!.getTranslatedValue('password')}",
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20.0),
                                                  Builder(
                                                    builder:
                                                        (context) =>
                                                            loadingStates !=
                                                                    LoadingStates
                                                                        .loadingLogin
                                                                ? CustomButton(
                                                                  primaryColor:
                                                                      state
                                                                          .color,
                                                                  height: 60.0,
                                                                  width:
                                                                      fullWidth(
                                                                        context,
                                                                      ) *
                                                                      0.8,
                                                                  bgColor:
                                                                      state
                                                                          .color,
                                                                  context:
                                                                      context,
                                                                  onPressed: () {
                                                                    if (formKey
                                                                        .currentState!
                                                                        .validate()) {
                                                                      int
                                                                      index = users.indexWhere(
                                                                        (
                                                                          element,
                                                                        ) =>
                                                                            element['userEmail'] ==
                                                                            email.text,
                                                                      );
                                                                      setState(() {
                                                                        loadingStates =
                                                                            LoadingStates.loadingLogin;
                                                                      });

                                                                      Future.delayed(
                                                                        const Duration(
                                                                          seconds:
                                                                              2,
                                                                        ),
                                                                        () {
                                                                          setState(() {
                                                                            loadingStates =
                                                                                LoadingStates.loadingNone;
                                                                          });
                                                                          if (index !=
                                                                              -1) {
                                                                            debugPrint(
                                                                              "Index is : ${index.toString()}",
                                                                            );
                                                                            debugPrint(
                                                                              "accountType is : ${users[index]['accountType'].toString()}",
                                                                            );

                                                                            UsersAuth().userLogin(
                                                                              accountType:
                                                                                  users[index]['accountType'],
                                                                              userPassword:
                                                                                  password.text.trim(),
                                                                              userEmail:
                                                                                  email.text.trim(),
                                                                              context:
                                                                                  context,
                                                                              mounted:
                                                                                  mounted,
                                                                            );
                                                                          } else {
                                                                            CustomSnackBar(
                                                                              context:
                                                                                  context,
                                                                              translateKey:
                                                                                  'wrongData',
                                                                            );
                                                                          }
                                                                        },
                                                                      );
                                                                    }
                                                                  },
                                                                  translateKey:
                                                                      'enter',
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
                                                                  child: CircularProgressIndicator(
                                                                    color:
                                                                        state
                                                                            .color,
                                                                  ),
                                                                ),
                                                  ),
                                                  const SizedBox(height: 10.0),
                                                  TextButton(
                                                    onPressed: () {},
                                                    autofocus: false,
                                                    clipBehavior: Clip.none,
                                                    style: const ButtonStyle(
                                                      alignment:
                                                          Alignment.center,
                                                      splashFactory:
                                                          NoSplash
                                                              .splashFactory,
                                                    ),
                                                    child: Text(
                                                      "${AppLocalization.of(context)!.getTranslatedValue('forgetPass')}",
                                                      style: TextStyle(
                                                        color: state.color,
                                                        fontFamily:
                                                            CacheHelper.getData(
                                                                      key:
                                                                          'languageCode',
                                                                    ) ==
                                                                    'en'
                                                                ? poppinsMedium
                                                                : tajawalMedium,
                                                        fontSize: 18.0,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10.0),
                                                  Text(
                                                    "${AppLocalization.of(context)!.getTranslatedValue('enterBy')}",
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 20.0,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      CustomButton(
                                                        primaryColor:
                                                            state.color,
                                                        width: 55.0,
                                                        height: 55.0,
                                                        radius: 50.0,
                                                        bgColor: state.color,
                                                        hasBorder: false,
                                                        elevation: 0.0,
                                                        context: context,
                                                        onPressed: () {},
                                                        hasChild: true,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        child: const Icon(
                                                          AmalIcons.facebook,
                                                          color: Colors.white,
                                                          size: 26.0,
                                                        ),
                                                      ),
                                                      CustomButton(
                                                        primaryColor:
                                                            state.color,
                                                        width: 55.0,
                                                        height: 55.0,
                                                        radius: 50.0,
                                                        bgColor: state.color,
                                                        hasBorder: false,
                                                        elevation: 0.0,
                                                        context: context,
                                                        onPressed: () {},
                                                        hasChild: true,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        child: const Icon(
                                                          AmalIcons.apple,
                                                          color: Colors.white,
                                                          size: 26.0,
                                                        ),
                                                      ),
                                                      loadingStates ==
                                                              LoadingStates
                                                                  .loadingGoogle
                                                          ? Container(
                                                            height: 55.0,
                                                            width: 55.0,
                                                            alignment:
                                                                Alignment
                                                                    .center,
                                                            child:
                                                                CircularProgressIndicator(
                                                                  color:
                                                                      state
                                                                          .color,
                                                                ),
                                                          )
                                                          : CustomButton(
                                                            primaryColor:
                                                                state.color,
                                                            width: 55.0,
                                                            height: 55.0,
                                                            radius: 50.0,
                                                            bgColor:
                                                                state.color,
                                                            hasBorder: false,
                                                            elevation: 0.0,
                                                            context: context,
                                                            onPressed: () async {
                                                              // setState(() {
                                                              //   loadingStates =
                                                              //       LoadingStates
                                                              //           .loadingGoogle;
                                                              // });
                                                              // Future.delayed(
                                                              //   const Duration(
                                                              //     seconds: 2,
                                                              //   ),
                                                              //   () {
                                                              //     setState(() {
                                                              //       loadingStates =
                                                              //           LoadingStates
                                                              //               .loadingNone;
                                                              //     });
                                                              //     UsersAuth().userLoginWithGoogle(
                                                              //       userData:
                                                              //           users,
                                                              //       context:
                                                              //           context,
                                                              //       mounted:
                                                              //           mounted,
                                                              //     );
                                                              //   },
                                                              // );
                                                            },
                                                            hasChild: true,
                                                            padding:
                                                                EdgeInsets.zero,
                                                            child: const Icon(
                                                              AmalIcons.google,
                                                              color:
                                                                  Colors.white,
                                                              size: 26.0,
                                                            ),
                                                          ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 40.0),
                                          CustomButton(
                                            primaryColor: state.color,
                                            onPressed: () {
                                              push(
                                                context: context,
                                                page: const RegisterPage(),
                                              );
                                            },
                                            height: 60.0,
                                            width: fullWidth(context) * 0.75,
                                            context: context,
                                            translateKey: 'SignUp',
                                            titleColor: state.color,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
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
