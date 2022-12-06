import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? errorMessage;
  final Function(String) onChange;
  final TextInputType textInputType;
  TextStyle? labelStyle;

  CustomTextFieldWidget({
    Key? key,
    required this.controller,
    required this.onChange,
    this.labelStyle,
    this.errorMessage,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      controller: controller,
      onChanged: onChange,
      style:
          Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
      decoration: InputDecoration(
        errorText: errorMessage,
        labelStyle:
            TextStyle(color: errorMessage == null ? Colors.grey : Colors.red),
      ),
    );
  }
}
