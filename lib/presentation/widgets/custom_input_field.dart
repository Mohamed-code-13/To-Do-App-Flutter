import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController? textEditingController;
  final Widget? icon;

  const CustomInputField({
    super.key,
    required this.hintText,
    this.textEditingController,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: TextFormField(
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
        controller: textEditingController,
        readOnly: icon != null,
        decoration: InputDecoration(
          suffixIcon: icon,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedBorder: _inputBorder(context),
          enabledBorder: _inputBorder(context),
        ),
      ),
    );
  }

  OutlineInputBorder _inputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: 2.0,
      ),
    );
  }
}
