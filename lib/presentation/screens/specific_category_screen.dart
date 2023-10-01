import 'package:flutter/material.dart';

import '../../models/task_model.dart';
import '../size_config/size_config.dart';
import '../widgets/no_categories.dart';
import '../widgets/tasks_list.dart';

class SpecificCategoryScreen extends StatelessWidget {
  final String title;
  final List<TaskModel> tasks;

  const SpecificCategoryScreen({
    required this.title,
    required this.tasks,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(child: _buildContent(context)),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (tasks.isEmpty) {
      return SizedBox(
        width: SizeConfig.screenWidth,
        child: const NoCategories(
          title: 'You don\'t have any tasks in this category!',
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TasksList(tasks: tasks),
    );
  }
}
