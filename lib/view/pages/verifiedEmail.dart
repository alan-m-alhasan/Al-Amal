// ignore_for_file: file_names, unnecessary_brace_in_string_interps, dead_code, prefer_typing_uninitialized_variables

import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/custom_button.dart';
import 'package:alamal/controller/custom_snackbar.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/cubit.dart';
import 'package:alamal/model/states.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/view/pages/doctor/doctor_home.dart';
import 'package:alamal/view/pages/zoom_drawer_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifiedEmail extends StatefulWidget {
  final email;
  final password;

  const VerifiedEmail({super.key, required this.email, required this.password});

  @override
  State<VerifiedEmail> createState() => _VerifiedEmailState();
}

class _VerifiedEmailState extends State<VerifiedEmail> {
  var pinCon = TextEditingController();
  var formKey = GlobalKey<FormState>();

  // bool isValidate = false;

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
            // showToast(
            //   text:
            //       "${DemoLocalization.of(context)!.getTranslatedValue('enterSuccess')}",
            //   color: Colors.green,
            // );
            CustomSnackBar(context: context, translateKey: 'enterSuccess');
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
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                  (Route<dynamic> route) => false,
                );
              }
            });
          }

          if (state is LoginErrorState) {
            CustomSnackBar(context: context, translateKey: 'makeSureInfo');
          }
        },
        builder:
            (context, state) => BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return SafeArea(
                  child: Scaffold(
                    body: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: NotificationListener<
                        OverscrollIndicatorNotification
                      >(
                        onNotification: (overscroll) {
                          overscroll.disallowIndicator();
                          return true;
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  "assets/imgs/verify.svg",
                                  alignment: Alignment.center,
                                  width: 200.0,
                                  height: 200.0,
                                ),
                              ),
                              const SizedBox(height: 40.0),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${AppLocalization.of(context)!.getTranslatedValue('verifiedEmail')}",
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontFamily:
                                          CacheHelper.getData(
                                                    key: 'languageCode',
                                                  ) ==
                                                  'en'
                                              ? poppinsMedium
                                              : tajawalMedium,
                                    ),
                                  ),
                                  const SizedBox(height: 15.0),
                                  Flex(
                                    direction: Axis.vertical,
                                    children: [
                                      Text(
                                        "${AppLocalization.of(context)!.getTranslatedValue('enterCodeSentEmail')}",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        "${widget.email}",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontFamily:
                                              CacheHelper.getData(
                                                        key: 'languageCode',
                                                      ) ==
                                                      'en'
                                                  ? poppinsMedium
                                                  : tajawalMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 50.0),
                              Form(
                                key: formKey,
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: PinCodeTextField(
                                    controller: pinCon,
                                    hintCharacter: 'X',
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    pinTheme: PinTheme(
                                      borderWidth: 2.0,
                                      fieldHeight: 60.0,
                                      fieldWidth: 50.0,
                                      shape: PinCodeFieldShape.box,
                                      borderRadius: BorderRadius.circular(5.0),
                                      activeFillColor: Colors.white,
                                      inactiveFillColor: Colors.grey[300],
                                      selectedFillColor: Colors.grey[300],
                                      inactiveColor: Colors.black54,
                                      activeColor: state.color,
                                      selectedColor: Colors.black,
                                    ),
                                    cursorColor: Colors.black,
                                    cursorWidth: 1.0,
                                    enablePinAutofill: true,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        // showToast(
                                        //   text:
                                        //       "${DemoLocalization.of(context)!.getTranslatedValue('enterVerifyCodeFull')}",
                                        //   color: Colors.red,
                                        // );
                                        // CustomSnackBar(
                                        //   context: context,
                                        //   translateKey: 'enterVerifyCodeFull',
                                        // );
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
                                    appContext: context,
                                    length: 5,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    onCompleted: (value) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${AppLocalization.of(context)!.getTranslatedValue('noCodeArrived')}",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  TextButton(
                                    style: ButtonStyle(
                                      alignment: Alignment.center,
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                            Colors.green,
                                          ),
                                      splashFactory: NoSplash.splashFactory,
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "${AppLocalization.of(context)!.getTranslatedValue('resend')}",
                                      style: const TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40.0),
                              if (state is! LoginLoadingState)
                                CustomButton(
                                  primaryColor: state.color,
                                  hasBorder:
                                      pinCon.text.length == 5 ? true : false,
                                  context: context,
                                  onPressed:
                                      pinCon.text.length == 5
                                          ? () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              // LoginCubit.get(context).userLogin(
                                              //   email: widget.email,
                                              //   password: widget.password,
                                              // );
                                              CustomSnackBar(
                                                context: context,
                                                translateKey: 'enterSuccess',
                                              );
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) =>
                                                          const MainScreen(),
                                                ),
                                                (Route<dynamic> route) => false,
                                              );
                                            }
                                          }
                                          : null,
                                  bgColor: state.color,
                                  width: fullWidth(context),
                                  translateKey: 'confirm',
                                )
                              else
                                Container(
                                  alignment: Alignment.center,
                                  child: const CircularProgressIndicator(
                                    color: Colors.green,
                                  ),
                                ),
                            ],
                          ),
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
