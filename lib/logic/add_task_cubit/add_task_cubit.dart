import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitialState());

  Future<void> addTask(TaskModel task) async {
    try {
      emit(AddTaskLoadingState());
      var tasksBox = Hive.box<TaskModel>(kTaskBox);

      await tasksBox.add(task);

      emit(AddTaskSuccessState());
    } catch (e) {
      emit(AddTaskFailureState('Something went wrong! Please try again.'));
    }
  }
}
