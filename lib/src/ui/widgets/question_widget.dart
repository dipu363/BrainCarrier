import 'package:flutter/material.dart';

import '../util/app_colors.dart';
class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key, required this.controller, required this.validator, required this.hintText,
  });

  final TextEditingController controller;
  final Function(String?) validator;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      validator: (value) => validator(value),
      maxLines: 5,
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 2)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 2))),
    );
  }
}