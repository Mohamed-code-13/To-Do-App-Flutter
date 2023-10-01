import 'package:flutter/material.dart';

import '../../models/category_model.dart';
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
        itemBuilder: ((context, index) =>
            CategoryTile(categoryModel: categories[index])),
      ),
    );
  }
}
