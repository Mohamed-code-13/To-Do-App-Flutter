import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/helper.dart';
import '../size_config/size_config.dart';

class NoCategories extends StatelessWidget {
  final String title;

  const NoCategories({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/menu.png',
          color: Theme.of(context).colorScheme.primary,
          width: SizeConfig.screenWidth / 3,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.robotoMono(
            fontSize: SizeConfig.getProportionateScreenWidth(16),
            color: getCorrectColor(context),
          ),
        ),
      ],
    );
  }
}
