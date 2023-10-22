import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/logic/read_category_cubit/read_category_cubit.dart';
import 'package:to_do_app/presentation/size_config/size_config.dart';

import '../../logic/read_task_cubit/read_task_cubit.dart';
import '../../logic/theme_cubit/theme_cubit.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/no_tasks.dart';
import '../widgets/tasks_list.dart';
import 'calendar_tasks_screen.dart';
import 'categories_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int home = 1;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ReadTaskCubit>(context).getAllTasks();
    BlocProvider.of<ReadCategoryCubit>(context).getAllCategories();
  }

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
            icon: _getCorrectIcon(state),
          ),
        ),
        actions: [_getPersonLogo()],
      ),
      body: SafeArea(
        child: home == 0
            ? CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [_buildContent()],
              )
            : home == 1
                ? const CalendarTasksScreen()
                : const CategoriesScreen(),
      ),
      bottomNavigationBar: CustomNavBar(onTap: _changeScreen),
    );
  }

  Widget _buildContent() {
    return BlocBuilder<ReadTaskCubit, ReadTaskState>(builder: (context, state) {
      if (state is ReadTaskLoadingState) {
        return const SliverToBoxAdapter(child: LoadingIndicator());
      }
      if (BlocProvider.of<ReadTaskCubit>(context).tasks.isEmpty) {
        return const SliverToBoxAdapter(child: NoTasks());
      } else {
        return _buildTasks();
      }
    });
  }

  Widget _buildTasks() {
    return TasksList(
      tasks: BlocProvider.of<ReadTaskCubit>(context).tasks,
    );
  }

  Widget _getPersonLogo() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Image.asset(
        'assets/images/man.png',
        width: SizeConfig.getProportionateScreenWidth(35),
      ),
    );
  }

  Widget _getCorrectIcon(state) {
    if (state == ThemeMode.light) {
      return const Icon(Icons.wb_sunny_outlined);
    }
    return const Icon(Icons.nightlight_round_outlined);
  }

  void _changeScreen(int index) {
    setState(() {
      home = index;
    });
  }
}
