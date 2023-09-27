import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../size_config/size_config.dart';

class CustomBottomModalSheet extends StatelessWidget {
  const CustomBottomModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(26)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          _getButton(
            'Mark as completed',
            () {},
            Colors.white,
            Theme.of(context).colorScheme.primary,
          ),
          _getButton(
            'Delete',
            () {},
            Colors.white,
            Theme.of(context).colorScheme.error,
          ),
          _getButton(
            'Cancel',
            () {},
            Colors.black,
            Colors.white,
          ),
          const SizedBox(height: 22),
        ],
      ),
    );
  }

  Widget _getButton(
    String title,
    VoidCallback onTap,
    Color textColor,
    Color backgroundColor,
  ) {
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
          style: GoogleFonts.robotoMono(color: textColor, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    return Theme.of(context).scaffoldBackgroundColor;
  }
}
