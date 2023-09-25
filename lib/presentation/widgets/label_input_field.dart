import 'package:flutter/material.dart';

import 'custom_input_field.dart';

class LabelInputField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? textEditingController;
  final Widget? icon;

  const LabelInputField({
    super.key,
    required this.title,
    required this.hintText,
    this.textEditingController,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _getTitle(context),
        CustomInputField(
          hintText: hintText,
          textEditingController: textEditingController,
          icon: icon,
        ),
      ],
    );
  }

  Widget _getTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
