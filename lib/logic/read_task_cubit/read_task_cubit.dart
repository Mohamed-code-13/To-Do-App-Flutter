import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/task_model.dart';

part 'read_task_state.dart';

class ReadTaskCubit extends Cubit<ReadTaskState> {
  ReadTaskCubit() : super(ReadTaskInitialState());

  List<TaskModel> tasks = [];

  void getAllTasks() async {
    emit(ReadTaskLoadingState());

    var tasksBox = Hive.box<TaskModel>(kTaskBox);

    tasks = tasksBox.values.toList();
    print(tasks);
    emit(ReadTaskSuccessState());
  }
}
