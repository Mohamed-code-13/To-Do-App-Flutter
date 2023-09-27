import 'package:flutter/material.dart';

import '../size_config/size_config.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool loading;

  const CustomButton({
    required this.onPressed,
    required this.title,
    this.loading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: _getContent(),
    );
  }

  Widget _getContent() {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    } else {
      return Text(
        title,
        style: TextStyle(
          fontSize: SizeConfig.getProportionateScreenWidth(16),
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }
}
