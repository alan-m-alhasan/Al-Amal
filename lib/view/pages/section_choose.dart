// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:alamal/controller/alamal_icons.dart';
import 'package:alamal/controller/constant.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/cubit.dart';
import 'package:alamal/model/dr_disease.dart';
import 'package:alamal/model/educate_data.dart';
import 'package:alamal/model/getDoctors.dart';
import 'package:alamal/model/states.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/model/zoom_drawer_bloc.dart';
import 'package:alamal/view/pages/doctor_choose.dart';
import 'package:alamal/view/pages/educate_article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sections extends StatefulWidget {
  const Sections({Key? key}) : super(key: key);

  @override
  _SectionsState createState() => _SectionsState();
}

class _SectionsState extends State<Sections> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<DrAccounts>? drAccounts;
  bool isLoading = true;
  bool isEmpty = false;
  String? language;

  String changeSectionsLang() {
    if (CacheHelper.getData(key: 'languageCode') == 'en') {
      return language = 'en';
    }
    return language = 'ar';
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
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
        builder: (context, state) =>
            BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                backgroundColor: state.color,
                actions: [
                  SvgPicture.asset(
                    alamal,
                    color: Colors.white,
                    width: 130.0,
                  ),
                  const SizedBox(
                    width: 24.0,
                  ),
                ],
                elevation: 0.0,
                leading: IconButton(
                  onPressed: () {
                    context.read<DrawerCubit>().toggleDrawer();
                  },
                  icon: const Icon(
                    AmalIcons.menu,
                    color: Colors.white,
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
                leadingWidth: 75.0,
              ),
              body: isEmpty == true
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
                  : isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: state.color,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: NotificationListener<
                              OverscrollIndicatorNotification>(
                            onNotification: (overscroll) {
                              overscroll.disallowIndicator();
                              return true;
                            },
                            child: ListView(
                              clipBehavior: Clip.none,
                              children: [
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    "${DemoLocalization.of(context)!.getTranslatedValue('chooseSection')}",
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontFamily: CacheHelper.getData(
                                                    key: 'languageCode') ==
                                                'en'
                                            ? poppinsMedium
                                            : tajawalMedium),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: CacheHelper.getData(
                                              key: 'languageCode') ==
                                          'en'
                                      ? medicalDataEnglish.keys.length
                                      : medicalDataArabic.keys.length,
                                  itemBuilder: (context, index) {
                                    String section = CacheHelper.getData(
                                                key: 'languageCode') ==
                                            'en'
                                        ? medicalDataEnglish.keys
                                            .elementAt(index)
                                        : medicalDataArabic.keys
                                            .elementAt(index);
                                    List<Disease> diseases =
                                        CacheHelper.getData(
                                                    key: 'languageCode') ==
                                                'en'
                                            ? medicalDataEnglish[section]!
                                            : medicalDataArabic[section]!;

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 4.0,
                                      ),
                                      child: ExpansionTile(
                                        key: ValueKey(state.color),
                                        tilePadding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        title: Text(
                                          section,
                                          style: TextStyle(
                                            fontFamily: CacheHelper.getData(
                                                        key: 'languageCode') ==
                                                    'en'
                                                ? poppinsMedium
                                                : tajawalMedium,
                                          ),
                                        ),
                                        textColor: state.color,
                                        iconColor: state.color,
                                        backgroundColor:
                                            state.color.withOpacity(0.1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                          side: BorderSide(
                                            color: state.color,
                                            width: 1.5,
                                          ),
                                        ),
                                        leading: Icon(
                                          AmalIcons.virus,
                                          color: state.color,
                                        ),
                                        children: diseases
                                            .map((disease) => ListTile(
                                                  title: Text(disease.name),
                                                  leading: const Icon(
                                                    AmalIcons.virus2,
                                                  ),
                                                  onTap: () {
                                                    push(
                                                      context: context,
                                                      page: DoctorsScreen(
                                                        doctors:
                                                            disease.doctors,
                                                        diseaseName:
                                                            disease.name,
                                                      ),
                                                    );
                                                  },
                                                ))
                                            .toList(),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Flex(
                                  direction: Axis.vertical,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${DemoLocalization.of(context)!.getTranslatedValue('educateSelf')}",
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          fontFamily: CacheHelper.getData(
                                                      key: 'languageCode') ==
                                                  'en'
                                              ? poppinsMedium
                                              : tajawalMedium),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    GridView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: CacheHelper.getData(
                                                    key: 'languageCode') ==
                                                'en'
                                            ? educateYourselfTopicsEnglish
                                                .length
                                            : educateYourselfTopicsArabic
                                                .length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 20.0,
                                          mainAxisSpacing: 20.0,
                                          childAspectRatio: 0.9,
                                        ),
                                        itemBuilder: (context, index) =>
                                            MaterialButton(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              color:
                                                  state.color.withOpacity(0.1),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                side: BorderSide(
                                                  color: state.color,
                                                  width: 1.5,
                                                ),
                                              ),
                                              elevation: 0.0,
                                              highlightElevation: 0.0,
                                              onPressed: () {
                                                push(
                                                  context: context,
                                                  page: EducateArticle(
                                                    title: CacheHelper.getData(
                                                                key:
                                                                    'languageCode') ==
                                                            'en'
                                                        ? educateYourselfTopicsEnglish[
                                                            index]['title']
                                                        : educateYourselfTopicsArabic[
                                                            index]['title'],
                                                    article: CacheHelper.getData(
                                                                key:
                                                                    'languageCode') ==
                                                            'en'
                                                        ? educateYourselfTopicsEnglish[
                                                            index]['article']
                                                        : educateYourselfTopicsArabic[
                                                            index]['article'],
                                                  ),
                                                );
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    logo2,
                                                    color: state.color,
                                                    width: 90.0,
                                                  ),
                                                  Text(
                                                    CacheHelper.getData(
                                                                key:
                                                                    'languageCode') ==
                                                            'en'
                                                        ? educateYourselfTopicsEnglish[
                                                            index]['title']
                                                        : educateYourselfTopicsArabic[
                                                            index]['title'],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontFamily: CacheHelper
                                                                    .getData(
                                                                        key:
                                                                            'languageCode') ==
                                                                'en'
                                                            ? poppinsMedium
                                                            : tajawalMedium),
                                                  ),
                                                ],
                                              ),
                                            )),
                                  ],
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
