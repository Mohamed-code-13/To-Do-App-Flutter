import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/theme_cubit/theme_cubit.dart';
import 'presentation/screens/to_do_app.dart';
import 'presentation/size_config/size_config.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return BlocProvider<ThemeCubit>(
      create: (_) => ThemeCubit(),
      child: const ToDoApp(),
    );
  }
}
