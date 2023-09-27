part of 'read_task_cubit.dart';

abstract class ReadTaskState {}

class ReadTaskInitialState extends ReadTaskState {}

class ReadTaskLoadingState extends ReadTaskState {}

class ReadTaskSuccessState extends ReadTaskState {}
