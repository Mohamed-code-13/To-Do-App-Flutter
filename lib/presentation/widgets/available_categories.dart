import 'package:flutter/material.dart';

import '../helper/helper.dart';

class AvailableCategories extends StatelessWidget {
  final Map<String, bool> categories;
  final void Function(String, bool) onChanged;

  const AvailableCategories({
    required this.categories,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return categories.isEmpty
        ? _buildEmptyCategories(context)
        : _buildCategories(context);
  }

  Widget _buildEmptyCategories(BuildContext context) {
    return const Text(
      'You don\'t have any categories yet',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return Wrap(
      children: categories.keys
          .map(
            (category) => CheckboxListTile(
              value: categories[category],
              title: Text(
                category,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: getCorrectColor(context),
                ),
              ),
              onChanged: (val) {
                if (val != null) {
                  onChanged(category, val);
                }
              },
            ),
          )
          .toList(),
    );
  }
}
