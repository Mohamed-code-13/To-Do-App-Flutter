import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_button.dart';
import '../widgets/label_input_field.dart';

class AddTaskScreen extends StatefulWidget {
  static const String routeName = '/add_task_screen';

  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final DateFormat _dateFormat = DateFormat.yMd();
  late String _date;
  final DateFormat _timeFormat = DateFormat('hh:mm a');
  late String _startTime;
  late String _endTime;

  @override
  void initState() {
    super.initState();

    _date = _dateFormat.format(DateTime.now());
    _startTime = _timeFormat.format(DateTime.now());
    _endTime = _timeFormat.format(
      DateTime.now().add(const Duration(minutes: 15)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new task'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              LabelInputField(
                title: 'Title',
                hintText: 'Enter task title',
                textEditingController: _titleController,
              ),
              LabelInputField(
                title: 'Description',
                hintText: 'Enter task description',
                textEditingController: _descriptionController,
              ),
              _getDate(context),
              _getStartEndTime(context),
              const LabelInputField(
                title: 'Repeat',
                hintText: 'None',
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(onPressed: () {}, title: 'Create task'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getDate(BuildContext context) {
    return LabelInputField(
      title: 'Date',
      hintText: _date,
      icon: IconButton(
        icon: const Icon(Icons.calendar_month_outlined),
        onPressed: () {
          showDatePicker(
            context: context,
            initialDate: _dateFormat.parse(_date),
            firstDate: DateTime(2000),
            lastDate: DateTime(2300),
          ).then((value) {
            if (value == null) {
              return;
            }
            setState(() {
              _date = _dateFormat.format(value);
            });
          });
        },
      ),
    );
  }

  Row _getStartEndTime(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LabelInputField(
            title: 'Start Time',
            hintText: _startTime,
            icon: IconButton(
              icon: const Icon(Icons.timer_outlined),
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(
                    _timeFormat.parse(_startTime),
                  ),
                ).then((value) {
                  if (value == null) return;

                  setState(() {
                    _startTime = value.format(context);
                  });
                });
              },
            ),
          ),
        ),
        Expanded(
          child: LabelInputField(
            title: 'End Time',
            hintText: _endTime,
            icon: IconButton(
              icon: const Icon(Icons.timer_outlined),
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(
                    _timeFormat.parse(_endTime),
                  ),
                ).then((value) {
                  if (value == null) return;

                  setState(() {
                    _endTime = value.format(context);
                  });
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
