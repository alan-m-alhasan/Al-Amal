// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print, unused_import, prefer_typing_uninitialized_variables, deprecated_member_use

import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/custom_button.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/cubit.dart';
import 'package:alamal/model/states.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/view/pages/book_date.dart';
import 'package:alamal/view/pages/consultation.dart';
import 'package:alamal/view/pages/drawer.dart';
import 'package:alamal/view/pages/voiceCall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorScreen extends StatefulWidget {
  final String name;
  final String specialty;
  final String phone;
  final String location;
  final String gender;

  const DoctorScreen({
    Key? key,
    required this.name,
    required this.specialty,
    required this.phone,
    required this.location,
    required this.gender,
  }) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLongPressed = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder:
            (context, state) => BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return SafeArea(
                  child: Scaffold(
                    key: scaffoldKey,
                    body: Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            Container(
                              height: 100.0,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 20.0,
                              ),
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
                                    maxRadius: 26.5,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      backgroundColor: state.color,
                                      maxRadius: 25.0,
                                      child:
                                          widget.gender == 'male'
                                              ? SvgPicture.asset(avatarDrMale)
                                              : SvgPicture.asset(
                                                avatarDrFemale,
                                              ),
                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            widget.name,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22.0,
                                              fontFamily:
                                                  CacheHelper.getData(
                                                            key: 'languageCode',
                                                          ) ==
                                                          'en'
                                                      ? poppinsMedium
                                                      : tajawalMedium,
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          const Icon(
                                            Icons.verified_rounded,
                                            color: Colors.blue,
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
                                      Text(
                                        widget.specialty,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 55.0,
                              ),
                              child: SvgPicture.asset(
                                logo2,
                                color: Colors.white12,
                                width: 100.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 26.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Flex(
                            direction: Axis.vertical,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${AppLocalization.of(context)!.getTranslatedValue("consultations")}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontFamily:
                                      CacheHelper.getData(
                                                key: 'languageCode',
                                              ) ==
                                              'en'
                                          ? poppinsMedium
                                          : tajawalMedium,
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Center(
                                child: Flex(
                                  direction: Axis.vertical,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12.0),
                                      decoration: BoxDecoration(
                                        color: state.color.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(
                                          20.0,
                                        ),
                                        border: Border.all(
                                          color: state.color,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Flex(
                                        direction: Axis.horizontal,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flex(
                                            direction: Axis.horizontal,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${AppLocalization.of(context)!.getTranslatedValue('writtenConsult')}",
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.black,
                                                  fontFamily:
                                                      CacheHelper.getData(
                                                                key:
                                                                    'languageCode',
                                                              ) ==
                                                              'en'
                                                          ? poppinsMedium
                                                          : tajawalMedium,
                                                ),
                                              ),
                                              const SizedBox(width: 6.0),
                                              Text(
                                                "(${AppLocalization.of(context)!.getTranslatedValue('free')})",
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.black,
                                                  fontFamily:
                                                      CacheHelper.getData(
                                                                key:
                                                                    'languageCode',
                                                              ) ==
                                                              'en'
                                                          ? poppinsMedium
                                                          : tajawalMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 45.0,
                                            child: MaterialButton(
                                              onPressed: () {
                                                push(
                                                  context: context,
                                                  page: const Consultation(),
                                                );
                                              },
                                              elevation: 0.0,
                                              hoverElevation: 0.0,
                                              highlightElevation: 0.0,
                                              color: state.color,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              child: Text(
                                                "${AppLocalization.of(context)!.getTranslatedValue('showDetails')}",
                                                style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Container(
                                      padding: const EdgeInsets.all(12.0),
                                      width: fullWidth(context) * 0.95,
                                      decoration: BoxDecoration(
                                        color: state.color.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(
                                          20.0,
                                        ),
                                        border: Border.all(
                                          color: state.color,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Flex(
                                        direction: Axis.horizontal,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flex(
                                            direction: Axis.horizontal,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${AppLocalization.of(context)!.getTranslatedValue('soundCall')}",
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.black,
                                                  fontFamily:
                                                      CacheHelper.getData(
                                                                key:
                                                                    'languageCode',
                                                              ) ==
                                                              'en'
                                                          ? poppinsMedium
                                                          : tajawalMedium,
                                                ),
                                              ),
                                              const SizedBox(width: 6.0),
                                              Text(
                                                "(10\$)",
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.black,
                                                  fontFamily: poppinsMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 45.0,
                                            child: MaterialButton(
                                              onPressed: () {
                                                push(
                                                  context: context,
                                                  page: const VoiceCall(),
                                                );
                                              },
                                              elevation: 0.0,
                                              hoverElevation: 0.0,
                                              highlightElevation: 0.0,
                                              color: state.color,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              child: Text(
                                                "${AppLocalization.of(context)!.getTranslatedValue('showDetails')}",
                                                style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              // Doctor Info ....
                              Text(
                                "${AppLocalization.of(context)!.getTranslatedValue('dr_info')}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontFamily:
                                      CacheHelper.getData(
                                                key: 'languageCode',
                                              ) ==
                                              'en'
                                          ? poppinsMedium
                                          : tajawalMedium,
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: state.color.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${AppLocalization.of(context)!.getTranslatedValue('name')} :",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
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
                                    const SizedBox(width: 16.0),
                                    Text(
                                      widget.name.substring(3),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${AppLocalization.of(context)!.getTranslatedValue('dr_specialty')} :",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
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
                                    const SizedBox(width: 16.0),
                                    Flexible(
                                      child: Text(
                                        widget.specialty,
                                        maxLines: 2,
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(fontSize: 20.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: state.color.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${AppLocalization.of(context)!.getTranslatedValue('phone')} :",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
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
                                    const SizedBox(width: 16.0),
                                    Text(
                                      widget.phone,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:
                                            CacheHelper.getData(
                                                      key: 'languageCode',
                                                    ) ==
                                                    'en'
                                                ? 19.0
                                                : 17.0,
                                        fontFamily: poppinsRegular,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${AppLocalization.of(context)!.getTranslatedValue('address')} :",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
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
                                    const SizedBox(width: 16.0),
                                    Text(
                                      widget.location,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width:
                                isLongPressed
                                    ? fullWidth(context) - 100.0
                                    : fullWidth(context),
                            height: isLongPressed ? 50.0 : 60.0,
                            child: CustomButton(
                              onHighlightChanged: (isHighlighted) {
                                setState(() {
                                  isLongPressed = isHighlighted;
                                });
                              },
                              height: isLongPressed ? 50.0 : 60.0,
                              width:
                                  isLongPressed
                                      ? fullWidth(context) - 100.0
                                      : fullWidth(context),
                              primaryColor: state.color,
                              context: context,
                              onPressed: () {
                                push(context: context, page: BookingPage());
                              },
                              bgColor: state.color,
                              translateKey: 'bookNow',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      ),
    );
  }
}
