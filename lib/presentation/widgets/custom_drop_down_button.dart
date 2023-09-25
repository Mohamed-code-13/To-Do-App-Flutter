import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropDownButton extends StatelessWidget {
  final Function(String?) onChanged;

  final List<DropdownMenuItem<String>> dropDownItems = const [
    DropdownMenuItem(value: 'None', child: Text('None')),
    DropdownMenuItem(value: 'Every Day', child: Text('Every Day')),
    DropdownMenuItem(value: 'Every Week', child: Text('Every Week')),
  ];

  const CustomDropDownButton({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Theme.of(context).colorScheme.primary,
      style: GoogleFonts.robotoMono(color: Colors.white, fontSize: 16),
      padding: const EdgeInsets.all(8.0),
      borderRadius: BorderRadius.circular(12),
      items: dropDownItems,
      onChanged: onChanged,
    );
  }
}
