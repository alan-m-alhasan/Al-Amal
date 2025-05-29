// ignore_for_file: file_names, library_private_types_in_public_api, deprecated_member_use

import 'package:alamal/controller/alamal_icons.dart';
import 'package:alamal/controller/constant.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/model/zoom_drawer_bloc.dart';
import 'package:alamal/view/pages/doctor/doctor_appointments.dart';
import 'package:alamal/view/pages/doctor/doctor_consultations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  _DoctorHomeState createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              toolbarHeight: 75.0,
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
              leading: IconButton(
                onPressed: () {
                  context.read<DrawerCubit>().toggleDrawer();
                },
                icon: const Icon(
                  AmalIcons.menu,
                  color: Colors.white,
                ),
              ),
              bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.white,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "${DemoLocalization.of(context)!.getTranslatedValue('consultations')}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:
                            CacheHelper.getData(key: 'languageCode') == 'en'
                                ? 18.0
                                : 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "${DemoLocalization.of(context)!.getTranslatedValue('appointments')}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:
                            CacheHelper.getData(key: 'languageCode') == 'en'
                                ? 18.0
                                : 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: const TabBarView(
                children: [
                  DoctorConsultations(),
                  DoctorAppointments(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
// signingConfigs {
// debug {
// keyAlias 'alamal'
// keyPassword 'alan9622'
// storeFile file('alamal.jks')
// storePassword 'alan9622'
// }
// }
