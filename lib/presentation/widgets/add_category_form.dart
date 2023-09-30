import 'package:flutter/material.dart';
import 'package:to_do_app/presentation/widgets/label_input_field.dart';

import 'colors_bar.dart';
import 'custom_button.dart';

class AddCategoryForm extends StatefulWidget {
  const AddCategoryForm({super.key});

  @override
  State<AddCategoryForm> createState() => _AddCategoryFormState();
}

class _AddCategoryFormState extends State<AddCategoryForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController _titleController = TextEditingController();
  Color _selectedColor = const Color(0xFF08c4b2);

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            LabelInputField(
              title: 'Title',
              hintText: 'Enter Category title',
              textEditingController: _titleController,
            ),
            _getColorsBar(),
            _getSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _getColorsBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Color',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          ColorsBar(
            selectedColor: _selectedColor,
            onTap: (Color currColor) {
              setState(() {
                _selectedColor = currColor;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _getSubmitButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomButton(
        onPressed: () {},
        title: 'Create category',
      ),
    );
  }
}
