import 'package:flutter/material.dart';

import 'presentation/screens/add_task_screen.dart';
import 'presentation/screens/home_screen.dart';

class AppRouter {
  const AppRouter();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AddTaskScreen.routeName:
        return MaterialPageRoute(builder: (_) => const AddTaskScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
