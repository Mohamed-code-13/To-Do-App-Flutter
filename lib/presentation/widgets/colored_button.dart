import 'package:flutter/material.dart';

import '../size_config/size_config.dart';

class ColoredButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  const ColoredButton({
    required this.title,
    required this.textColor,
    required this.backgroundColor,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.all(22.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Text(
          title,
          style: TextStyle(color: textColor, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
