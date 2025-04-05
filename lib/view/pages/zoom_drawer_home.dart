import 'package:alamal/controller/constant.dart';
import 'package:alamal/model/lang_bloc.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/model/zoom_drawer_bloc.dart';
import 'package:alamal/view/pages/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, localeState) {
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return BlocBuilder<DrawerCubit, ZoomDrawerController>(
            builder: (context, controller) {
              return SafeArea(
                child: ZoomDrawer(
                  duration: const Duration(milliseconds: 300),
                  mainScreenTapClose: true,
                  controller: controller,
                  menuBackgroundColor: state.color,
                  menuScreen: const DrawerPage(),
                  mainScreen: context.read<DrawerCubit>().togglePages(),
                  showShadow: true,
                  isRtl: localeState.locale.languageCode == 'ar',
                  angle: -3.0,
                  menuScreenWidth: fullWidth(context) * 0.6,
                  shadowLayer2Color: Colors.white.withOpacity(0.5),
                  shadowLayer1Color: Colors.white.withOpacity(0.3),
                  drawerShadowsBackgroundColor: Colors.grey,
                  slideWidth: MediaQuery.of(context).size.width * 0.7,
                ),
              );
            },
          );
        },
      );
    });
  }
}
