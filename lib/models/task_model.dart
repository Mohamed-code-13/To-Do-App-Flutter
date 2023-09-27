import 'package:hive/hive.dart';

part 'task_model.g.dart';

const String kTaskBox = 'task_box';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final String startTime;
  @HiveField(4)
  final String endTime;
  @HiveField(5)
  final String repeat;
  @HiveField(6)
  bool isCompleted;
  @HiveField(7)
  final int color;

  TaskModel({
    required this.title,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.repeat,
    required this.isCompleted,
    required this.color,
  });
}
