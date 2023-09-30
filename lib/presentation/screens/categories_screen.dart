import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/theme_cubit/theme_cubit.dart';
import '../../models/category_model.dart';
import '../size_config/size_config.dart';
import '../widgets/category_tile.dart';
import '../widgets/custom_button.dart';

class CategoriesScreen extends StatelessWidget {
  final List<CategoryModel> categories = const [
    CategoryModel(title: 'Home', color: 0xFF08c4b2),
    CategoryModel(title: 'Work', color: 0xFFFF8F00),
    CategoryModel(title: 'Sport', color: 0xFF9C27B0),
    CategoryModel(title: 'Learn', color: 0xFFFF8F00),
    CategoryModel(title: 'Home', color: 0xFF08c4b2),
    CategoryModel(title: 'Work', color: 0xFFFF8F00),
    CategoryModel(title: 'Sport', color: 0xFF9C27B0),
    CategoryModel(title: 'Learn', color: 0xFFFF8F00),
  ];

  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(onPressed: () {}, title: '+ Create new category'),
        ),
        Text(
          'You have\'e ${categories.length} categories',
          style: GoogleFonts.robotoMono(
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.getProportionateScreenWidth(18),
            color: _getCorrectColor(context),
          ),
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: categories.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: ((context, index) =>
                CategoryTile(categoryModel: categories[index])),
          ),
        ),
      ],
    );
  }

  Color _getCorrectColor(BuildContext context) {
    return BlocProvider.of<ThemeCubit>(context).themeMode == ThemeMode.light
        ? Theme.of(context).colorScheme.primary
        : Colors.grey;
  }
}
