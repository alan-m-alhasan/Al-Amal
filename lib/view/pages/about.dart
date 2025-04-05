// ignore_for_file: file_names, unnecessary_string_interpolations, avoid_unnecessary_containers, use_key_in_widget_constructors, deprecated_member_use

import 'package:alamal/controller/constant.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutPage extends StatefulWidget {
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
              "${DemoLocalization.of(context)!.getTranslatedValue('about')}",
              overflow: TextOverflow.visible,
              softWrap: true,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5.0,
                    ),
                    // About Header And Content
                    Row(
                      children: [
                        SvgPicture.asset(
                          logo2,
                          color: state.color,
                          width: 30.0,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "${DemoLocalization.of(context)?.getTranslatedValue('about_header')}",
                          style: TextStyle(
                            color: state.color,
                            fontSize:
                                CacheHelper.getData(key: 'languageCode') == 'en'
                                    ? 20.0
                                    : 24.0,
                            fontFamily:
                                CacheHelper.getData(key: 'languageCode') == 'en'
                                    ? poppinsMedium
                                    : tajawalMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${DemoLocalization.of(context)?.getTranslatedValue('about_content')}",
                      style: TextStyle(
                        fontSize:
                            CacheHelper.getData(key: 'languageCode') == 'en'
                                ? 17.0
                                : 20.0,
                      ),
                    ),
                    //
                    const SizedBox(
                      height: 30.0,
                    ),
                    // Our Mission Header And Content
                    Row(
                      children: [
                        SvgPicture.asset(
                          logo2,
                          color: state.color,
                          width: 30.0,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "${DemoLocalization.of(context)?.getTranslatedValue('our_mission_header')}",
                          style: TextStyle(
                            color: state.color,
                            fontSize:
                                CacheHelper.getData(key: 'languageCode') == 'en'
                                    ? 20.0
                                    : 24.0,
                            fontFamily:
                                CacheHelper.getData(key: 'languageCode') == 'en'
                                    ? poppinsMedium
                                    : tajawalMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${DemoLocalization.of(context)?.getTranslatedValue('our_mission_content')}",
                      style: TextStyle(
                        fontSize:
                            CacheHelper.getData(key: 'languageCode') == 'en'
                                ? 17.0
                                : 20.0,
                      ),
                    ),
                    //
                    const SizedBox(
                      height: 30.0,
                    ),
                    // Our Vision Header And Content
                    Row(
                      children: [
                        SvgPicture.asset(
                          logo2,
                          color: state.color,
                          width: 30.0,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "${DemoLocalization.of(context)?.getTranslatedValue('our_vision_header')}",
                          style: TextStyle(
                            color: state.color,
                            fontSize:
                                CacheHelper.getData(key: 'languageCode') == 'en'
                                    ? 20.0
                                    : 24.0,
                            fontFamily:
                                CacheHelper.getData(key: 'languageCode') == 'en'
                                    ? poppinsMedium
                                    : tajawalMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${DemoLocalization.of(context)?.getTranslatedValue('our_vision_content')}",
                      style: TextStyle(
                        fontSize:
                            CacheHelper.getData(key: 'languageCode') == 'en'
                                ? 17.0
                                : 20.0,
                      ),
                    ),
                    //
                    const SizedBox(
                      height: 30.0,
                    ),
                    // Why Al-Amal Header And Content
                    Row(
                      children: [
                        SvgPicture.asset(
                          logo2,
                          color: state.color,
                          width: 30.0,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "${DemoLocalization.of(context)?.getTranslatedValue('why_alamal_header')}",
                          style: TextStyle(
                            color: state.color,
                            fontSize:
                                CacheHelper.getData(key: 'languageCode') == 'en'
                                    ? 20.0
                                    : 24.0,
                            fontFamily:
                                CacheHelper.getData(key: 'languageCode') == 'en'
                                    ? poppinsMedium
                                    : tajawalMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${DemoLocalization.of(context)?.getTranslatedValue('why_alamal_content')}",
                      style: TextStyle(
                        fontSize:
                            CacheHelper.getData(key: 'languageCode') == 'en'
                                ? 16.0
                                : 20.0,
                      ),
                    ),
                    //
                    const SizedBox(
                      height: 30.0,
                    ),
                    // About Footer
                    Text(
                      "${DemoLocalization.of(context)?.getTranslatedValue('about_footer')}",
                      style: TextStyle(
                        fontSize:
                            CacheHelper.getData(key: 'languageCode') == 'en'
                                ? 18.0
                                : 22.0,
                      ),
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
