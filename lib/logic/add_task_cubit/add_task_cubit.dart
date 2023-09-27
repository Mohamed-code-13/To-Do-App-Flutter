import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitialState());

  List<TaskModel> tasks = [];

  void addTask(TaskModel task) {
    try {
      emit(AddTaskLoadingState());

      tasks.add(task);

      emit(AddTaskSuccessState());
    } catch (e) {
      emit(AddTaskFailureState('Something went wrong! Please try again.'));
    }
  }
}
