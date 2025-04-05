// ignore_for_file: unused_field, library_private_types_in_public_api

import 'dart:io';

import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/custom_button.dart';
import 'package:alamal/controller/custom_snackbar.dart';
import 'package:alamal/db/sql_helper.dart';
import 'package:alamal/db/users_auth.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class VerifyAccount extends StatefulWidget {
  const VerifyAccount({super.key});

  @override
  _VerifyAccountState createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController(),
      email = TextEditingController(),
      phone = TextEditingController(),
      country = TextEditingController(),
      city = TextEditingController(),
      specialty = TextEditingController(),
      degree = TextEditingController(),
      licenseNumber = TextEditingController(),
      licenseAuthority = TextEditingController(),
      workplace = TextEditingController();

  XFile? _certificate, _license, _id, _profileImage;
  final ImagePicker _picker = ImagePicker();
  bool? isAgree = false;

  Future<void> _pickFile(Function(XFile) onFilePicked) async {
    final XFile? result = await _picker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      onFilePicked(result);
    }
  }

  bool isSendLoading = false;
  bool isLoading = true;

  void _submitForm() {
    if (name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        country.text.isNotEmpty &&
        city.text.isNotEmpty &&
        specialty.text.isNotEmpty &&
        degree.text.isNotEmpty &&
        licenseNumber.text.isNotEmpty &&
        licenseAuthority.text.isNotEmpty &&
        workplace.text.isNotEmpty) {
      if (_certificate != null &&
          _license != null &&
          _id != null &&
          _profileImage != null) {
        if (isAgree == true) {
          _formKey.currentState!.save();
          // Sending To Server ....

          setState(() {
            isSendLoading = true;
          });
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                isSendLoading = false;
              });
              UsersAuth().verifyAccountAsDoctor(
                id: accountsData[getUserIndex()]['userId'],
                context: context,
                mounted: mounted,
              );
              CustomSnackBar(context: context, translateKey: 'sendingDone');
            },
          );
        } else {
          CustomSnackBar(
              context: context, translateKey: 'plzAgreePrivacyPolicy');
        }
      } else {
        CustomSnackBar(
            context: context, translateKey: 'upload_required_pictures');
      }
    } else {
      CustomSnackBar(context: context, translateKey: 'plzFillAllFields');
    }
  }

  List<Map<String, dynamic>> accountsData = [];
  DatabaseHelper db = DatabaseHelper();
  int getUserIndex() {
    return accountsData.indexWhere(
        (element) => element['userEmail'] == CacheHelper.getData(key: 'email'));
  }

  String? checkTextFont(String text) {
    if (!text.contains(RegExp(r'[a-zA-Z]'))) {
      return tajawalRegular;
    } else if (text.contains(RegExp(r'[a-zA-Z]'))) {
      return poppinsRegular;
    }
    return null;
  }

  @override
  void initState() {
    db.getUsers().then((users) {
      setState(() {
        accountsData.addAll(users);
      });
      getUserIndex();
      name =
          TextEditingController(text: accountsData[getUserIndex()]['userName']);
      email = TextEditingController(
          text: accountsData[getUserIndex()]['userEmail']);
      phone = TextEditingController(
          text: accountsData[getUserIndex()]['userPhone']);
      Future.delayed(
        const Duration(seconds: 2),
        () {
          setState(() {
            isLoading = false;
          });
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: state.color,
            elevation: 0.0,
            leading: Directionality(
              textDirection: CacheHelper.getData(key: 'languageCode') == 'ar'
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.white,
                iconSize: 22.0,
                icon: CacheHelper.getData(key: 'languageCode') == 'ar'
                    ? const Icon(
                        Icons.arrow_forward_ios_rounded,
                      )
                    : const Icon(
                        Icons.arrow_back_ios_new_rounded,
                      ),
              ),
            ),
            toolbarHeight: 75.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
            titleSpacing: 0.0,
            leadingWidth: 65.0,
            title: Text(
              "${DemoLocalization.of(context)!.getTranslatedValue('account_verify')}",
              overflow: TextOverflow.visible,
              softWrap: true,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          body: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: state.color,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowIndicator();
                        return true;
                      },
                      child: ListView(
                        clipBehavior: Clip.none,
                        children: [
                          TextFormField(
                            style: TextStyle(
                              color: state.color,
                              fontFamily: checkTextFont(
                                  accountsData[getUserIndex()]['userName']),
                            ),
                            cursorWidth: 1.0,
                            maxLines: 1,
                            controller: name,
                            readOnly: true,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            cursorColor: state.color,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: state.color,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintStyle: TextStyle(
                                color: state.color,
                                fontFamily: checkTextFont(
                                    accountsData[getUserIndex()]['userName']),
                              ),
                              hintText: accountsData[getUserIndex()]
                                  ['userName'],
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            style: TextStyle(
                              color: state.color,
                              fontFamily: poppinsRegular,
                              fontSize: 16.0,
                            ),
                            cursorWidth: 1.0,
                            maxLines: 1,
                            controller: email,
                            readOnly: true,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            cursorColor: state.color,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: state.color,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintStyle: TextStyle(
                                color: state.color,
                                fontFamily: poppinsRegular,
                              ),
                              hintText: accountsData[getUserIndex()]
                                  ['userEmail'],
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            style: TextStyle(
                              color: state.color,
                              fontFamily: poppinsRegular,
                              fontSize: 16.0,
                            ),
                            cursorWidth: 1.0,
                            maxLines: 1,
                            controller: phone,
                            readOnly: true,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            cursorColor: state.color,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: state.color,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintStyle: TextStyle(
                                color: state.color,
                                fontFamily: poppinsRegular,
                              ),
                              hintText: accountsData[getUserIndex()]
                                  ['userPhone'],
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            style: TextStyle(
                              color: state.color,
                              fontFamily: checkTextFont(country.text),
                            ),
                            cursorWidth: 1.0,
                            maxLines: 1,
                            controller: country,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            cursorColor: state.color,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: state.color,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: checkTextFont(
                                    "${DemoLocalization.of(context)!.getTranslatedValue('country')}"),
                              ),
                              hintText:
                                  "${DemoLocalization.of(context)!.getTranslatedValue('country')}",
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            style: TextStyle(
                              color: state.color,
                              fontFamily: checkTextFont(city.text),
                            ),
                            cursorWidth: 1.0,
                            maxLines: 1,
                            controller: city,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            cursorColor: state.color,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: state.color,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: checkTextFont(
                                    "${DemoLocalization.of(context)!.getTranslatedValue('city')}"),
                              ),
                              hintText:
                                  "${DemoLocalization.of(context)!.getTranslatedValue('city')}",
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            style: TextStyle(
                              color: state.color,
                              fontFamily: checkTextFont(specialty.text),
                            ),
                            cursorWidth: 1.0,
                            maxLines: 1,
                            controller: specialty,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            cursorColor: state.color,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: state.color,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: checkTextFont(
                                    "${DemoLocalization.of(context)!.getTranslatedValue('medical_special')}"),
                              ),
                              hintText:
                                  "${DemoLocalization.of(context)!.getTranslatedValue('medical_special')}",
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            style: TextStyle(
                              color: state.color,
                              fontFamily: checkTextFont(degree.text),
                            ),
                            cursorWidth: 1.0,
                            maxLines: 1,
                            controller: degree,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            cursorColor: state.color,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: state.color,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: checkTextFont(
                                    "${DemoLocalization.of(context)!.getTranslatedValue('academic_deg')}"),
                              ),
                              hintText:
                                  "${DemoLocalization.of(context)!.getTranslatedValue('academic_deg')}",
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            style: TextStyle(
                              color: state.color,
                              fontFamily: checkTextFont(licenseNumber.text),
                            ),
                            cursorWidth: 1.0,
                            maxLines: 1,
                            controller: licenseNumber,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            cursorColor: state.color,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: state.color,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: checkTextFont(
                                    "${DemoLocalization.of(context)!.getTranslatedValue('medical_lice_num')}"),
                              ),
                              hintText:
                                  "${DemoLocalization.of(context)!.getTranslatedValue('medical_lice_num')}",
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            style: TextStyle(
                              color: state.color,
                              fontFamily: checkTextFont(licenseAuthority.text),
                            ),
                            cursorWidth: 1.0,
                            maxLines: 1,
                            controller: licenseAuthority,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            cursorColor: state.color,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: state.color,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: checkTextFont(
                                    "${DemoLocalization.of(context)!.getTranslatedValue('lice_auth')}"),
                              ),
                              hintText:
                                  "${DemoLocalization.of(context)!.getTranslatedValue('lice_auth')}",
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            style: TextStyle(
                              color: state.color,
                              fontFamily: checkTextFont(workplace.text),
                            ),
                            cursorWidth: 1.0,
                            maxLines: 1,
                            controller: workplace,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            cursorColor: state.color,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: state.color,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: checkTextFont(
                                    "${DemoLocalization.of(context)!.getTranslatedValue('workplace')}"),
                              ),
                              hintText:
                                  "${DemoLocalization.of(context)!.getTranslatedValue('workplace')}",
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            children: [
                              CustomButton(
                                textAlign: TextAlign.center,
                                width: (fullWidth(context) * 0.5) - 21.0,
                                height: 150.0,
                                context: context,
                                onPressed: () => _pickFile(
                                  (file) => setState(() => _certificate = file),
                                ),
                                primaryColor: state.color,
                                titleColor: state.color,
                                titleFontSize: 16.0,
                                hasChild: _certificate != null,
                                child: _certificate != null
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.file(
                                          File(_certificate!.path),
                                        ),
                                      )
                                    : null,
                                translateKey: _certificate == null
                                    ? "upload_medical_cert"
                                    : "uploaded",
                              ),
                              const SizedBox(width: 10.0),
                              CustomButton(
                                context: context,
                                contentAlignment: Alignment.center,
                                primaryColor: state.color,
                                onPressed: () => _pickFile(
                                  (file) => setState(() => _license = file),
                                ),
                                titleColor: state.color,
                                titleFontSize: 16.0,
                                textAlign: TextAlign.center,
                                width: (fullWidth(context) * 0.5) - 21.0,
                                height: 150.0,
                                hasChild: _license != null,
                                child: _license != null
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.file(
                                          File(_license!.path),
                                        ),
                                      )
                                    : null,
                                translateKey: _license == null
                                    ? "upload_medical_lice_card"
                                    : "uploaded",
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              CustomButton(
                                context: context,
                                primaryColor: state.color,
                                onPressed: () => _pickFile(
                                  (file) => setState(() => _id = file),
                                ),
                                titleColor: state.color,
                                titleFontSize: 16.0,
                                textAlign: TextAlign.center,
                                width: (fullWidth(context) * 0.5) - 21.0,
                                height: 150.0,
                                hasChild: _id != null,
                                child: _id != null
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.file(
                                          File(_id!.path),
                                        ),
                                      )
                                    : null,
                                translateKey: _id == null
                                    ? "upload_personal_ID"
                                    : "uploaded",
                              ),
                              const SizedBox(width: 10.0),
                              CustomButton(
                                context: context,
                                primaryColor: state.color,
                                onPressed: () => _pickFile(
                                  (file) =>
                                      setState(() => _profileImage = file),
                                ),
                                titleColor: state.color,
                                titleFontSize: 16.0,
                                textAlign: TextAlign.center,
                                width: (fullWidth(context) * 0.5) - 21.0,
                                height: 150.0,
                                hasChild: _profileImage != null,
                                child: _profileImage != null
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.file(
                                          File(_profileImage!.path),
                                        ),
                                      )
                                    : null,
                                translateKey: _profileImage == null
                                    ? "upload_profile_picture"
                                    : "uploaded",
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            children: [
                              Checkbox(
                                value: isAgree,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                fillColor:
                                    MaterialStateProperty.all(state.color),
                                activeColor: state.color,
                                onChanged: (value) {
                                  setState(() {
                                    isAgree = value;
                                  });
                                },
                              ),
                              Expanded(
                                child: Text(
                                  "${DemoLocalization.of(context)!.getTranslatedValue('agree_privacy_policy')}",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          isSendLoading
                              ? Container(
                                  height: 60.0,
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(
                                    color: state.color,
                                  ),
                                )
                              : CustomButton(
                                  context: context,
                                  primaryColor: state.color,
                                  onPressed: _submitForm,
                                  bgColor: state.color,
                                  titleColor: Colors.white,
                                  translateKey: "send",
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
