// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print, unused_import, prefer_typing_uninitialized_variables, deprecated_member_use

import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/custom_button.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/cubit.dart';
import 'package:alamal/model/dr_patients.dart';
import 'package:alamal/model/states.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/view/pages/book_date.dart';
import 'package:alamal/view/pages/consultation.dart';
import 'package:alamal/view/pages/doctor/patient_history_screen.dart';
import 'package:alamal/view/pages/drawer.dart';
import 'package:alamal/view/pages/voiceCall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PatientScreen extends StatefulWidget {
  final Patient patient;

  const PatientScreen({super.key, required this.patient});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
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
                    body: NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowIndicator();
                        return true;
                      },
                      child: SingleChildScrollView(
                        child: Flex(
                          direction: Axis.vertical,
                          spacing: 20.0,
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
                                              widget.patient.gender == 'male'
                                                  ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          50.0,
                                                        ),
                                                    child: SvgPicture.asset(
                                                      patientMale,
                                                    ),
                                                  )
                                                  : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          50.0,
                                                        ),
                                                    child: SvgPicture.asset(
                                                      patientFemale,
                                                    ),
                                                  ),
                                        ),
                                      ),
                                      const SizedBox(width: 16.0),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            widget.patient.name,
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
                                          Text(
                                            "${AppLocalization.of(context)?.getTranslatedValue('patient')}",
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              child: Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Text(
                                      "${AppLocalization.of(context)!.getTranslatedValue('patient_info')}",
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6.0,
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        push(
                                          context: context,
                                          page: PatientHistoryScreen(
                                            history: widget.patient.history,
                                          ),
                                        );
                                      },
                                      style: ButtonStyle(
                                        overlayColor: WidgetStateProperty.all(
                                          state.color.withOpacity(.2),
                                        ),
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10.0,
                                            ),
                                            side: BorderSide(
                                              color: state.color,
                                              width: 1.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "${AppLocalization.of(context)!.getTranslatedValue('history')}",
                                        style: TextStyle(
                                          color: state.color,
                                          fontFamily:
                                              CacheHelper.getData(
                                                        key: 'languageCode',
                                                      ) ==
                                                      'en'
                                                  ? poppinsMedium
                                                  : tajawalMedium,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              itemCount: patientListViewHeader.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final data =
                                    patientListViewData(widget.patient)[index];
                                return Container(
                                  padding: const EdgeInsets.all(12.0),
                                  decoration:
                                      index.isEven
                                          ? BoxDecoration(
                                            color: state.color.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                              8.0,
                                            ),
                                          )
                                          : null,
                                  child: Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${AppLocalization.of(context)!.getTranslatedValue(patientListViewHeader[index])}",
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
                                      if (patientListViewHeader[index] ==
                                          'aboutDisease')
                                        Spacer(),
                                      if (patientListViewHeader[index] ==
                                          'notes')
                                        Spacer(),
                                      dataListItemHandler(
                                        patientListViewHeader[index],
                                        data,
                                        widget.patient,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            const SizedBox(),
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

  Widget dataListItemHandler(patientListViewHeader, data, Patient patient) {
    switch (patientListViewHeader) {
      case 'symptoms':
        final symptoms = patientListViewData(widget.patient)[8];
        return symptoms.isEmpty
            ? Text(
              "${AppLocalization.of(context)!.getTranslatedValue('nothing')}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18.0),
            )
            : Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < symptoms.length; i++)
                  Text(
                    "- ${symptoms[i]}",
                    style: const TextStyle(fontSize: 15.0),
                  ),
              ],
            );
      case 'medicines':
        final medicines = patientListViewData(widget.patient)[9];
        return medicines.isEmpty
            ? Text(
              "${AppLocalization.of(context)!.getTranslatedValue('nothing')}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18.0),
            )
            : Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < medicines.length; i++)
                  Text(
                    "- ${medicines[i]}",
                    style: const TextStyle(fontSize: 15.0),
                  ),
              ],
            );
      case 'allergies':
        final allergies = patientListViewData(widget.patient)[11];
        return allergies.isEmpty
            ? Text(
              "${AppLocalization.of(context)!.getTranslatedValue('nothing')}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18.0),
            )
            : Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < allergies.length; i++)
                  Text(
                    "- ${allergies[i]}",
                    style: const TextStyle(fontSize: 15.0),
                  ),
              ],
            );
      case 'otherDiseases':
        final otherDiseases = patientListViewData(widget.patient)[12];
        return otherDiseases.isEmpty
            ? Text(
              "${AppLocalization.of(context)!.getTranslatedValue('nothing')}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18.0),
            )
            : Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < otherDiseases.length; i++)
                  Text(
                    "- ${otherDiseases[i]}",
                    style: const TextStyle(fontSize: 15.0),
                  ),
              ],
            );
      case 'surgeries':
        final surgeries = patientListViewData(widget.patient)[13];
        return surgeries.isEmpty
            ? Text(
              "${AppLocalization.of(context)!.getTranslatedValue('nothing')}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18.0),
            )
            : Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < surgeries.length; i++)
                  Text(
                    "- ${surgeries[i]}",
                    style: const TextStyle(fontSize: 15.0),
                  ),
              ],
            );
      case 'aboutDisease':
        return Flexible(
          child: Text(
            "$data",
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 15.0),
          ),
        );
      case 'notes':
        return Flexible(
          child: Text(
            "$data",
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 15.0),
          ),
        );
      case 'lastCommunication':
        final pmAm = patient.lastCommunication.hour > 12 ? "PM" : "AM";
        final zeroOfMin = patient.lastCommunication.minute < 10 ? "0" : "";
        final lastCommunication =
            "${patient.lastCommunication.year}-${patient.lastCommunication.month}-${patient.lastCommunication.day}\n${patient.lastCommunication.hour}:${patient.lastCommunication.minute}$zeroOfMin $pmAm";

        return Flexible(
          child: Text(
            lastCommunication,
            softWrap: true,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 15.0, fontFamily: poppinsRegular),
          ),
        );
      case 'nextAppointment':
        final pmAm = patient.nextAppointment!.hour > 12 ? "PM" : "AM";
        final zeroOfMin = patient.nextAppointment!.minute < 10 ? "0" : "";
        final nextAppointment =
            "${patient.nextAppointment?.year}-${patient.nextAppointment?.month}-${patient.nextAppointment?.day}\n${patient.nextAppointment?.hour}:${patient.nextAppointment?.minute}$zeroOfMin $pmAm";

        return Flexible(
          child: Text(
            nextAppointment,
            softWrap: true,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 15.0, fontFamily: poppinsRegular),
          ),
        );
      case 'gender':
        return Text(
          patient.gender == 'male'
              ? "${AppLocalization.of(context)!.getTranslatedValue('male')}"
              : "${AppLocalization.of(context)!.getTranslatedValue('female')}",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0),
        );
      case 'smoker':
        return Text(
          patient.smoker
              ? "${AppLocalization.of(context)!.getTranslatedValue('yes')}"
              : "${AppLocalization.of(context)!.getTranslatedValue('no')}",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0),
        );
      case 'alcoholUse':
        return Text(
          patient.alcoholUse
              ? "${AppLocalization.of(context)!.getTranslatedValue('yes')}"
              : "${AppLocalization.of(context)!.getTranslatedValue('no')}",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0),
        );
      default:
        return Text(
          "$data",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize:
                CacheHelper.getData(key: 'languageCode') == 'ar' &&
                        (patientListViewHeader == 'phone' ||
                            patientListViewHeader == 'age' ||
                            patientListViewHeader == 'height' ||
                            patientListViewHeader == 'weight')
                    ? 17.0
                    : 18.0,
            fontFamily:
                patientListViewHeader == 'phone' ||
                        patientListViewHeader == 'age' ||
                        patientListViewHeader == 'heightCm' ||
                        patientListViewHeader == 'weightKg' ||
                        patientListViewHeader == 'bloodType'
                    ? poppinsRegular
                    : null,
          ),
        );
    }
  }
}
