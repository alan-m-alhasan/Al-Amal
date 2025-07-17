import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/patient_card.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/dr_patients.dart';
import 'package:alamal/model/lang_bloc.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/view/pages/doctor/patient_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';

class Patients extends StatefulWidget {
  const Patients({super.key});

  @override
  State<Patients> createState() {
    return _PatientsState();
  }
}

class _PatientsState extends State<Patients> {
  String? langCode;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        delegate: PatientsSearchDelegate(
                          patients:
                              langCode == 'en'
                                  ? patientData['en']!
                                  : patientData['ar']!,
                          themeColor: state.color,
                          langCode: langCode,
                        ),
                      );
                    },
                    color: Colors.white,
                    icon: SvgPicture.asset(
                      drSearch,
                      colorFilter: ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
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
                  "${AppLocalization.of(context)!.getTranslatedValue('patients')}",
                  overflow: TextOverflow.visible,
                  softWrap: true,
                  maxLines: 2,
                  style: const TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              body:
                  isLoading == true
                      ? Center(
                        child: CircularProgressIndicator(color: state.color),
                      )
                      : NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll) {
                          overscroll.disallowIndicator();
                          return true;
                        },
                        child: ListView.separated(
                          itemCount: patientData['en']!.length,
                          padding: EdgeInsets.all(12.0),
                          separatorBuilder:
                              (context, index) => SizedBox(height: 10.0),
                          itemBuilder: (context, index) {
                            final patient =
                                langCode == 'en'
                                    ? patientData['en']![index]
                                    : patientData['ar']![index];
                            return PatientCard(
                              context: context,
                              onTap: () {
                                push(
                                  context: context,
                                  page: PatientScreen(patient: patient),
                                );
                              },
                              langCode: langCode.toString(),
                              name: patient.name,
                              age: patient.age.toString(),
                              condition: patient.condition,
                              diseaseName: patient.diseaseName,
                              patientId: patient.patientId,
                              patientGender: patient.gender,
                              cardColor: state.color.withOpacity(.15),
                              borderColor: state.color,
                            );
                          },
                        ),
                      ),
            );
          },
        );
      },
    );
  }
}

class PatientsSearchDelegate extends SearchDelegate {
  final List<Patient> patients;
  final Color themeColor;
  final String? langCode;

  PatientsSearchDelegate({
    required this.patients,
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
        patients.where((patient) {
          return patient.name.toLowerCase().contains(query.toLowerCase());
          // ||
          // patient.specialty.toLowerCase().contains(query.toLowerCase()) ||
          // patient.location.toLowerCase().contains(query.toLowerCase());
        }).toList();

    return buildPatientsList(filteredList, context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredList =
        patients.where((patient) {
          return patient.name.toLowerCase().contains(query.toLowerCase());
          // ||
          // patient.specialty.toLowerCase().contains(query.toLowerCase()) ||
          // patient.location.toLowerCase().contains(query.toLowerCase());
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
                "${AppLocalization.of(context)!.getTranslatedValue('noPatientsFound')}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, color: Colors.grey[600]),
              ),
            ],
          ),
        )
        : buildPatientsList(filteredList, context);
  }

  Widget buildPatientsList(List<Patient> patients, BuildContext context) {
    return patients.isEmpty
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
                "${AppLocalization.of(context)!.getTranslatedValue('noPatientsFound')}",
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
            itemCount: patients.length,
            itemBuilder: (context, index) {
              final patient = patients[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: themeColor,
                  child:
                      patient.gender == 'male'
                          ? ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: SvgPicture.asset(patientMale),
                          )
                          : ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: SvgPicture.asset(patientFemale),
                          ),
                ),
                title: Text(patient.name),
                subtitle: Text(patient.condition),
                onTap: () {
                  push(context: context, page: PatientScreen(patient: patient));
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
