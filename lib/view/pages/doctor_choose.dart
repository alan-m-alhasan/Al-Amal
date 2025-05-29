// ignore_for_file: library_private_types_in_public_api

import 'package:alamal/controller/alamal_icons.dart';
import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/custom_button.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/cubit.dart';
import 'package:alamal/model/dr_disease.dart';
import 'package:alamal/model/getDoctors.dart';
import 'package:alamal/model/states.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/view/pages/doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorsScreen extends StatefulWidget {
  final List<Doctor> doctors;
  final String diseaseName;

  const DoctorsScreen({
    Key? key,
    required this.doctors,
    required this.diseaseName,
  }) : super(key: key);

  @override
  _DoctorsScreenState createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<DrAccounts>? drAccounts;
  bool isLoading = true;
  bool isEmpty = false;
  bool isLongPressed = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrAccountsCubit(),
      child: BlocConsumer<DrAccountsCubit, DrAccountsStates>(
        listener: (context, state) {},
        builder: (context, state) => BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                key: scaffoldKey,
                appBar: AppBar(
                  backgroundColor: state.color,
                  actions: [
                    IconButton(
                      onPressed: () {},
                      color: Colors.white,
                      iconSize: 22.0,
                      icon: const Icon(AmalIcons.search),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                  ],
                  elevation: 0.0,
                  leading: Directionality(
                    textDirection:
                        CacheHelper.getData(key: 'languageCode') == 'ar'
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
                    widget.diseaseName,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                body: Column(
                  children: [
                    if (isEmpty == false && isLoading == false)
                      const SizedBox(
                        height: 20.0,
                      ),
                    if (isEmpty == false && isLoading == false)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "${DemoLocalization.of(context)!.getTranslatedValue('chooseDoctor')}",
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
                      ),
                    isEmpty == true
                        ? Expanded(
                            child: Center(
                              child: Text(
                                "${DemoLocalization.of(context)!.getTranslatedValue('noDrYet')}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          )
                        : Expanded(
                            child: NotificationListener<
                                OverscrollIndicatorNotification>(
                              onNotification: (overscroll) {
                                overscroll.disallowIndicator();
                                return true;
                              },
                              child: !isLoading
                                  ? RefreshIndicator(
                                      onRefresh: () async {
                                        await Future.delayed(
                                          const Duration(seconds: 2),
                                          () {
                                            setState(() {
                                              isLoading = true;
                                            });
                                          },
                                        ).then((value) {
                                          Future.delayed(
                                            const Duration(seconds: 1),
                                            () {
                                              setState(() {
                                                isLoading = false;
                                              });
                                            },
                                          );
                                        });
                                      },
                                      color: state.color,
                                      child: GridView.builder(
                                        itemCount: widget.doctors.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                        ),
                                        padding: const EdgeInsets.all(16.0),
                                        itemBuilder: (context, i) {
                                          final doctor = widget.doctors[i];
                                          return CustomButton(
                                            padding: const EdgeInsets.all(12.0),
                                            primaryColor:
                                                state.color.withOpacity(0.1),
                                            bgColor:
                                                state.color.withOpacity(0.1),
                                            hasBorder: false,
                                            radius: 20.0,
                                            elevation: 0.0,
                                            highlightElevation: 0.0,
                                            hasChild: true,
                                            context: context,
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return DoctorScreen(
                                                      name: doctor.name,
                                                      gender: doctor.gender,
                                                      location: doctor.location,
                                                      phone: doctor.phone,
                                                      specialty:
                                                          doctor.specialty,
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                CircleAvatar(
                                                  minRadius: 30.0,
                                                  maxRadius: 50.0,
                                                  backgroundColor: state.color,
                                                  child: doctor.gender == 'male'
                                                      ? SvgPicture.asset(
                                                          avatarDrMale,
                                                        )
                                                      : SvgPicture.asset(
                                                          avatarDrFemale,
                                                        ),
                                                ),
                                                Text(
                                                  doctor.name,
                                                  overflow:
                                                      TextOverflow.visible,
                                                  softWrap: true,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: CacheHelper.getData(
                                                                key:
                                                                    'languageCode') ==
                                                            'en'
                                                        ? poppinsMedium
                                                        : tajawalMedium,
                                                    fontSize: CacheHelper.getData(
                                                                key:
                                                                    'languageCode') ==
                                                            'en'
                                                        ? 18.0
                                                        : 20.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                        color: state.color,
                                      ),
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
