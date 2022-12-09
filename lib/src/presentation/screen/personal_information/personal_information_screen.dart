import 'package:empowero/src/domain/entities/personal_information/drop_down_button_value.dart';
import 'package:empowero/src/domain/entities/personal_information/personal_information_validation_text.dart';
import 'package:empowero/src/domain/entities/personal_information/radio_button_value.dart';
import 'package:empowero/src/presentation/bloc/personal_information/personal_information_bloc.dart';
import 'package:empowero/src/presentation/bloc/personal_information/personal_information_event.dart';
import 'package:empowero/src/presentation/bloc/personal_information/personal_information_state.dart';
import 'package:empowero/src/presentation/screen/personal_information/widgets/custom_drop_down_button.dart';
import 'package:empowero/src/presentation/screen/personal_information/widgets/custom_text_field_widget.dart';
import 'package:empowero/src/presentation/screen/personal_information/widgets/radio_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  PersonalInformationValidationText? _personalInformationValidationText;

  RadioButtonValue? selectedBankingObligations =
      const RadioButtonValue(label: "Yes", id: 0);
  RadioButtonValue? selectedEmployType;
  DropDownButtonValue? selectedGovernorates =
      const DropDownButtonValue(title: "Select Governorate", id: -1);
  DropDownButtonValue? selectedMonthlyIncome =
      const DropDownButtonValue(id: -1, title: "Please Choose");
  DropDownButtonValue? selectedWhereHearAboutUs =
      const DropDownButtonValue(id: -1, title: "Please Choose");

  List<RadioButtonValue> bankingObligations = [
    const RadioButtonValue(label: "Yes", id: 0),
    const RadioButtonValue(label: "No", id: 1)
  ];
  List<RadioButtonValue> employType = [
    const RadioButtonValue(label: "Employed", id: 0),
    const RadioButtonValue(label: "Self-employed", id: 1)
  ];

  List<DropDownButtonValue> governorates = [
    const DropDownButtonValue(title: "Select Governorate", id: -1),
    const DropDownButtonValue(title: "Cairo", id: 0),
    const DropDownButtonValue(title: "Aswan", id: 1)
  ];

  List<DropDownButtonValue> monthlyIncome = [
    const DropDownButtonValue(title: "Please Choose", id: -1),
    const DropDownButtonValue(title: "1000", id: 0),
    const DropDownButtonValue(title: "2000", id: 1)
  ];

  List<DropDownButtonValue> whereDidYouHearAboutUs = [
    const DropDownButtonValue(title: "Please Choose", id: -1),
    const DropDownButtonValue(title: "Facebook", id: 0),
    const DropDownButtonValue(title: "Twitter", id: 1)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocConsumer<PersonalInformationBloc, PersonalInformationState>(
          listener: (context, state) {
        if (state is PersonalInformationValidationState) {
          _personalInformationValidationText =
              state.personalInformationValidationText;
        } else if (state is SelectedEmployTypeState) {
          selectedEmployType = state.employType;
        } else if (state is SelectedBankingObligationState) {
          selectedBankingObligations = state.bankingObligation;
        }
      }, builder: (context, state) {
        return CustomScrollView(slivers: [
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
                          errorMessage:
                              _personalInformationValidationText?.name,
                          controller: nameEditingController,
                          onChange: (name) =>
                              checkNameValidationEvent(name: name),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CustomDropDownButton(
                      selectedValue: selectedGovernorates!,
                      values: governorates,
                      title: "Governorate *",
                      onChange: (governorate) {
                        selectedGovernorates = governorate;
                        checkGovernorateValidationEvent(
                            governorate: governorate);
                      },
                      errorMessage:
                          _personalInformationValidationText?.governorate),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Mobile *"),
                      SizedBox(
                        width: 250,
                        child: CustomTextFieldWidget(
                            errorMessage:
                                _personalInformationValidationText?.mobile,
                            controller: mobileEditingController,
                            onChange: (value) {
                              checkMobileValidationEvent(mobile: value);
                            },
                            textInputType: TextInputType.phone),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  RadiobuttonSelectionWidget(
                    values: employType,
                    selectedValue: selectedEmployType,
                    title: "Employed / Self employed",
                    onChanged: (value) {
                      selectEmployTypeEvent(employType: value);
                    },
                  ),
                  const SizedBox(height: 10),
                  RadiobuttonSelectionWidget(
                    values: bankingObligations,
                    selectedValue: selectedBankingObligations,
                    title: "Do you have and banking obligation?*",
                    onChanged: (value) {
                      selectBankingObligationsEvent(bankingObligation: value);
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Company name *"),
                      SizedBox(
                        width: 250,
                        child: CustomTextFieldWidget(
                            errorMessage:
                                _personalInformationValidationText?.companyName,
                            controller: companyEditingController,
                            onChange: (value) {
                              checkCompanyNameValidationEvent(
                                  companyName: value);
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CustomDropDownButton(
                    selectedValue: selectedMonthlyIncome!,
                    values: monthlyIncome,
                    title: "Monthly income",
                    onChange: (monthlyIncome) {
                      selectedMonthlyIncome = monthlyIncome;
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Email *"),
                      SizedBox(
                        width: 250,
                        child: CustomTextFieldWidget(
                            errorMessage:
                                _personalInformationValidationText?.email,
                            controller: emailEditingController,
                            onChange: (value) {
                              checkEmailValidationEvent(email: value);
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CustomDropDownButton(
                      selectedValue: selectedWhereHearAboutUs!,
                      values: whereDidYouHearAboutUs,
                      title: "Where did they hear about us?",
                      onChange: (value) {
                        selectedWhereHearAboutUs = value;
                      }),
                  const Spacer(),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    onPressed: () {},
                    child: const Text(
                      "Send",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]);
      }),
    ));
  }

  void checkNameValidationEvent({required String name}) {
    BlocProvider.of<PersonalInformationBloc>(context)
        .add(CheckNameValidationEvent(name: name));
  }

  void checkGovernorateValidationEvent(
      {required DropDownButtonValue governorate}) {
    BlocProvider.of<PersonalInformationBloc>(context)
        .add(CheckGovernorateValidationEvent(governorate: governorate));
  }

  void checkMobileValidationEvent({required String mobile}) {
    BlocProvider.of<PersonalInformationBloc>(context)
        .add(CheckMobileValidationEvent(mobile: mobile));
  }

  void selectEmployTypeEvent({required RadioButtonValue employType}) {
    BlocProvider.of<PersonalInformationBloc>(context)
        .add(SelectEmployTypeEvent(employType: employType));
  }

  void selectBankingObligationsEvent(
      {required RadioButtonValue bankingObligation}) {
    BlocProvider.of<PersonalInformationBloc>(context).add(
        SelectBackingObligationEvent(bankingObligation: bankingObligation));
  }

  void checkCompanyNameValidationEvent({required String companyName}) {
    BlocProvider.of<PersonalInformationBloc>(context)
        .add(CheckCompanyNameValidationEvent(companyName: companyName));
  }

  void checkEmailValidationEvent({required String email}) {
    BlocProvider.of<PersonalInformationBloc>(context)
        .add(CheckEmailValidationEvent(email: email));
  }
}
