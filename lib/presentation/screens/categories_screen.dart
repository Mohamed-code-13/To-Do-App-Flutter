import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/presentation/widgets/loading_indicator.dart';

import '../../logic/read_category_cubit/read_category_cubit.dart';
import '../../logic/theme_cubit/theme_cubit.dart';
import '../size_config/size_config.dart';
import '../widgets/categories_grid.dart';
import '../widgets/custom_button.dart';
import 'add_category_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadCategoryCubit, ReadCategoryState>(
        builder: (context, state) {
      return SizedBox(
        width: SizeConfig.screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getNewCategoryButton(context),
            _getCategoriesCount(context),
            _getContent(context, state),
          ],
        ),
      );
    });
  }

  Widget _getContent(BuildContext context, ReadCategoryState state) {
    if (state is ReadCategoryLoadingState) {
      return const LoadingIndicator();
    }
    if (BlocProvider.of<ReadCategoryCubit>(context).categoreis.isEmpty) {
      return _noCategories(context);
    } else {
      return CategoriesGrid(
          categories: BlocProvider.of<ReadCategoryCubit>(context).categoreis);
    }
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
      'You have ${BlocProvider.of<ReadCategoryCubit>(context).categoreis.length} categories',
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
