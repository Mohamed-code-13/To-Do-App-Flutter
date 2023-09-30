import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/category_model.dart';
import '../size_config/size_config.dart';

class CategoryTile extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryTile({required this.categoryModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(categoryModel.color),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          categoryModel.title,
          style: GoogleFonts.robotoMono(
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.getProportionateScreenWidth(20),
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
