import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/read_task_cubit/read_task_cubit.dart';
import '../../models/task_model.dart';
import '../size_config/size_config.dart';
import 'colored_button.dart';
import 'show_snack_bar.dart';

class CustomBottomModalSheet extends StatelessWidget {
  final TaskModel task;

  const CustomBottomModalSheet({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(26)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          ColoredButton(
            title: 'Mark as ${task.isCompleted ? 'To Do' : 'completed'}',
            onTap: () async => await _markAsCompleted(context),
            textColor: Colors.white,
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          ColoredButton(
            title: 'Delete',
            onTap: () async => await _deleteTask(context),
            textColor: Colors.white,
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
          ColoredButton(
            title: 'Cancel',
            onTap: () => Navigator.pop(context),
            textColor: Colors.black,
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 22),
        ],
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    return Theme.of(context).scaffoldBackgroundColor;
  }

  Future<void> _markAsCompleted(BuildContext context) async {
    var nav = Navigator.of(context);

    showSnackBar(
      context,
      'Marked as ${task.isCompleted ? 'To Do' : 'Completed'}',
      Colors.green,
    );
    await BlocProvider.of<ReadTaskCubit>(context).toggleComplete(task);

    nav.pop();
  }

  Future<void> _deleteTask(BuildContext context) async {
    var nav = Navigator.of(context);

    showSnackBar(context, 'Task deleted!', Colors.red);
    await BlocProvider.of<ReadTaskCubit>(context).deleteTask(task);

    nav.pop();
  }
}
