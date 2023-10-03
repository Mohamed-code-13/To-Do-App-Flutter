import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/add_category_cubit/add_category_cubit.dart';
import '../../logic/read_category_cubit/read_category_cubit.dart';
import '../widgets/add_category_form.dart';
import '../widgets/show_snack_bar.dart';

class AddCategoryScreen extends StatelessWidget {
  static const String routeName = '/add_category_screen';

  const AddCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create new category')),
      body: SafeArea(
          child: BlocListener<AddCategoryCubit, AddCategoryState>(
              listener: (context, state) {
                if (state is AddCategorySuccessState) {
                  showSnackBar(
                      context, 'Category added successfully!', Colors.green);
                  BlocProvider.of<ReadCategoryCubit>(context)
                      .getAllCategories();

                  Navigator.pop(context);
                } else if (state is AddCategoryFailureState) {
                  showSnackBar(context, state.errorMsg, Colors.red);
                }
              },
              child: const AddCategoryForm())),
    );
  }
}
