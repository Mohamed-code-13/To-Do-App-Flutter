class TaskModel {
  final String title;
  final String description;
  final String date;
  final String startTime;
  final String endTime;
  final String repeat;

  const TaskModel({
    required this.title,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.repeat,
  });
}
