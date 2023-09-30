import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/theme_cubit/theme_cubit.dart';
import '../../models/category_model.dart';
import '../size_config/size_config.dart';
import '../widgets/category_tile.dart';
import '../widgets/custom_button.dart';
import 'add_category_screen.dart';

class CategoriesScreen extends StatelessWidget {
  final List<CategoryModel> categories = const [];

  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getNewCategoryButton(context),
          _getCategoriesCount(context),
          _getContent(context),
        ],
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    if (categories.isEmpty) {
      return _noCategories(context);
    }
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: categories.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: ((context, index) =>
            CategoryTile(categoryModel: categories[index])),
      ),
    );
  }

  Widget _noCategories(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/menu.png',
            color: Theme.of(context).colorScheme.primary,
            width: SizeConfig.screenWidth / 3,
          ),
          Text(
            'You don\'t have any categories yet',
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoMono(
              fontSize: SizeConfig.getProportionateScreenWidth(16),
              color: _getCorrectColor(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getNewCategoryButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AddCategoryScreen.routeName);
          },
          title: '+ Create new category'),
    );
  }

  Text _getCategoriesCount(BuildContext context) {
    return Text(
      'You have ${categories.length} categories',
      style: GoogleFonts.robotoMono(
        fontWeight: FontWeight.bold,
        fontSize: SizeConfig.getProportionateScreenWidth(18),
        color: _getCorrectColor(context),
      ),
      textAlign: TextAlign.center,
    );
  }

  Color _getCorrectColor(BuildContext context) {
    return BlocProvider.of<ThemeCubit>(context).themeMode == ThemeMode.light
        ? Theme.of(context).colorScheme.primary
        : Colors.grey;
  }
}
