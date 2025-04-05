// ignore_for_file: file_names, deprecated_member_use

import 'package:alamal/controller/custom_button.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/view/pages/section_choose.dart';
import 'package:alamal/view/pages/zoom_drawer_home.dart';
import 'package:flutter/material.dart';
import 'package:alamal/controller/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CallThanks extends StatelessWidget {
  const CallThanks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        logo,
                        width: 250.0,
                        color: state.color,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "${DemoLocalization.of(context)!.getTranslatedValue('thanks')}",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontFamily:
                                CacheHelper.getData(key: 'languageCode') == 'en'
                                    ? poppinsMedium
                                    : tajawalMedium),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "${DemoLocalization.of(context)!.getTranslatedValue('successYourReq')}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "${DemoLocalization.of(context)!.getTranslatedValue('weHappy')}",
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButton(
                        primaryColor: state.color,
                        context: context,
                        width: fullWidth(context),
                        onPressed: () {
                          pop(context: context);
                        },
                        translateKey: 'back',
                        titleColor: state.color,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      CustomButton(
                        primaryColor: state.color,
                        context: context,
                        width: fullWidth(context),
                        onPressed: () {
                          pushAndRmvUntil(
                            context: context,
                            page: const MainScreen(),
                          );
                        },
                        bgColor: state.color,
                        translateKey: 'home',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
