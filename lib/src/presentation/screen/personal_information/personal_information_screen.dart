import 'package:empowero/src/domain/entities/personal_information/drop_down_button_value.dart';
import 'package:empowero/src/domain/entities/personal_information/radio_button_value.dart';
import 'package:empowero/src/presentation/screen/personal_information/widgets/custom_drop_down_button.dart';
import 'package:empowero/src/presentation/screen/personal_information/widgets/custom_text_field_widget.dart';
import 'package:empowero/src/presentation/screen/personal_information/widgets/radio_selection_widget.dart';
import 'package:flutter/material.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController mobileEditingController = TextEditingController();
  TextEditingController companyEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  List<RadioButtonValue> yesOrNoSelectionValues = [
    RadioButtonValue(label: "Yes", id: 0),
    RadioButtonValue(label: "No", id: 1)
  ];
  List<RadioButtonValue> employTypeValues = [
    RadioButtonValue(label: "Employed", id: 0),
    RadioButtonValue(label: "Self-employed", id: 1)
  ];

  List<DropDownButtonValue> governorates = [
    DropDownButtonValue(title: "Cairo", id: 0),
    DropDownButtonValue(title: "Aswan", id: 1)
  ];

  List<DropDownButtonValue> monthlyIncome = [
    DropDownButtonValue(title: "1000", id: 0),
    DropDownButtonValue(title: "2000", id: 1)
  ];

  List<DropDownButtonValue> whereDidYouHearAboutUs = [
    DropDownButtonValue(title: "Facebook", id: 0),
    DropDownButtonValue(title: "Twitter", id: 1)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Name *"),
                    SizedBox(
                      width: 250,
                      child: CustomTextFieldWidget(
                        controller: nameEditingController,
                        onChange: (value) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Mobile *"),
                    SizedBox(
                      width: 250,
                      child: CustomTextFieldWidget(
                          controller: mobileEditingController,
                          onChange: (value) {},
                          textInputType: TextInputType.phone),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Company *"),
                    SizedBox(
                      width: 250,
                      child: CustomTextFieldWidget(
                          controller: companyEditingController,
                          onChange: (value) {}),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Email *"),
                    SizedBox(
                      width: 250,
                      child: CustomTextFieldWidget(
                          controller: emailEditingController,
                          onChange: (value) {}),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                RadiobuttonSelectionWidget(
                  values: yesOrNoSelectionValues,
                  selectedValue: yesOrNoSelectionValues.first,
                  title: "Do you have and banking obligation?",
                ),
                const SizedBox(height: 10),
                RadiobuttonSelectionWidget(
                  values: employTypeValues,
                  selectedValue: employTypeValues.first,
                  title: "Employed / Self employed",
                ),
                const SizedBox(height: 10),
                CustomDropDownButton(
                    selectedValue: governorates.first,
                    values: governorates,
                    title: "Governorate"),
                const SizedBox(height: 10),
                CustomDropDownButton(
                    selectedValue: monthlyIncome.first,
                    values: monthlyIncome,
                    title: "Monthly income"),
                const SizedBox(height: 10),
                CustomDropDownButton(
                    selectedValue: whereDidYouHearAboutUs.first,
                    values: whereDidYouHearAboutUs,
                    title: "Where did they hear about us?"),
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
