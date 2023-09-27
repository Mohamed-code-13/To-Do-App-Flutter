import 'package:flutter/material.dart';

class ColorAvatar extends StatelessWidget {
  final Color color;
  final bool selected;

  const ColorAvatar({required this.color, required this.selected, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        backgroundColor: color,
        child: selected ? const Icon(Icons.done) : null,
      ),
    );
  }
}
