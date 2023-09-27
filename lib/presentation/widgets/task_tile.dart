import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/task_model.dart';
import '../size_config/size_config.dart';

class TaskTile extends StatelessWidget {
  final TaskModel task;

  const TaskTile({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(task.color),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(child: _getContent()),
            const SizedBox(
              width: 8,
            ),
            Container(
              margin: const EdgeInsets.all(5),
              height: 70,
              width: 1,
              color: Colors.black54,
            ),
            _getStatus(),
          ],
        ),
      ),
    );
  }

  Widget _getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _getTitle(),
        _getStartEndTime(),
        _getDescription(),
        _getDate(),
      ],
    );
  }

  Widget _getTitle() {
    return Text(
      task.title,
      style: GoogleFonts.robotoMono(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: SizeConfig.getProportionateScreenWidth(18),
      ),
    );
  }

  Widget _getStartEndTime() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.timer_outlined, color: Colors.white),
          Text(
            ' ${task.startTime} - ',
            style: GoogleFonts.robotoMono(
              color: Colors.white,
              fontSize: SizeConfig.getProportionateScreenWidth(14),
            ),
          ),
          Text(
            task.endTime,
            style: GoogleFonts.robotoMono(
              color: Colors.white,
              fontSize: SizeConfig.getProportionateScreenWidth(14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getDescription() {
    return Text(
      '${task.description}${task.description}${task.description}${task.description}',
      textAlign: TextAlign.justify,
      style: GoogleFonts.robotoMono(
        color: Colors.white,
        fontSize: SizeConfig.getProportionateScreenWidth(16),
      ),
    );
  }

  Widget _getDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.calendar_today_outlined,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Text(
            task.date,
            style: GoogleFonts.robotoMono(
              color: Colors.white,
              fontSize: SizeConfig.getProportionateScreenWidth(14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getStatus() {
    return RotatedBox(
      quarterTurns: 3,
      child: Text(
        task.isCompleted ? 'COMPLETED' : 'TO DO',
        style: GoogleFonts.robotoMono(
          color: Colors.white,
          fontSize: SizeConfig.getProportionateScreenWidth(14),
        ),
      ),
    );
  }
}
