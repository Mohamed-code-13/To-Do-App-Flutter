import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../size_config/size_config.dart';

class CustomNavBar extends StatelessWidget {
  final void Function(int) onTap;
  final List<GButton> tabs = const [
    GButton(icon: Icons.home, text: 'Home'),
    GButton(icon: Icons.view_comfy_rounded, text: 'Categories'),
  ];

  const CustomNavBar({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
      gap: 8,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      backgroundColor: Theme.of(context).colorScheme.primary,
      color: Colors.white,
      activeColor: Colors.white,
      tabBackgroundColor: Colors.teal[900]!,
      padding: const EdgeInsets.all(12.0),
      tabMargin: const EdgeInsets.all(12),
      iconSize: SizeConfig.getProportionateScreenWidth(28),
      textStyle: GoogleFonts.robotoMono(
        color: Theme.of(context).colorScheme.primaryContainer,
        fontSize: SizeConfig.getProportionateScreenWidth(16),
        fontWeight: FontWeight.bold,
      ),
      tabs: tabs,
      onTabChange: onTap,
    );
  }
}
