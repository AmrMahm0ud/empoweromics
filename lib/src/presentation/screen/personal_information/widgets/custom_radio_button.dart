import 'package:empowero/src/domain/entities/personal_information/radio_button_value.dart';
import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String title;
  final RadioButtonValue? selectedValue;
  final RadioButtonValue? radioButtonValue;
  final Function(RadioButtonValue) onChange;

  const CustomRadioButton(
      {Key? key,
      required this.title,
      required this.selectedValue,
      required this.radioButtonValue,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile<RadioButtonValue>(
        contentPadding: EdgeInsets.zero,
        activeColor: Colors.blue,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        value: radioButtonValue!,
        groupValue: selectedValue,
        onChanged: (value) {
          onChange(value!);
        },
      ),
    );
  }
}
