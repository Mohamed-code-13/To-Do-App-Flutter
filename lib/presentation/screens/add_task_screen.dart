import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/logic/read_task_cubit/read_task_cubit.dart';

import '../../logic/add_task_cubit/add_task_cubit.dart';
import '../widgets/add_task_form.dart';

class AddTaskScreen extends StatelessWidget {
  static const String routeName = '/add_task_screen';

  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new task'),
      ),
      body: SafeArea(
        child: BlocListener<AddTaskCubit, AddTaskState>(
          listener: (context, state) {
            if (state is AddTaskSuccessState) {
              _showSnackBar(context, 'Task added successfully!', Colors.green);
              BlocProvider.of<ReadTaskCubit>(context).getAllTasks();
              Navigator.pop(context);
            } else if (state is AddTaskFailureState) {
              _showSnackBar(context, state.errorMsg, Colors.red);
            }
          },
          child: const AddTaskForm(),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String title, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
