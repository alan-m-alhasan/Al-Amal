import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

// Color primaryColor = Color(CacheHelper.getData(key: 'primaryColor'));
// Color primaryColor = Colors.green;
String poppinsRegular = 'Poppins-Regular';
String poppinsMedium = 'Poppins-Medium';
String poppinsBold = 'Poppins-Bold';
String tajawalRegular = 'Tajawal-Regular';
String tajawalMedium = 'Tajawal-Medium';
String tajawalBold = 'Tajawal-Bold';

String avatarUserMale = "assets/imgs/userMale.svg";
String avatarUserFemale = "assets/imgs/userFemale.svg";
String doctorMale = "assets/imgs/avatarMale.svg";
String doctorFemale = "assets/imgs/avatarFemale.svg";
String patientFemale = 'assets/imgs/patient-female.svg';
String patientMale = 'assets/imgs/patient-male.svg';
String logo = 'assets/imgs/logo.svg';
String logo2 = 'assets/imgs/logo2.svg';
String alamal = 'assets/imgs/al-amal.svg';
String visaPay = 'assets/imgs/visa.svg';
String stcPay = 'assets/imgs/stc-pay.svg';
String applePay = 'assets/imgs/apple-pay.svg';
String drIcon = 'assets/imgs/dr-icon.svg';
String drSearch = 'assets/imgs/doctor-search.svg';
String patientIcon = 'assets/imgs/patient-icon.svg';
String voiceCall = 'assets/imgs/voice_call.svg';
String consultationOutlined = 'assets/imgs/consultation_outlined.svg';
String lottieLogo = 'assets/lottie/logo.json';
String logoSound = 'assets/sound/logo-sound.mp3';

double fullWidth(BuildContext context) => MediaQuery.of(context).size.width;

double fullHeight(BuildContext context) => MediaQuery.of(context).size.height;

void push({required BuildContext context, required Widget page}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));

void pushAndRmvUntil({required BuildContext context, required Widget page}) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );

void pushReplacement({required BuildContext context, required Widget page}) =>
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );

void pop({required BuildContext context}) => Navigator.pop(context);

Widget CustomBackButton(String langCode, BuildContext context) => IconButton(
  onPressed: () {
    pop(context: context);
  },
  color: Colors.white,
  iconSize: 22.0,
  icon:
      langCode == 'ar'
          ? const Icon(HugeIcons.strokeRoundedArrowRight02)
          : const Icon(HugeIcons.strokeRoundedArrowLeft02),
);
