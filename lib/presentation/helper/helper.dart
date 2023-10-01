import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/theme_cubit/theme_cubit.dart';

Color getCorrectColor(BuildContext context) {
  return BlocProvider.of<ThemeCubit>(context).themeMode == ThemeMode.light
      ? Theme.of(context).colorScheme.primary
      : Colors.grey;
}
