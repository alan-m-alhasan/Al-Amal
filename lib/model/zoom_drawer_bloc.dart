import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/view/pages/doctor/doctor_home.dart';
import 'package:alamal/view/pages/section_choose.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerCubit extends Cubit<ZoomDrawerController> {
  DrawerCubit() : super(ZoomDrawerController());

  Widget togglePages() {
    if (CacheHelper.getData(key: 'accountType') == 'doctor') {
      return const DoctorHome();
    } else {
      return const Sections();
    }
  }

  void toggleDrawer() {
    debugPrint("Toggle Drawer");
    state.toggle?.call();
  }
}
