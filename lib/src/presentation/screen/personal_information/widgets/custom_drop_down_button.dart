import 'package:empowero/src/domain/entities/personal_information/drop_down_button_value.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  final List<DropDownButtonValue> values;
  final DropDownButtonValue selectedValue;
  final String title;
  final String? errorMessage;
  final Function(DropDownButtonValue) onChange;

  const CustomDropDownButton(
      {Key? key,
      required this.values,
      required this.selectedValue,
      required this.title,
      required this.onChange,
      this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Text(title),
        ),
        Expanded(
          child: DropdownButtonFormField(
            isExpanded: true,
            items: values
                .map((element) => DropdownMenuItem<DropDownButtonValue>(
                      value: element,
                      child: Text(
                        element.title,
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (value) => onChange(value!),
            decoration: InputDecoration(
              errorText: errorMessage,
              labelStyle: TextStyle(
                  color: errorMessage == null ? Colors.grey : Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
