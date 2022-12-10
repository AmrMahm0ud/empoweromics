import 'package:empowero/src/domain/entities/personal_information/drop_down_button_value.dart';
import 'package:flutter/material.dart';

class UnitTypeWidget extends StatelessWidget {
  final List<DropDownButtonValue> values;
  final DropDownButtonValue selectedValue;
  final String title;
  final String? errorMessage;
  final Function(DropDownButtonValue) onChange;

  const UnitTypeWidget(
      {Key? key,
      required this.title,
      required this.onChange,
      required this.values,
      required this.selectedValue,
      this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Text(title, style: const TextStyle(fontSize: 16)),
        ),
        const SizedBox(height: 4),
        DropdownButtonFormField(
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
      ],
    );
  }
}
