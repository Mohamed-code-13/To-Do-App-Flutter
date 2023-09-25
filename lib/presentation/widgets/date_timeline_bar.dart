import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../size_config/size_config.dart';

class DateTimeLineBar extends StatelessWidget {
  final void Function(DateTime) onChanged;

  const DateTimeLineBar({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: DatePicker(
        DateTime.now(),
        width: 70,
        height: SizeConfig.getProportionateScreenHeight(120),
        selectionColor: Theme.of(context).colorScheme.primary,
        selectedTextColor: Colors.white,
        initialSelectedDate: DateTime.now(),
        daysCount: 35,
        onDateChange: onChanged,
        dayTextStyle: GoogleFonts.robotoMono(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.grey,
        ),
        dateTextStyle: GoogleFonts.robotoMono(
          fontWeight: FontWeight.w600,
          fontSize: 22,
          color: Colors.grey,
        ),
        monthTextStyle: GoogleFonts.robotoMono(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    );
  }
}
