import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/presentation/size_config/size_config.dart';

import '../../logic/theme_cubit/theme_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/date_timeline_bar.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDateTime = DateTime.now();
  final DateFormat _dateFormat = DateFormat.yMMMMd();

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _addTaskBar(),
              DateTimeLineBar(
                onChanged: (DateTime date) => setState(() {
                  _selectedDateTime = date;
                }),
              ),
              _noTasks(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addTaskBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _getTodayDate(),
          CustomButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddTaskScreen.routeName);
            },
            title: '+ Add Task',
          ),
        ],
      ),
    );
  }

  Widget _noTasks(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/task.png',
          color: Theme.of(context).colorScheme.primary,
          width: SizeConfig.screenWidth / 3,
        ),
        Text(
          'You don\'t have any tasks yet',
          textAlign: TextAlign.center,
          style: GoogleFonts.robotoMono(
            fontSize: SizeConfig.getProportionateScreenWidth(16),
            color: _getColor(),
          ),
        ),
      ],
    );
  }

  Widget _getTodayDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _dateFormat.format(DateTime.now()),
          style: GoogleFonts.robotoMono(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: _getColor(),
          ),
        ),
        Text(
          'Today',
          style: GoogleFonts.robotoMono(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: _getColor(),
          ),
        ),
      ],
    );
  }

  Color _getColor() {
    return BlocProvider.of<ThemeCubit>(context).themeMode == ThemeMode.light
        ? Theme.of(context).colorScheme.primary
        : Colors.grey;
  }
}
