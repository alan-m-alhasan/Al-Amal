import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/blocObserver.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/dioHelper.dart';
import 'package:alamal/model/lang_bloc.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/model/zoom_drawer_bloc.dart';
import 'package:alamal/view/pages/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => DrawerCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: state.fontFamily,
                useMaterial3: false,
              ),
              home: const SplashScreen(),
              locale: state.locale,
              supportedLocales: const [Locale('en'), Locale('ar')],
              localizationsDelegates: const [
                AppLocalization.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                if (CacheHelper.getData(key: 'languageCode') == null) {
                  CacheHelper.saveData(
                    key: 'languageCode',
                    value: deviceLocale?.languageCode,
                  );
                }
                if (CacheHelper.getData(key: 'languageCode') == 'ar') {
                  return supportedLocales.last;
                }

                return supportedLocales.first;
              },
            );
          },
        );
      },
    );
  }
}
