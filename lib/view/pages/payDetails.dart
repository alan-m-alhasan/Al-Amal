// ignore_for_file: file_names, deprecated_member_use, library_private_types_in_public_api

import 'package:alamal/controller/alamal_icons.dart';
import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/custom_snackbar.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/lang_bloc.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/view/pages/callThanks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slidable_button/slidable_button.dart';

class PayDetails extends StatefulWidget {
  const PayDetails({super.key});

  @override
  _PayDetailsState createState() => _PayDetailsState();
}

class _PayDetailsState extends State<PayDetails> {
  TextEditingController nameCon = TextEditingController();
  TextEditingController numCard1 = TextEditingController();
  TextEditingController numCard2 = TextEditingController();
  TextEditingController numCard3 = TextEditingController();
  TextEditingController numCard4 = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController expiryDate = TextEditingController();
  TextEditingController cvvCon = TextEditingController();
  var formKey = GlobalKey<FormState>();
  List<TextEditingController> controllers = [];

  void onChanged(String value) {
    cardNumber = TextEditingController(
      text: '${numCard1.text}${numCard2.text}${numCard3.text}${numCard4.text}',
    );
  }

  @override
  void initState() {
    cardNumber.addListener(() {});
    controllers.addAll([numCard1, numCard2, numCard3, numCard4]);
    super.initState();
  }

  String? langCode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        langCode = state.locale.languageCode;
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: state.color,
                  elevation: 0.0,
                  leading: CustomBackButton(langCode.toString(), context),
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
                    "${AppLocalization.of(context)!.getTranslatedValue('payDetails')}",
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                body: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 10.0),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              "${AppLocalization.of(context)!.getTranslatedValue('enterPayDetails')}",
                              style: TextStyle(
                                fontSize: 22.0,
                                fontFamily:
                                    CacheHelper.getData(key: 'languageCode') ==
                                            'en'
                                        ? poppinsMedium
                                        : tajawalMedium,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${AppLocalization.of(context)?.getTranslatedValue('full_name')}",
                                      style: const TextStyle(fontSize: 18.0),
                                    ),
                                    const SizedBox(height: 10.0),
                                    TextFormField(
                                      cursorWidth: 1.0,
                                      maxLines: 1,
                                      controller: nameCon,
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: state.color,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: state.color,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            20.0,
                                          ),
                                        ),
                                        hintStyle: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                        hintText:
                                            "${AppLocalization.of(context)!.getTranslatedValue('full_name')}",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${AppLocalization.of(context)?.getTranslatedValue('card_num')}",
                                      style: const TextStyle(fontSize: 18.0),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          for (int i = 0; i < 4; i++)
                                            SizedBox(
                                              width: 75.0,
                                              child: TextFormField(
                                                onChanged: onChanged,
                                                cursorWidth: 1.0,
                                                maxLines: 1,
                                                buildCounter:
                                                    (
                                                      context, {
                                                      required currentLength,
                                                      required isFocused,
                                                      maxLength,
                                                    }) => null,
                                                controller: controllers[i],
                                                textAlign: TextAlign.center,
                                                maxLength: 4,
                                                textAlignVertical:
                                                    TextAlignVertical.bottom,
                                                textInputAction:
                                                    TextInputAction.next,
                                                keyboardType:
                                                    TextInputType.number,
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
                                                  hintText: "****",
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40.0),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${AppLocalization.of(context)?.getTranslatedValue('exp_date')}",
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),
                                          TextFormField(
                                            cursorWidth: 1.0,
                                            maxLines: 1,
                                            controller: expiryDate,
                                            textAlign: TextAlign.center,
                                            maxLength: 5,
                                            buildCounter:
                                                (
                                                  context, {
                                                  required currentLength,
                                                  required isFocused,
                                                  maxLength,
                                                }) => null,
                                            textAlignVertical:
                                                TextAlignVertical.bottom,
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType: TextInputType.text,
                                            cursorColor: state.color,
                                            decoration: InputDecoration(
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0),
                                                ),
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
                                              hintText: "01/23",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16.0),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${AppLocalization.of(context)?.getTranslatedValue('cvv')}",
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),
                                          TextFormField(
                                            cursorWidth: 1.0,
                                            maxLines: 1,
                                            controller: cvvCon,
                                            textAlign: TextAlign.center,
                                            maxLength: 3,
                                            buildCounter:
                                                (
                                                  context, {
                                                  required currentLength,
                                                  required isFocused,
                                                  maxLength,
                                                }) => null,
                                            textAlignVertical:
                                                TextAlignVertical.bottom,
                                            textInputAction:
                                                TextInputAction.done,
                                            keyboardType: TextInputType.number,
                                            cursorColor: state.color,
                                            decoration: InputDecoration(
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0),
                                                ),
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
                                              hintText: "123",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 100.0),
                          HorizontalSlidableButton(
                            isRestart: true,
                            onChanged: (slide) {
                              if (nameCon.text.isNotEmpty &&
                                  cardNumber.text.isNotEmpty &&
                                  cvvCon.text.isNotEmpty &&
                                  expiryDate.text.isNotEmpty) {
                                push(
                                  context: context,
                                  page: const CallThanks(),
                                );
                                debugPrint("Done -------------");
                              } else {
                                CustomSnackBar(
                                  context: context,
                                  translateKey: 'enterPayDetails',
                                );
                              }
                              debugPrint(nameCon.text);
                              debugPrint(cardNumber.text);
                              debugPrint(expiryDate.text);
                              debugPrint(cvvCon.text);
                            },
                            borderRadius: BorderRadius.circular(20.0),
                            color: state.color.withOpacity(0.2),
                            buttonColor: state.color,
                            width: fullWidth(context) - 50.0,
                            height: 65.0,
                            buttonWidth: fullWidth(context) * 0.5,
                            label: Container(
                              alignment: Alignment.center,
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${AppLocalization.of(context)!.getTranslatedValue('pay')}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontFamily:
                                            CacheHelper.getData(
                                                      key: 'languageCode',
                                                    ) ==
                                                    'en'
                                                ? poppinsMedium
                                                : tajawalMedium,
                                      ),
                                    ),
                                    const SizedBox(width: 14.0),
                                    const Icon(
                                      AmalIcons.send2,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 35.0,
                              ),
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "10\$",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: state.color,
                                    fontFamily: poppinsMedium,
                                    fontSize: 25.0,
                                  ),
                                ),
                              ),
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
        );
      },
    );
  }
}
