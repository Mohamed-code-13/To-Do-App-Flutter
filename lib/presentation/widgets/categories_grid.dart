import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import '../screens/specific_category_screen.dart';
import 'category_tile.dart';

class CategoriesGrid extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoriesGrid({required this.categories, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: categories.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return _buildCategory(
            context,
            index,
          );
        },
      ),
    );
  }

  Widget _buildCategory(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => _navigateToSpecificCategory(
        context,
        categories[index],
      ),
      child: CategoryTile(categoryModel: categories[index]),
    );
  }

  void _navigateToSpecificCategory(
      BuildContext context, CategoryModel category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SpecificCategoryScreen(category: category),
      ),
    );
  }
}
