import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/helper.dart';
import '../size_config/size_config.dart';

class NoTasks extends StatelessWidget {
  const NoTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/task.png',
          color: Theme.of(context).colorScheme.primary,
          width: SizeConfig.screenWidth / 3,
        ),
        Text(
          'You don\'t have any tasks yet',
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
