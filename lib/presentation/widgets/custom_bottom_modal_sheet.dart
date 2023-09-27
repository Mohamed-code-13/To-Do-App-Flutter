import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/read_task_cubit/read_task_cubit.dart';
import '../../models/task_model.dart';
import '../size_config/size_config.dart';

class CustomBottomModalSheet extends StatelessWidget {
  final TaskModel task;

  const CustomBottomModalSheet({required this.task, super.key});

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
          _getButton(
            'Mark as ${task.isCompleted ? 'To Do' : 'completed'}',
            () => _markAsCompleted(context),
            Colors.white,
            Theme.of(context).colorScheme.primary,
          ),
          _getButton(
            'Delete',
            () => _deleteTask(context),
            Colors.white,
            Theme.of(context).colorScheme.error,
          ),
          _getButton(
            'Cancel',
            () => Navigator.pop(context),
            Colors.black,
            Colors.white,
          ),
          const SizedBox(height: 22),
        ],
      ),
    );
  }

  Widget _getButton(
    String title,
    VoidCallback onTap,
    Color textColor,
    Color backgroundColor,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.all(22.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Text(
          title,
          style: GoogleFonts.robotoMono(color: textColor, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    return Theme.of(context).scaffoldBackgroundColor;
  }

  void _markAsCompleted(BuildContext context) {
    task.isCompleted = !task.isCompleted;
    task.save();
    BlocProvider.of<ReadTaskCubit>(context).getAllTasks();

    Navigator.pop(context);
  }

  void _deleteTask(BuildContext context) {
    task.delete();
    BlocProvider.of<ReadTaskCubit>(context).getAllTasks();

    Navigator.pop(context);
  }
}
