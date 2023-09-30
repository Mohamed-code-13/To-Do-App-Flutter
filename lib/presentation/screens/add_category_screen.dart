import 'package:flutter/material.dart';

import '../widgets/add_category_form.dart';

class AddCategoryScreen extends StatelessWidget {
  static const String routeName = '/add_category_screen';

  const AddCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create new category')),
      body: const SafeArea(child: AddCategoryForm()),
    );
  }
}
