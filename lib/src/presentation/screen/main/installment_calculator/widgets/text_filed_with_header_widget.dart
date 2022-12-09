import 'package:empowero/src/presentation/screen/personal_information/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';

class TextFiledWithHeaderWidget extends StatelessWidget {
  final String headerText;
  final String? errorMessage;
  final Function(String) onChange;
  TextEditingController controller;

  TextFiledWithHeaderWidget(
      {Key? key,
      required this.headerText,
      this.errorMessage,
      required this.onChange,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headerText, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 4),
        CustomTextFieldWidget(
          controller: controller,
          onChange: onChange,
          errorMessage: errorMessage,
        )
      ],
    );
  }
}
