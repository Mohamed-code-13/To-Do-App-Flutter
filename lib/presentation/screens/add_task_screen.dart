import 'package:flutter/material.dart';

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
      body: const SafeArea(
        child: AddTaskForm(),
      ),
    );
  }
}
