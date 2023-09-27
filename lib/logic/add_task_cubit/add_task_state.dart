part of 'add_task_cubit.dart';

abstract class AddTaskState {}

class AddTaskInitialState extends AddTaskState {}

class AddTaskLoadingState extends AddTaskState {}

class AddTaskSuccessState extends AddTaskState {}

class AddTaskFailureState extends AddTaskState {
  final String errorMsg;

  AddTaskFailureState(this.errorMsg);
}
