// ignore_for_file: file_names, avoid_print, unrelated_type_equality_checks, deprecated_member_use, library_private_types_in_public_api

import 'package:alamal/controller/constant.dart';
import 'package:alamal/db/sql_helper.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/view/auth/login.dart';
import 'package:alamal/view/pages/zoom_drawer_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Widget _widget;
  bool hasLogged = CacheHelper.getData(key: 'hasLogged') ?? false;
  final player = AudioPlayer();

  Future<void> toneHandling() async {
    switch (CacheHelper.getData(key: 'isToneEnabled')) {
      case null:
        await player.setAsset(logoSound);
        await player.play();
        await CacheHelper.saveData(key: 'isToneEnabled', value: true);
        debugPrint('Tone Is Enabled With Null ................');
        break;
      case true:
        await player.setAsset(logoSound);
        await player.play();
        debugPrint('Tone Is Enabled With True ................');
        break;
      case false:
        debugPrint('Tone Is Not Enabled ................');
        break;
      default:
    }
  }

  Future<void> moveWidget() async {
    print(hasLogged);

    if (hasLogged) {
      _widget = const MainScreen();
    } else {
      _widget = const LoginPage();
    }
  }

  DatabaseHelper db = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: context.read<ThemeBloc>().state.color,
      ),
    );
    toneHandling();
    moveWidget();
    Future.delayed(const Duration(milliseconds: 3500), () {
      pushAndRmvUntil(
        context: context,
        page: _widget,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: state.color,
          body: Center(
            child: Transform.scale(
              scale: 3,
              child: Lottie.asset(
                lottieLogo,
                alignment: Alignment.center,
                repeat: false,
              ),
            ),
          ),
        ),
      );
    });
  }
}
// SvgPicture.asset(
// logo,
//   color: Colors.white,
//   width: 300.0,
// ),
