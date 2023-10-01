import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/add_category_cubit/add_category_cubit.dart';
import '../widgets/add_category_form.dart';

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
                  _showSnackBar(
                      context, 'Category added successfully!', Colors.green);
                  // TODO BlocProvider.of
                  Navigator.pop(context);
                } else if (state is AddCategoryFailureState) {
                  _showSnackBar(context, state.errorMsg, Colors.red);
                }
              },
              child: const AddCategoryForm())),
    );
  }

  void _showSnackBar(BuildContext context, String title, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          title,
          style: GoogleFonts.robotoMono(color: color),
        ),
      ),
    );
  }
}
