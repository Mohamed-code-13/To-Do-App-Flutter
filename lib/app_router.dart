import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/add_category_cubit/add_category_cubit.dart';
import 'logic/add_task_cubit/add_task_cubit.dart';
import 'presentation/screens/add_category_screen.dart';
import 'presentation/screens/add_task_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/splash_screen.dart';

class AppRouter {
  const AppRouter();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case AddTaskScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AddTaskCubit>(
            create: (_) => AddTaskCubit(),
            child: const AddTaskScreen(),
          ),
        );
      case AddCategoryScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AddCategoryCubit>(
            create: (_) => AddCategoryCubit(),
            child: const AddCategoryScreen(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
