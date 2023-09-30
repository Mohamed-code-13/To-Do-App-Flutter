import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/presentation/widgets/custom_bottom_modal_sheet.dart';
import 'package:to_do_app/presentation/widgets/task_tile.dart';

import '../../logic/read_task_cubit/read_task_cubit.dart';
import '../../models/task_model.dart';

class TasksList extends StatelessWidget {
  final List<TaskModel> tasks;

  const TasksList({required this.tasks, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (ctx, index) {
        return AnimationConfiguration.staggeredList(
          duration: const Duration(milliseconds: 300),
          position: index,
          child: SlideAnimation(
            horizontalOffset: 300,
            child: FadeInAnimation(
              child: Dismissible(
                key: UniqueKey(),
                background: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  color: Theme.of(context).colorScheme.error,
                ),
                onDismissed: (direction) {
                  tasks[index].delete();
                  _showSnackBar(context);
                  BlocProvider.of<ReadTaskCubit>(context).getAllTasks();
                },
                child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => CustomBottomModalSheet(
                          task: tasks[index],
                        ),
                      );
                    },
                    child: TaskTile(task: tasks[index])),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          'Task deleted!',
          style: GoogleFonts.robotoMono(color: Colors.red),
        ),
      ),
    );
  }
}
