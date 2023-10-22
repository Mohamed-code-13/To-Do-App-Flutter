import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/models/category_model.dart';
import 'package:to_do_app/models/task_model.dart';

import 'logic/read_category_cubit/read_category_cubit.dart';
import 'logic/read_task_cubit/read_task_cubit.dart';
import 'logic/theme_cubit/theme_cubit.dart';
import 'presentation/screens/to_do_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter());

  await Hive.openBox<TaskModel>(kTaskBox);
  await Hive.openBox<CategoryModel>(kCategoryBox);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => ReadTaskCubit()),
        BlocProvider(create: (_) => ReadCategoryCubit()),
      ],
      child: const ToDoApp(),
    );
  }
}
