import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/models/task_model.dart';

import '../../logic/read_task_cubit/read_task_cubit.dart';
import '../helper/helper.dart';
import '../size_config/size_config.dart';
import '../widgets/custom_button.dart';
import '../widgets/date_timeline_bar.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/no_tasks.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';

class CalendarTasksScreen extends StatefulWidget {
  const CalendarTasksScreen({super.key});

  @override
  State<CalendarTasksScreen> createState() => _CalendarTasksScreenState();
}

class _CalendarTasksScreenState extends State<CalendarTasksScreen> {
  late DateTime _selectedDateTime;
  late DateFormat _dateFormat;
  late DateFormat _dateConverter;
  late DateFormat _dayConverter;

  @override
  void initState() {
    super.initState();

    DateTime now = DateTime.now();
    _selectedDateTime = DateTime(now.year, now.day, now.month);
    _dateFormat = DateFormat.yMMMMd();
    _dateConverter = DateFormat.yMd();
    _dayConverter = DateFormat('EEEE');
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _addTaskBar(),
              DateTimeLineBar(
                onChanged: (DateTime date) => setState(() {
                  _selectedDateTime = date;
                }),
              ),
            ],
          ),
        ),
        _buildContent(),
      ],
    );
  }

  Widget _addTaskBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _getTodayDate(),
          CustomButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddTaskScreen.routeName);
            },
            title: '+ Add Task',
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return BlocBuilder<ReadTaskCubit, ReadTaskState>(builder: (context, state) {
      if (state is ReadTaskLoadingState) {
        return const SliverToBoxAdapter(child: LoadingIndicator());
      }
      if (BlocProvider.of<ReadTaskCubit>(context).tasks.isEmpty) {
        return const SliverToBoxAdapter(child: NoTasks());
      } else {
        return _buildTasks();
      }
    });
  }

  Widget _buildTasks() {
    return TasksList(
      tasks: _getCorrectTasks(context),
    );
  }

  Widget _getTodayDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _dateFormat.format(DateTime.now()),
          style: GoogleFonts.robotoMono(
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.getProportionateScreenWidth(18),
            color: getCorrectColor(context),
          ),
        ),
        Text(
          'Today',
          style: GoogleFonts.robotoMono(
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.getProportionateScreenWidth(20),
            color: getCorrectColor(context),
          ),
        ),
      ],
    );
  }

  List<TaskModel> _getCorrectTasks(BuildContext context) {
    List<TaskModel> allTasks = BlocProvider.of<ReadTaskCubit>(context).tasks;
    List<TaskModel> res = [];
    for (TaskModel cur in allTasks) {
      if (_validTask(cur)) {
        res.add(cur);
      }
    }
    return res;
  }

  bool _validTask(TaskModel task) {
    DateTime curDate = _dateConverter.parse(task.date);
    if (_selectedDateTime.isBefore(curDate)) {
      return false;
    }
    if (curDate == _selectedDateTime) {
      return true;
    }
    if (task.repeat == 'Every Day') {
      return true;
    }
    if (task.repeat == 'Every Week' &&
        _dayConverter.format(_selectedDateTime) ==
            _dayConverter.format(curDate)) {
      return true;
    }
    return false;
  }
}
