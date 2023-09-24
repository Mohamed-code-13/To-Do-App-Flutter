import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeMode themeMode = ThemeMode.light;

  ThemeCubit() : super(ThemeMode.light);

  void toggleThemeMode() {
    if (state == ThemeMode.light) {
      themeMode = ThemeMode.dark;
      emit(ThemeMode.dark);
    } else {
      themeMode = ThemeMode.light;
      emit(ThemeMode.light);
    }
  }
}
