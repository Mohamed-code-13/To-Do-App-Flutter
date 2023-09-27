import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:to_do_app/presentation/widgets/task_tile.dart';

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
              child: TaskTile(task: tasks[index]),
            ),
          ),
        );
      },
    );
  }
}
