// ignore_for_file: library_private_types_in_public_api, deprecated_member_use, use_build_context_synchronously

import 'package:alamal/controller/alamal_icons.dart';
import 'package:alamal/controller/constant.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/view/auth/login.dart';
import 'package:alamal/view/pages/about.dart';
import 'package:alamal/view/pages/my_consultations.dart';
import 'package:alamal/view/pages/profile.dart';
import 'package:alamal/view/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(color: state.color),
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                SvgPicture.asset(logo, color: Colors.white, width: 175.0),
                const SizedBox(height: 30.0),
                Flex(
                  direction: Axis.vertical,
                  children: [
                    MaterialButton(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      onPressed: () {
                        push(context: context, page: const ProfilePage());
                      },
                      child: ListTile(
                        minLeadingWidth: 30,
                        title: Text(
                          "${AppLocalization.of(context)!.getTranslatedValue('profile')}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        leading: const Icon(
                          AmalIcons.profile,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white54,
                      endIndent: 20.0,
                      indent: 16.0,
                      height: 20.0,
                    ),
                    if (CacheHelper.getData(key: 'accountType') != 'doctor')
                      Column(
                        children: [
                          MaterialButton(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.0,
                            ),
                            onPressed: () {
                              push(
                                context: context,
                                page: const MyConsultations(),
                              );
                            },
                            child: ListTile(
                              minLeadingWidth: 30,
                              title: Text(
                                "${AppLocalization.of(context)!.getTranslatedValue('myConsultation')}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              leading: const Icon(
                                AmalIcons.document,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.white54,
                            endIndent: 20.0,
                            indent: 16.0,
                            height: 20.0,
                          ),
                        ],
                      ),
                    MaterialButton(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      onPressed: () {
                        push(context: context, page: SettingsPage());
                      },
                      child: ListTile(
                        minLeadingWidth: 30,
                        title: Text(
                          "${AppLocalization.of(context)!.getTranslatedValue('settings')}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        leading: const Icon(
                          AmalIcons.settings2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white54,
                      endIndent: 20.0,
                      indent: 16.0,
                      height: 20.0,
                    ),
                    MaterialButton(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      onPressed: () {
                        push(context: context, page: AboutPage());
                      },
                      child: ListTile(
                        minLeadingWidth: 30,
                        title: Text(
                          "${AppLocalization.of(context)!.getTranslatedValue('about')}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        leading: const Icon(
                          AmalIcons.info,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                MaterialButton(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  onPressed: () async {
                    CacheHelper.saveData(key: 'hasLogged', value: false);
                    CacheHelper.removeData(key: 'accountType');
                    CacheHelper.removeData(key: 'email');
                    // final isSignedIn = await GoogleSignInApi.isSignedIn();
                    // print('Signed In : $isSignedIn');
                    // if (isSignedIn) {
                    //   await GoogleSignInApi.logout();
                    // }
                    pushAndRmvUntil(context: context, page: const LoginPage());
                  },
                  child: ListTile(
                    minLeadingWidth: 30,
                    title: Text(
                      "${AppLocalization.of(context)!.getTranslatedValue('logout')}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    leading: AnimatedRotation(
                      duration: Duration.zero,
                      turns:
                          CacheHelper.getData(key: 'languageCode') == 'ar'
                              ? 0.5
                              : 0,
                      child: const Icon(AmalIcons.logout, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
