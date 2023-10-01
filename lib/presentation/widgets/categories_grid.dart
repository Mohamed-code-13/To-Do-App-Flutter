import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/models/task_model.dart';

import '../../logic/read_task_cubit/read_task_cubit.dart';
import '../../models/category_model.dart';
import '../screens/specific_category_screen.dart';
import 'category_tile.dart';

class CategoriesGrid extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoriesGrid({required this.categories, super.key});

  @override
  Widget build(BuildContext context) {
    // List<TaskModel> tasks = BlocProvider.of<ReadTaskCubit>(context).tasks;

    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: categories.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: ((context, index) {
          return _buildCategory(
            context,
            index,
            BlocProvider.of<ReadTaskCubit>(context).tasks,
          );
        }),
      ),
    );
  }

  Widget _buildCategory(
      BuildContext context, int index, List<TaskModel> tasks) {
    return GestureDetector(
      onTap: () => _navigateToSpecificCategory(
        context,
        categories[index].title,
        _getSpecificTasks(tasks, categories[index].title),
      ),
      child: CategoryTile(categoryModel: categories[index]),
    );
  }

  void _navigateToSpecificCategory(
      BuildContext context, String title, List<TaskModel> tasks) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SpecificCategoryScreen(
          title: title,
          tasks: tasks,
        ),
      ),
    );
  }

  List<TaskModel> _getSpecificTasks(List<TaskModel> tasks, String title) {
    return tasks
        .where((element) => element.categories.contains(title))
        .toList();
  }
}
