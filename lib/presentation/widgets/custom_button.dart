import 'package:flutter/material.dart';

import '../size_config/size_config.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const CustomButton({
    required this.onPressed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: SizeConfig.getProportionateScreenWidth(16),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
