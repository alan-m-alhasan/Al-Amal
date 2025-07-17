// ignore_for_file: library_private_types_in_public_api

import 'package:alamal/controller/constant.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/diseases_stats.dart';
import 'package:alamal/model/dr_disease.dart';
import 'package:alamal/model/lang_bloc.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/view/pages/doctor_choose.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';

class DiseaseScreen extends StatefulWidget {
  final List<Doctor> doctors;
  final String diseaseName;
  final List<String> symptoms;
  final List<String> medicines;
  final String description;
  final DiseaseStates? diseaseStats;

  const DiseaseScreen({
    super.key,
    required this.doctors,
    required this.diseaseName,
    required this.symptoms,
    required this.medicines,
    required this.description,
    required this.diseaseStats,
  });

  @override
  State<DiseaseScreen> createState() => _DiseaseScreenState();
}

class _DiseaseScreenState extends State<DiseaseScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

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
                key: scaffoldKey,
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
                    widget.diseaseName,
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
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Flex(
                                direction: Axis.vertical,
                                children: [
                                  //
                                  // Disease Doctors
                                  //
                                  Container(
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                      color: state.color.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20.0),
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
                                          spacing: 10.0,
                                          children: [
                                            Text(
                                              "${AppLocalization.of(context)!.getTranslatedValue('availableDr')}",
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
                                                page: DoctorChoose(
                                                  doctors: widget.doctors,
                                                  diseaseName:
                                                      widget.diseaseName,
                                                ),
                                              );
                                            },
                                            elevation: 0.0,
                                            hoverElevation: 0.0,
                                            highlightElevation: 0.0,
                                            color: state.color,
                                            padding: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            child: Icon(
                                              HugeIcons.strokeRoundedDoctor01,
                                              color: Colors.white,
                                              size: 26.0,
                                            ),
                                            // child: Text(
                                            //   "${DemoLocalization.of(context)!.getTranslatedValue('showDetails')}",
                                            //   style: const TextStyle(
                                            //     fontSize: 16.0,
                                            //     color: Colors.white,
                                            //   ),
                                            // ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30.0),
                                  //
                                  // Disease Description
                                  //
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        logo2,
                                        color: state.color,
                                        width: 30.0,
                                      ),
                                      const SizedBox(width: 10.0),
                                      Align(
                                        alignment:
                                            AlignmentDirectional.centerStart,
                                        child: Text(
                                          "${AppLocalization.of(context)!.getTranslatedValue('aboutDisease')}",
                                          style: TextStyle(
                                            fontSize:
                                                CacheHelper.getData(
                                                          key: 'languageCode',
                                                        ) ==
                                                        'en'
                                                    ? 22.0
                                                    : 24.0,
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
                                    ],
                                  ),
                                  SizedBox(height: 14.0),
                                  Text(
                                    widget.description,
                                    style: TextStyle(
                                      fontSize:
                                          CacheHelper.getData(
                                                    key: 'languageCode',
                                                  ) ==
                                                  'en'
                                              ? 16.0
                                              : 18.0,
                                      fontFamily:
                                          CacheHelper.getData(
                                                    key: 'languageCode',
                                                  ) ==
                                                  'en'
                                              ? poppinsMedium
                                              : tajawalMedium,
                                    ),
                                  ),
                                  SizedBox(height: 30.0),
                                  //
                                  // Disease Symptoms
                                  //
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        logo2,
                                        color: state.color,
                                        width: 30.0,
                                      ),
                                      const SizedBox(width: 10.0),
                                      Align(
                                        alignment:
                                            AlignmentDirectional.centerStart,
                                        child: Text(
                                          "${AppLocalization.of(context)!.getTranslatedValue('symptoms')}",
                                          style: TextStyle(
                                            color: state.color,
                                            fontSize:
                                                CacheHelper.getData(
                                                          key: 'languageCode',
                                                        ) ==
                                                        'en'
                                                    ? 22.0
                                                    : 24.0,
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
                                    ],
                                  ),
                                  SizedBox(height: 14.0),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemCount: widget.symptoms.length,
                                    separatorBuilder:
                                        (context, index) =>
                                            SizedBox(height: 10.0),
                                    itemBuilder:
                                        (context, index) => Text(
                                          '${index + 1}. ${widget.symptoms[index]}',
                                          style: TextStyle(
                                            fontSize:
                                                CacheHelper.getData(
                                                          key: 'languageCode',
                                                        ) ==
                                                        'en'
                                                    ? 16.0
                                                    : 18.0,
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
                                  SizedBox(height: 30.0),
                                  //
                                  // Disease Appropriate Medicines
                                  //
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        logo2,
                                        color: state.color,
                                        width: 30.0,
                                      ),
                                      const SizedBox(width: 10.0),
                                      Align(
                                        alignment:
                                            AlignmentDirectional.centerStart,
                                        child: Text(
                                          "${AppLocalization.of(context)!.getTranslatedValue('appropriateMedicines')}",
                                          style: TextStyle(
                                            color: state.color,
                                            fontSize:
                                                CacheHelper.getData(
                                                          key: 'languageCode',
                                                        ) ==
                                                        'en'
                                                    ? 22.0
                                                    : 24.0,
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
                                    ],
                                  ),
                                  SizedBox(height: 14.0),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemCount: widget.medicines.length,
                                    separatorBuilder:
                                        (context, index) =>
                                            SizedBox(height: 10.0),
                                    itemBuilder:
                                        (context, index) => Text(
                                          '${index + 1}. ${widget.medicines[index]}',
                                          style: TextStyle(
                                            fontSize:
                                                CacheHelper.getData(
                                                          key: 'languageCode',
                                                        ) ==
                                                        'en'
                                                    ? 16.0
                                                    : 18.0,
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
                                  SizedBox(height: 30.0),
                                  //
                                  // Disease Statistics
                                  //
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        logo2,
                                        color: state.color,
                                        width: 30.0,
                                      ),
                                      const SizedBox(width: 10.0),
                                      Align(
                                        alignment:
                                            AlignmentDirectional.centerStart,
                                        child: Text(
                                          "${AppLocalization.of(context)!.getTranslatedValue('diseaseStats')}",
                                          style: TextStyle(
                                            color: state.color,
                                            fontSize:
                                                CacheHelper.getData(
                                                          key: 'languageCode',
                                                        ) ==
                                                        'en'
                                                    ? 22.0
                                                    : 24.0,
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
                                    ],
                                  ),
                                  SizedBox(height: 14.0),
                                  Table(
                                    columnWidths: const {
                                      0: IntrinsicColumnWidth(),
                                      1: IntrinsicColumnWidth(),
                                      2: FlexColumnWidth(),
                                    },
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.top,
                                    children: _buildTableRowsWithDividers(state.color, [
                                      {
                                        'label':
                                            "${AppLocalization.of(context)!.getTranslatedValue('prevalence')}",
                                        'value':
                                            widget.diseaseStats!.prevalence,
                                      },
                                      {
                                        'label':
                                            "${AppLocalization.of(context)!.getTranslatedValue('regions')}",
                                        'value': widget.diseaseStats!.regions,
                                      },
                                      {
                                        'label':
                                            "${AppLocalization.of(context)!.getTranslatedValue('causes')}",
                                        'value': widget.diseaseStats!.causes,
                                      },
                                      {
                                        'label':
                                            "${AppLocalization.of(context)!.getTranslatedValue('transmission')}",
                                        'value':
                                            widget.diseaseStats!.transmission,
                                      },
                                    ]),
                                  ),
                                  SizedBox(height: 16.0),
                                  // SizedBox(height: 20),
                                  // Text(
                                  //   "نسبة انتشار الأمراض (%)",
                                  //   style: TextStyle(
                                  //     fontSize: 18,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                  // Container(
                                  //   height: 300,
                                  //   child: DiseaseBarChart(
                                  //     ChartType.prevalencePercent,
                                  //   ),
                                  // ),
                                  //
                                  // SizedBox(height: 20),
                                  // Text(
                                  //   "الإصابات السنوية الجديدة",
                                  //   style: TextStyle(
                                  //     fontSize: 18,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                  // Container(
                                  //   height: 300,
                                  //   child: DiseaseBarChart(
                                  //     ChartType.annualIncidence,
                                  //   ),
                                  // ),
                                  //
                                  // SizedBox(height: 20),
                                  // Text(
                                  //   "عدد الأشخاص المصابين",
                                  //   style: TextStyle(
                                  //     fontSize: 18,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                  // Container(
                                  //   height: 300,
                                  //   child: DiseaseBarChart(
                                  //     ChartType.affectedPopulation,
                                  //   ),
                                  // ),
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

  List<TableRow> _buildTableRowsWithDividers(
    Color dividerColor,
    List<Map<String, String>> items,
  ) {
    final isEnglish = CacheHelper.getData(key: 'languageCode') == 'en';
    final fontSize = isEnglish ? 16.0 : 18.0;
    final fontFamily = isEnglish ? poppinsMedium : tajawalMedium;

    List<TableRow> rows = [];

    for (int i = 0; i < items.length; i++) {
      final label = items[i]['label']!;
      final value = items[i]['value']!;

      rows.add(
        TableRow(
          children: [
            Text(
              label,
              style: TextStyle(fontSize: fontSize, fontFamily: fontFamily),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                ":",
                style: TextStyle(fontSize: fontSize, fontFamily: fontFamily),
              ),
            ),
            Text(
              value,
              style: TextStyle(fontSize: fontSize, fontFamily: fontFamily),
            ),
          ],
        ),
      );

      // Divider row (except after last item)
      if (i != items.length - 1) {
        rows.add(
          TableRow(
            children: [
              for (int i = 0; i < 3; i++)
                Divider(color: dividerColor.withOpacity(.3), height: 26.0),
            ],
          ),
        );
      }
    }

    return rows;
  }
}
