// ignore_for_file: public_member_api_docs, sort_constructors_first, invalid_use_of_visible_for_testing_member, avoid_print
import 'package:alamal/model/cacheHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// // Events
abstract class ThemeEvent {}

class ChangeTheme extends ThemeEvent {
  final int primaryColor;

  ChangeTheme(this.primaryColor);
}

// State
class ThemeState {
  final Color color;

  ThemeState({required this.color});
}

// Bloc
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(color: Colors.green)) {
    _loadLanguage();

    on<ChangeTheme>((event, emit) async {
      Color color = Color(event.primaryColor);

      await CacheHelper.saveData(
        key: 'primaryColor',
        value: event.primaryColor,
      );
      print('Color Palette Selected : $color');

      emit(ThemeState(color: color));
    });
  }

  Future<void> _loadLanguage() async {
    int primaryColor =
        CacheHelper.getData(key: 'primaryColor') ??
        0xFF009688; // Teal is default color
    print('Loaded Color: $primaryColor');
    emit(ThemeState(color: Color(primaryColor)));
  }
}
