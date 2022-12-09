import 'package:empowero/src/domain/entities/personal_information/radio_button_value.dart';
import 'package:empowero/src/presentation/screen/personal_information/widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';

class RadiobuttonSelectionWidget extends StatelessWidget {
  final RadioButtonValue? selectedValue;
  final List<RadioButtonValue> values;
  final String title;
  final Function(RadioButtonValue) onChanged;

  const RadiobuttonSelectionWidget(
      {Key? key,
      required this.selectedValue,
      required this.values,
      required this.title,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: Text(title),
        ),
        _buildRadioSelectionWidget(context),
      ],
    );
  }

  Widget _buildRadioSelectionWidget(context) {
    return Expanded(
      child: Row(
          children: values
              .map((element) => CustomRadioButton(
                    radioButtonValue: element,
                    title: element.label,
                    selectedValue: selectedValue,
                    onChange: (value) {
                      onChanged(value);
                    },
                  ))
              .toList()),
    );
  }
}
