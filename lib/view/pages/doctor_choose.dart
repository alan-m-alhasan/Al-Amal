import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/custom_button.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/cubit.dart';
import 'package:alamal/model/dr_disease.dart';
import 'package:alamal/model/lang_bloc.dart';
import 'package:alamal/model/states.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/view/pages/doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';

class DoctorChoose extends StatefulWidget {
  final List<Doctor> doctors;
  final String diseaseName;

  const DoctorChoose({
    super.key,
    required this.doctors,
    required this.diseaseName,
  });

  @override
  State<DoctorChoose> createState() {
    return _DoctorChooseState();
  }
}

class _DoctorChooseState extends State<DoctorChoose> {
  bool isLoading = true;
  bool isLongPressed = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  String? langCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrAccountsCubit(),
      child: BlocConsumer<DrAccountsCubit, DrAccountsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              langCode = state.locale.languageCode;
              return BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: state.color,
                      actionsPadding: EdgeInsets.symmetric(horizontal: 26.0),
                      actions: [
                        IconButton(
                          tooltip:
                              AppLocalization.of(
                                context,
                              )?.getTranslatedValue('search').toString(),
                          onPressed: () {
                            showSearch(
                              context: context,
                              delegate: DoctorSearchDelegate(
                                doctors: widget.doctors,
                                themeColor: state.color,
                                langCode: langCode,
                              ),
                            );
                          },
                          color: Colors.white,
                          icon: SvgPicture.asset(
                            drSearch,
                            color: Colors.white,
                            height: 26.0,
                          ),
                        ),
                      ],
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
                        "${AppLocalization.of(context)!.getTranslatedValue('doctors')}",
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    body:
                        isLoading == true
                            ? Center(
                              child: CircularProgressIndicator(
                                color: state.color,
                              ),
                            )
                            : RefreshIndicator(
                              onRefresh: () async {
                                await Future.delayed(
                                  const Duration(milliseconds: 500),
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
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Flex(
                                  direction: Axis.vertical,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: Text(
                                        "${AppLocalization.of(context)!.getTranslatedValue('chooseDoctor')}",
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
                                    const SizedBox(height: 20.0),
                                    NotificationListener<
                                      OverscrollIndicatorNotification
                                    >(
                                      onNotification: (overscroll) {
                                        overscroll.disallowIndicator();
                                        return true;
                                      },
                                      child: Expanded(
                                        child: GridView.builder(
                                          itemCount: widget.doctors.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10,
                                              ),
                                          itemBuilder: (context, i) {
                                            final doctor = widget.doctors[i];
                                            return CustomButton(
                                              padding: const EdgeInsets.all(
                                                12.0,
                                              ),
                                              primaryColor: state.color
                                                  .withOpacity(0.1),
                                              bgColor: state.color.withOpacity(
                                                0.1,
                                              ),
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
                                                        location:
                                                            doctor.location,
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  CircleAvatar(
                                                    minRadius: 30.0,
                                                    maxRadius: 50.0,
                                                    backgroundColor:
                                                        state.color,
                                                    child:
                                                        doctor.gender == 'male'
                                                            ? SvgPicture.asset(
                                                              doctorMale,
                                                            )
                                                            : SvgPicture.asset(
                                                              doctorFemale,
                                                            ),
                                                  ),
                                                  Text(
                                                    doctor.name,
                                                    overflow:
                                                        TextOverflow.visible,
                                                    softWrap: true,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          CacheHelper.getData(
                                                                    key:
                                                                        'languageCode',
                                                                  ) ==
                                                                  'en'
                                                              ? poppinsMedium
                                                              : tajawalMedium,
                                                      fontSize:
                                                          CacheHelper.getData(
                                                                    key:
                                                                        'languageCode',
                                                                  ) ==
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class DoctorSearchDelegate extends SearchDelegate {
  final List<Doctor> doctors;
  final Color themeColor;
  final String? langCode;

  DoctorSearchDelegate({
    required this.doctors,
    required this.themeColor,
    required this.langCode,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: IconButton(
          icon: const Icon(HugeIcons.strokeRoundedCancel01),
          onPressed: () {
            query = '';
          },
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: CustomBackButton(langCode.toString(), context),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredList =
        doctors.where((doctor) {
          return doctor.name.toLowerCase().contains(query.toLowerCase()) ||
              doctor.specialty.toLowerCase().contains(query.toLowerCase()) ||
              doctor.location.toLowerCase().contains(query.toLowerCase());
        }).toList();

    return buildDoctorsList(filteredList, context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredList =
        doctors.where((doctor) {
          return doctor.name.toLowerCase().contains(query.toLowerCase());
          // ||
          // doctor.specialty.toLowerCase().contains(query.toLowerCase()) ||
          // doctor.location.toLowerCase().contains(query.toLowerCase());
        }).toList();

    return filteredList.isEmpty
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                HugeIcons.strokeRoundedSearchRemove,
                size: 60,
                color: Colors.grey[400],
              ),
              const SizedBox(height: 20),
              Text(
                "${AppLocalization.of(context)!.getTranslatedValue('noDrFound')}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, color: Colors.grey[600]),
              ),
            ],
          ),
        )
        : buildDoctorsList(filteredList, context);
  }

  Widget buildDoctorsList(List<Doctor> doctors, BuildContext context) {
    return doctors.isEmpty
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                HugeIcons.strokeRoundedSearchRemove,
                size: 60,
                color: Colors.grey[400],
              ),
              const SizedBox(height: 20),
              Text(
                "${AppLocalization.of(context)!.getTranslatedValue('noDrFound')}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, color: Colors.grey[600]),
              ),
            ],
          ),
        )
        : NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: themeColor,
                  child:
                      doctor.gender == 'male'
                          ? SvgPicture.asset(doctorMale)
                          : SvgPicture.asset(doctorFemale),
                ),
                title: Text(doctor.name),
                subtitle: Text(doctor.specialty),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => DoctorScreen(
                            name: doctor.name,
                            gender: doctor.gender,
                            location: doctor.location,
                            phone: doctor.phone,
                            specialty: doctor.specialty,
                          ),
                    ),
                  );
                },
              );
            },
          ),
        );
  }

  @override
  ShapeBorder? get shape => const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(40.0),
      bottomRight: Radius.circular(40.0),
    ),
  );

  @override
  double get cursorWidth => 1.5;

  @override
  double? get cursorHeight => 20.0;

  @override
  Color? get cursorColor => Colors.white;

  @override
  double? get toolbarHeight => 75.0;

  @override
  double? get elevation => 0.0;

  @override
  double? get leadingWidth => 65.0;

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: themeColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: Colors.white70),
        border: InputBorder.none,
      ),
      textTheme: theme.textTheme.copyWith(
        titleLarge: const TextStyle(color: Colors.white, fontSize: 18.0),
      ),
    );
  }
}
