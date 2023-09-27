import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_router.dart';
import '../../logic/theme_cubit/theme_cubit.dart';
import '../themes/custom_theme.dart';
import 'home_screen.dart';

class ToDoApp extends StatelessWidget {
  final AppRouter appRouter = const AppRouter();

  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (ctx, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'To Do App',
          theme: Styles.lightTheme,
          darkTheme: Styles.darkTheme,
          themeMode: state,
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: HomeScreen.routeName,
        );
      },
    );
  }
}
