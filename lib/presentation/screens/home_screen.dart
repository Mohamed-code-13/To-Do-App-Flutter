import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/theme_cubit/theme_cubit.dart';
import '../widgets/custom_button.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do App'),
        leading: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (_, state) => IconButton(
            onPressed: () {
              themeCubit.toggleThemeMode();
            },
            icon: state == ThemeMode.light
                ? const Icon(Icons.wb_sunny_outlined)
                : const Icon(Icons.nightlight_round_outlined),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: CustomButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddTaskScreen.routeName);
              },
              title: '+ Add Task'),
        ),
      ),
    );
  }
}
