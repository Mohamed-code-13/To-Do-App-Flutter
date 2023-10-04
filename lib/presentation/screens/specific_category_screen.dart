import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/read_category_cubit/read_category_cubit.dart';
import '../../logic/read_task_cubit/read_task_cubit.dart';
import '../../models/category_model.dart';
import '../../models/task_model.dart';
import '../size_config/size_config.dart';
import '../widgets/colored_button.dart';
import '../widgets/no_categories.dart';
import '../widgets/show_snack_bar.dart';
import '../widgets/tasks_list.dart';

class SpecificCategoryScreen extends StatelessWidget {
  final CategoryModel category;

  const SpecificCategoryScreen({
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _getDeleteButton(context)),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return BlocBuilder<ReadTaskCubit, ReadTaskState>(builder: (context, state) {
      var allTasks = BlocProvider.of<ReadTaskCubit>(context).tasks;
      var tasks = _getSpecificTasks(allTasks, category.title);

      if (tasks.isEmpty) {
        return SliverFillRemaining(
          child: SizedBox(
            width: SizeConfig.screenWidth,
            child: const NoCategories(
              title: 'You don\'t have any tasks in this category!',
            ),
          ),
        );
      }
      return TasksList(tasks: tasks);
    });
  }

  Widget _getDeleteButton(BuildContext context) {
    return ColoredButton(
      title: 'Delete Category',
      onTap: () async => await _deleteCategory(context),
      textColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.error,
    );
  }

  Future<void> _deleteCategory(BuildContext context) async {
    var nav = Navigator.of(context);
    var taskCubit = BlocProvider.of<ReadTaskCubit>(context);
    var categoryCubit = BlocProvider.of<ReadCategoryCubit>(context);

    showSnackBar(context, 'Category deleted!', Colors.red);
    await taskCubit.deleteCategory(category.title);
    await categoryCubit.deleteCategory(category);

    nav.pop();
  }

  List<TaskModel> _getSpecificTasks(List<TaskModel> tasks, String title) {
    return tasks
        .where((element) => element.categories.contains(title))
        .toList();
  }
}
