import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/colors_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_drop_down_button.dart';
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
  final DateFormat _timeFormat = DateFormat('hh:mm a');
  late String _date;
  late String _startTime;
  late String _endTime;
  late String _repeat;
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();

    _date = _dateFormat.format(DateTime.now());
    _startTime = _timeFormat.format(DateTime.now());
    _endTime = _timeFormat.format(
      DateTime.now().add(const Duration(minutes: 15)),
    );
    _repeat = 'None';
    _selectedColor = const Color(0xFF08c4b2);
  }

  @override
  void dispose() {
    super.dispose();

    _titleController.dispose();
    _descriptionController.dispose();
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
              _getRepeat(),
              _getColorsBar(),
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

  LabelInputField _getRepeat() {
    return LabelInputField(
      title: 'Repeat',
      hintText: _repeat,
      icon: CustomDropDownButton(
        onChanged: (val) => setState(() => _repeat = val!),
      ),
    );
  }

  Widget _getDate(BuildContext context) {
    return LabelInputField(
      title: 'Date',
      hintText: _date,
      icon: IconButton(
        icon: const Icon(Icons.calendar_today_outlined),
        onPressed: () {
          showDatePicker(
            context: context,
            initialDate: _dateFormat.parse(_date),
            firstDate: DateTime(2000),
            lastDate: DateTime(2300),
          ).then((value) {
            if (value == null) return;

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
        _getTimeWidget(
          context,
          'Start Time',
          _startTime,
          (String value) {
            _startTime = value;
          },
        ),
        _getTimeWidget(
          context,
          'End Time',
          _endTime,
          (String value) {
            _endTime = value;
          },
        ),
      ],
    );
  }

  Expanded _getTimeWidget(
    BuildContext context,
    String title,
    String hintText,
    void Function(String value) onChange,
  ) {
    return Expanded(
      child: LabelInputField(
        title: title,
        hintText: hintText,
        icon: IconButton(
          icon: const Icon(Icons.timer_outlined),
          onPressed: () {
            showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(
                _timeFormat.parse(hintText),
              ),
            ).then((value) {
              if (value == null) return;

              setState(() {
                onChange(value.format(context));
              });
            });
          },
        ),
      ),
    );
  }

  Widget _getColorsBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Color',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          ColorsBar(
            selectedColor: _selectedColor,
            onTap: (Color currColor) {
              setState(() {
                _selectedColor = currColor;
              });
            },
          ),
        ],
      ),
    );
  }
}
