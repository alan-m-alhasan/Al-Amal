// ignore_for_file: unnecessary_null_comparison, prefer_if_null_operators, unnecessary_string_interpolations, prefer_typing_uninitialized_variables, body_might_complete_normally_nullable, deprecated_member_use

import 'package:alamal/controller/alamal_icons.dart';
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
import 'package:alamal/controller/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool enableEdit = false;

  Locale? locale;
  List<dynamic> testList = [];
  List<Map<String, dynamic>> profileData = [];
  DatabaseHelper db = DatabaseHelper();

  String? checkNameFont(String name) {
    if (!name.contains(RegExp(r'[a-zA-Z]'))) {
      return tajawalMedium;
    } else if (name.contains(RegExp(r'[a-zA-Z]'))) {
      return poppinsMedium;
    }
  }

  String? getGender() {
    switch (CacheHelper.getData(key: 'languageCode')) {
      case 'en':
        if (profileData[getUserIndex()]['userGender'] == 'male') {
          return 'Male';
        } else {
          return 'Female';
        }
      case 'ar':
        if (profileData[getUserIndex()]['userGender'] == 'male') {
          return 'ذكر';
        } else {
          return 'انثى';
        }

      default:
    }
    return null;
  }

  String setGender(String gender) {
    if (gender == 'ذكر' || gender == 'Male') {
      return 'male';
    }
    return 'female';
  }

  final List<DropdownMenuItem> _dropdownTestItem = [];
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

  onChangeDropdownTests(selectedTest) {
    setState(() {
      _selectedTest = selectedTest;
    });
  }

  int getUserIndex() {
    return profileData.indexWhere(
        (element) => element['userEmail'] == CacheHelper.getData(key: 'email'));
  }

  IconData suffix = AmalIcons.visible;
  bool isPassVisible = true;
  void changePassVisible() {
    setState(() {
      isPassVisible = !isPassVisible;
      suffix = isPassVisible ? AmalIcons.visible : AmalIcons.invisible;
    });
  }

  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var phone = TextEditingController();
  var age = TextEditingController();
  bool isPageLoading = true;
  String? photoUrl;

  Future<void> getGoogleUser() async {
    final user = await GoogleSignInApi.login();
    photoUrl = user?.photoUrl;
  }

  @override
  void initState() {
    getGoogleUser();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      testList.addAll([
        {'gender': DemoLocalization.of(context)?.getTranslatedValue('male')},
        {'gender': DemoLocalization.of(context)?.getTranslatedValue('female')},
      ]);
      _dropdownTestItem.addAll(buildDropdownTestItems(testList));
    });
    db.getUsers().then((users) {
      setState(() {
        profileData.addAll(users);
      });
      getUserIndex();
      name =
          TextEditingController(text: profileData[getUserIndex()]['userName']);
      email =
          TextEditingController(text: profileData[getUserIndex()]['userEmail']);
      password = TextEditingController(
          text: profileData[getUserIndex()]['userPassword']);
      phone =
          TextEditingController(text: profileData[getUserIndex()]['userPhone']);
      age = TextEditingController(text: profileData[getUserIndex()]['userAge']);
      Future.delayed(
        const Duration(seconds: 2),
        () => setState(
          () => isPageLoading = false,
        ),
      );
    });

    super.initState();
  }

  Widget? getAvatar() {
    if (CacheHelper.getData(key: 'accountType') == 'user') {
      if (profileData[getUserIndex()]['userGender'] == 'male') {
        return SvgPicture.asset(avatarUserMale);
      } else {
        return SvgPicture.asset(avatarUserFemale);
      }
    } else {
      if (profileData[getUserIndex()]['userGender'] == 'male') {
        return SvgPicture.asset(avatarDrMale);
      } else {
        return SvgPicture.asset(avatarDrFemale);
      }
    }
  }

  var formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          if (state is ProfileErrorState) {
            CustomSnackBar(
              context: context,
              translateKey: 'errorHappened',
            );
          }
        },
        builder: (context, state) =>
            BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: isPageLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: state.color,
                      ),
                    )
                  : NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowIndicator();
                        return true;
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.centerEnd,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    color: state.color,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(40.0),
                                      bottomRight: Radius.circular(40.0),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 41.0,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          radius: 40.0,
                                          backgroundColor: state.color,
                                          backgroundImage: photoUrl != null
                                              ? NetworkImage(
                                                  photoUrl.toString(),
                                                )
                                              : null,
                                          child: photoUrl == null
                                              ? getAvatar()
                                              : null,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${DemoLocalization.of(context)!.getTranslatedValue('profile')}",
                                            textAlign: TextAlign.end,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 26.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                CacheHelper.getData(
                                                            key:
                                                                'accountType') ==
                                                        'user'
                                                    ? "${DemoLocalization.of(context)!.getTranslatedValue('user')}"
                                                    : "${DemoLocalization.of(context)!.getTranslatedValue('doctor')}",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                              if (CacheHelper.getData(
                                                      key: 'accountType') ==
                                                  'doctor')
                                                const SizedBox(
                                                  width: 12.0,
                                                ),
                                              if (CacheHelper.getData(
                                                      key: 'accountType') ==
                                                  'doctor')
                                                const Icon(
                                                  Icons.verified_rounded,
                                                  color: Colors.blue,
                                                  size: 22.0,
                                                  shadows: [
                                                    BoxShadow(
                                                      color: Colors.white,
                                                      blurRadius: 10.0,
                                                    ),
                                                    BoxShadow(
                                                      color: Colors.white,
                                                      blurRadius: 10.0,
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 55.0),
                                  child: SvgPicture.asset(
                                    logo2,
                                    color: Colors.white12,
                                    width: 100.0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 16.0,
                                left: 16.0,
                                right: 16.0,
                                top: 10.0,
                              ),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${DemoLocalization.of(context)!.getTranslatedValue('name')}",
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        enableEdit == false
                                            ? Container(
                                                alignment: Alignment.center,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Text(
                                                  profileData[getUserIndex()]
                                                      ['userName'],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 22.0,
                                                    fontFamily: checkNameFont(
                                                      profileData[
                                                              getUserIndex()]
                                                          ['userName'],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                alignment: Alignment.center,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  border: Border.all(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "${DemoLocalization.of(context)!.getTranslatedValue('plzFillField')}";
                                                    }
                                                    return null;
                                                  },
                                                  controller: name,
                                                  textAlign: TextAlign.center,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  keyboardType:
                                                      TextInputType.name,
                                                  style: TextStyle(
                                                    fontSize: 22.0,
                                                    fontFamily: checkNameFont(
                                                        name.text),
                                                  ),
                                                  decoration: InputDecoration(
                                                    focusColor: Colors.red,
                                                    enabled: enableEdit,
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    enableEdit == false
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${DemoLocalization.of(context)!.getTranslatedValue('email')}",
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Text(
                                                  profileData[getUserIndex()]
                                                      ['userEmail'],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontFamily: poppinsMedium,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${DemoLocalization.of(context)!.getTranslatedValue('email')}",
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  border: Border.all(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  // enabled: false,
                                                  controller: email,
                                                  textAlign: TextAlign.center,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontFamily: poppinsMedium,
                                                  ),
                                                  decoration: InputDecoration(
                                                    focusColor: Colors.red,
                                                    enabled: enableEdit,
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    enableEdit == false
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${DemoLocalization.of(context)!.getTranslatedValue('password')}",
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Text(
                                                  "********",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontFamily: poppinsMedium,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${DemoLocalization.of(context)!.getTranslatedValue('password')}",
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  border: Border.all(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  // enabled: false,
                                                  controller: password,
                                                  textAlign: TextAlign.center,
                                                  obscureText: isPassVisible,

                                                  textInputAction:
                                                      TextInputAction.next,
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontFamily: poppinsMedium,
                                                  ),
                                                  decoration: InputDecoration(
                                                    suffixIcon: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 10.0,
                                                      ),
                                                      child: IconButton(
                                                        color: state.color,
                                                        onPressed: () {
                                                          changePassVisible();
                                                        },
                                                        icon: Icon(
                                                          suffix,
                                                        ),
                                                      ),
                                                    ),
                                                    focusColor: Colors.red,
                                                    enabled: enableEdit,
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    enableEdit == false
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${DemoLocalization.of(context)!.getTranslatedValue('phone')}",
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Text(
                                                  profileData[getUserIndex()]
                                                      ['userPhone'],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 22.0,
                                                    fontFamily: poppinsMedium,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            // textDirection: TextDirection.rtl,
                                            children: [
                                              Text(
                                                "${DemoLocalization.of(context)!.getTranslatedValue('phone')}",
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  border: Border.all(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "${DemoLocalization.of(context)!.getTranslatedValue('plzFillField')}";
                                                    }
                                                    return null;
                                                  },
                                                  controller: phone,
                                                  textAlign: TextAlign.center,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  style: TextStyle(
                                                    fontSize: 22.0,
                                                    fontFamily: poppinsMedium,
                                                  ),
                                                  decoration: InputDecoration(
                                                    focusColor: Colors.red,
                                                    enabled: enableEdit,
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    enableEdit == false
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${DemoLocalization.of(context)!.getTranslatedValue('age')}",
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Text(
                                                  profileData[getUserIndex()]
                                                      ['userAge'],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 22.0,
                                                    fontFamily: poppinsMedium,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${DemoLocalization.of(context)!.getTranslatedValue('age')}",
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  border: Border.all(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "${DemoLocalization.of(context)!.getTranslatedValue('plzFillField')}";
                                                    }
                                                    return null;
                                                  },
                                                  controller: age,
                                                  textAlign: TextAlign.center,
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: TextStyle(
                                                    fontSize: 22.0,
                                                    fontFamily: poppinsMedium,
                                                  ),
                                                  decoration: InputDecoration(
                                                    focusColor: Colors.red,
                                                    enabled: enableEdit,
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    enableEdit == false
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${DemoLocalization.of(context)!.getTranslatedValue('gender')}",
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      getGender().toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize:
                                                            CacheHelper.getData(
                                                                        key:
                                                                            'languageCode') ==
                                                                    'en'
                                                                ? 22.0
                                                                : 24.0,
                                                        fontFamily:
                                                            CacheHelper.getData(
                                                                        key:
                                                                            'languageCode') ==
                                                                    'en'
                                                                ? poppinsMedium
                                                                : tajawalMedium,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${DemoLocalization.of(context)!.getTranslatedValue('gender')}",
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  border: Border.all(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: DropdownBelow(
                                                  icon: const Icon(Icons
                                                      .keyboard_arrow_down_rounded),
                                                  itemWidth: 300.0,
                                                  boxWidth: 300.0,
                                                  boxHeight: 45.0,
                                                  itemTextstyle: TextStyle(
                                                    fontFamily: CacheHelper.getData(
                                                                key:
                                                                    'languageCode') ==
                                                            'en'
                                                        ? poppinsMedium
                                                        : tajawalMedium,
                                                    color: Colors.black,
                                                    fontSize: 13.0,
                                                  ),
                                                  boxTextstyle: TextStyle(
                                                    fontFamily: CacheHelper.getData(
                                                                key:
                                                                    'languageCode') ==
                                                            'en'
                                                        ? poppinsMedium
                                                        : tajawalMedium,
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                  ),
                                                  onBoxStateChanged: (change) =>
                                                      true,
                                                  value: _selectedTest,
                                                  onChanged:
                                                      onChangeDropdownTests,
                                                  items: _dropdownTestItem,
                                                  hint: Text(
                                                    "${DemoLocalization.of(context)!.getTranslatedValue('gender')}",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          CacheHelper.getData(
                                                                      key:
                                                                          'languageCode') ==
                                                                  'en'
                                                              ? poppinsMedium
                                                              : tajawalMedium,
                                                      color: Colors.black,
                                                      fontSize: 20.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                            ),
                            if (enableEdit == false)
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: CustomButton(
                                  primaryColor: state.color,
                                  onPressed: () {
                                    setState(() {
                                      enableEdit = true;
                                    });
                                  },
                                  translateKey: 'edit',
                                  context: context,
                                  bgColor: state.color,
                                  width: fullWidth(context),
                                ),
                              )
                            else
                              !isLoading
                                  ? Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CustomButton(
                                            primaryColor: state.color,
                                            onPressed: () {
                                              setState(() {
                                                enableEdit = false;
                                              });
                                            },
                                            translateKey: 'cancel',
                                            context: context,
                                            bgColor: Colors.red,
                                            hasBorder: false,
                                            width: 150.0,
                                          ),
                                          const SizedBox(
                                            width: 15.0,
                                          ),
                                          CustomButton(
                                            primaryColor: state.color,
                                            onPressed: () {
                                              if ((formKey.currentState!
                                                      .validate()) &&
                                                  (_selectedTest != null)) {
                                                setState(() {
                                                  isLoading = true;
                                                });
                                                Future.delayed(
                                                  const Duration(seconds: 1),
                                                  () {
                                                    UsersAuth().userUpdate(
                                                      userId: profileData[
                                                              getUserIndex()]
                                                          ['userId'],
                                                      accountType: profileData[
                                                              getUserIndex()]
                                                          ['accountType'],
                                                      userName: name.text,
                                                      userPassword:
                                                          password.text,
                                                      userEmail: email.text,
                                                      userPhone: phone.text,
                                                      userAge: age.text,
                                                      userGender: setGender(
                                                          _selectedTest[
                                                                  'gender']
                                                              .toString()),
                                                      context: context,
                                                      mounted: mounted,
                                                    );
                                                    setState(() {
                                                      isLoading = false;
                                                      enableEdit = false;
                                                    });
                                                  },
                                                );
                                              }
                                              if (_selectedTest == null) {
                                                CustomSnackBar(
                                                  context: context,
                                                  translateKey: 'plzChooseGen',
                                                );
                                              }
                                            },
                                            translateKey: 'save',
                                            context: context,
                                            bgColor: state.color,
                                            hasBorder: false,
                                            width: 150.0,
                                          ),
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: CircularProgressIndicator(
                                        color: state.color,
                                      ),
                                    ),
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
