import 'package:alamal/controller/constant.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/diseases_stats.dart';
import 'package:alamal/model/lang_bloc.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiseaseStatsScreen extends StatefulWidget {
  const DiseaseStatsScreen({super.key});

  @override
  State<DiseaseStatsScreen> createState() {
    return _DiseaseStatsScreenState();
  }
}

class _DiseaseStatsScreenState extends State<DiseaseStatsScreen> {
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
        final padding =
            CacheHelper.getData(key: 'languageCode') == 'en'
                ? EdgeInsetsDirectional.only(end: 16.0, start: 8.0)
                : EdgeInsetsDirectional.only(end: 8.0, start: 16.0);
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return Scaffold(
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
                  "${AppLocalization.of(context)!.getTranslatedValue('diseasesStats')}",
                  overflow: TextOverflow.visible,
                  softWrap: true,
                  maxLines: 2,
                  style: const TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              body:
                  isLoading
                      ? Center(
                        child: CircularProgressIndicator(color: state.color),
                      )
                      : NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll) {
                          overscroll.disallowIndicator();
                          return true;
                        },
                        child: SingleChildScrollView(
                          child: Flex(
                            direction: Axis.vertical,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.0),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: Text(
                                  "${AppLocalization.of(context)!.getTranslatedValue('prevalencePercent')} :",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
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
                              Padding(
                                padding: padding,
                                child: RotatedBox(
                                  quarterTurns: 0,
                                  child: DiseaseBarChart(
                                    ChartType.prevalencePercent,
                                    state.color,
                                  ),
                                ),
                              ),
                              SizedBox(height: 40.0),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14.0,
                                ),
                                child: Text(
                                  "${AppLocalization.of(context)!.getTranslatedValue('annualIncidencePercent')} :",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
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
                              Padding(
                                padding: padding,
                                child: DiseaseBarChart(
                                  ChartType.annualIncidence,
                                  state.color,
                                ),
                              ),
                              SizedBox(height: 40.0),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: Text(
                                  "${AppLocalization.of(context)!.getTranslatedValue('affectedPopulationPercent')} :",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
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
                              Padding(
                                padding: padding,
                                child: DiseaseBarChart(
                                  ChartType.affectedPopulation,
                                  state.color,
                                ),
                              ),
                              SizedBox(height: 30.0),
                            ],
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

enum ChartType { prevalencePercent, annualIncidence, affectedPopulation }

class DiseaseBarChart extends StatefulWidget {
  final ChartType chartType;
  final Color columnColor;

  const DiseaseBarChart(this.chartType, this.columnColor, {super.key});

  @override
  State<DiseaseBarChart> createState() => _DiseaseBarChartState();
}

class _DiseaseBarChartState extends State<DiseaseBarChart> {
  int? touchedIndex;

  List<DiseaseStates> data =
      CacheHelper.getData(key: 'languageCode') == 'en'
          ? diseaseStates['en']!
          : diseaseStates['ar']!;

  List<BarChartGroupData> showingBars(ChartType type) {
    final filtered =
        data.where((d) {
          switch (type) {
            case ChartType.prevalencePercent:
              return d.prevalencePercent != null && d.prevalencePercent! > 0;
            case ChartType.annualIncidence:
              return d.annualIncidence != null && d.annualIncidence! > 0;
            case ChartType.affectedPopulation:
              return d.affectedPopulation != null && d.affectedPopulation! > 0;
          }
        }).toList();

    final colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.brown,
      Colors.cyan,
      Colors.yellow,
    ];

    return List.generate(filtered.length, (i) {
      double value;

      switch (type) {
        case ChartType.prevalencePercent:
          value = filtered[i].prevalencePercent!;
          break;
        case ChartType.annualIncidence:
          value = filtered[i].annualIncidence!.toDouble();
          break;
        case ChartType.affectedPopulation:
          value = filtered[i].affectedPopulation!.toDouble();
          break;
      }

      double fromY() {
        switch (type) {
          case ChartType.prevalencePercent:
            return -5.0; // -5.0
          case ChartType.annualIncidence:
            return -2000000.0;
          case ChartType.affectedPopulation:
            return -500000000.0;
        }
      }

      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: value,
            // color: colors[i % colors.length],
            color: widget.columnColor,
            width: touchedIndex == i ? 35 : 30,
            fromY: fromY(),
            borderRadius: BorderRadius.circular(4),
            backDrawRodData: BackgroundBarChartRodData(show: true),
          ),
        ],
        showingTooltipIndicators: touchedIndex == i ? [0] : [],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final barGroups = showingBars(widget.chartType);

    return SizedBox(
      height: barGroups.length * 50,
      child: BarChart(
        BarChartData(
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              fitInsideHorizontally: true,
              fitInsideVertically: true,
              getTooltipColor: (group) => Colors.grey.shade700,
              tooltipHorizontalOffset: -40.0,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final diseaseName = data[group.x.toInt()].name;
                String formatNumberWithSuffix(double number) {
                  if (number >= 1e9) {
                    return '${(number / 1e9).toStringAsFixed(1)}B';
                  } else if (number >= 1e6) {
                    return '${(number / 1e6).toStringAsFixed(1)}M';
                  } else if (number >= 1e3) {
                    return '${(number / 1e3).toStringAsFixed(1)}K';
                  } else {
                    return number.toStringAsFixed(0);
                  }
                }

                return BarTooltipItem(
                  widget.chartType != ChartType.prevalencePercent
                      ? '$diseaseName\n${formatNumberWithSuffix(rod.toY)}'
                      : '$diseaseName\n${rod.toY.toStringAsFixed(2)}',
                  TextStyle(color: Colors.white),
                );
              },
            ),
            touchCallback: (event, response) {
              setState(() {
                if (event.isInterestedForInteractions &&
                    response != null &&
                    response.spot != null) {
                  touchedIndex = response.spot!.touchedBarGroupIndex;
                } else {
                  touchedIndex = null;
                }
              });
            },
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                reservedSize: 52,
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= data.length) {
                    return SizedBox.shrink();
                  }
                  final name = data[index].name;
                  return SideTitleWidget(
                    meta: meta,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 9.0,
                        fontFamily:
                            CacheHelper.getData(key: 'languageCode') == 'en'
                                ? poppinsMedium
                                : tajawalMedium,
                      ),
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                maxIncluded: false,
                minIncluded: false,
                getTitlesWidget: (value, meta) {
                  return SideTitleWidget(
                    meta: meta,
                    space: 0.0,
                    child: Text(
                      meta.formattedValue,
                      style: TextStyle(fontFamily: poppinsMedium),
                    ),
                  );
                },
                showTitles: true,
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                maxIncluded: false,
                minIncluded: false,
                getTitlesWidget: (value, meta) {
                  return SideTitleWidget(
                    meta: meta,
                    space: 0.0,
                    child: Text(
                      meta.formattedValue,
                      style: TextStyle(fontFamily: poppinsMedium),
                    ),
                  );
                },
                showTitles: true,
              ),
            ),
          ),
          gridData: FlGridData(show: true),
          borderData: FlBorderData(show: false),
          rotationQuarterTurns: 1,
          barGroups: barGroups,
          alignment: BarChartAlignment.spaceAround,
          maxY: _getMaxY(widget.chartType) * 1.2,
        ),
      ),
    );
  }

  double _getMaxY(ChartType type) {
    final values = data.map((d) {
      switch (type) {
        case ChartType.prevalencePercent:
          return d.prevalencePercent ?? 0;
        case ChartType.annualIncidence:
          return d.annualIncidence?.toDouble() ?? 0;
        case ChartType.affectedPopulation:
          return d.affectedPopulation?.toDouble() ?? 0;
      }
    });
    return values.fold(0, (prev, el) => el > prev ? el : prev);
  }
}
