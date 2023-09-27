import 'package:flutter/material.dart';

import 'color_avatar.dart';

class ColorsBar extends StatelessWidget {
  final Color selectedColor;
  final void Function(Color) onTap;
  final List<Color> colors = const [
    Color(0xFF08c4b2),
    Colors.purple,
    Colors.amber,
  ];

  const ColorsBar({
    required this.selectedColor,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: colors
          .map((c) => GestureDetector(
                onTap: () {
                  onTap(c);
                },
                child: ColorAvatar(
                  color: c,
                  selected: c == selectedColor,
                ),
              ))
          .toList(),
    );
  }
}
