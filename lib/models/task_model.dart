class TaskModel {
  final String title;
  final String description;
  final String date;
  final String startTime;
  final String endTime;
  final String repeat;
  final bool isCompleted;
  final int color;

  const TaskModel({
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
