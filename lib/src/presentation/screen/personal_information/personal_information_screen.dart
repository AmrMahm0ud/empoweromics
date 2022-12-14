import 'package:empowero/src/core/utils/dummy_data.dart';
import 'package:empowero/src/domain/entities/personal_information/drop_down_button_value.dart';
import 'package:empowero/src/domain/entities/personal_information/personal_information.dart';
import 'package:empowero/src/domain/entities/personal_information/personal_information_validation_text.dart';
import 'package:empowero/src/domain/entities/personal_information/radio_button_value.dart';
import 'package:empowero/src/presentation/bloc/personal_information/personal_information_bloc.dart';
import 'package:empowero/src/presentation/bloc/personal_information/personal_information_event.dart';
import 'package:empowero/src/presentation/bloc/personal_information/personal_information_state.dart';
import 'package:empowero/src/presentation/screen/main/main_screen.dart';
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
  PersonalInformation personalInformation = PersonalInformation(
      bankingObligations: bankingObligations.first,
      monthlyIncome: monthlyIncome.first,
      governorate: governorates.first,
      whereDidYouHearAboutUs: whereDidYouHearAboutUs.first);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Apply now "),
      ),
      body: BlocConsumer<PersonalInformationBloc, PersonalInformationState>(
          listener: (context, state) {
        if (state is PersonalInformationValidationState) {
          _personalInformationValidationText =
              state.personalInformationValidationText;
        } else if (state is SelectedEmployTypeState) {
          personalInformation.employType = state.employType;
        } else if (state is SelectedBankingObligationState) {
          personalInformation.bankingObligations = state.bankingObligation;
        } else if (state is SuccessSavePersonalInformationIntoDataBaseState) {
          navigateToMainScreen();
        }
      }, builder: (context, state) {
        return CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, left: 12.0, right: 12.0, bottom: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      "ADIB is here to serve you 24 hours a day. please select the way you want us to assist you and our personnel will be glad to help you out with any queries/questions.",
                      style: TextStyle(wordSpacing: 2)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(child: Text("Name *")),
                      Expanded(
                        child: CustomTextFieldWidget(
                            errorMessage:
                                _personalInformationValidationText?.name,
                            controller: nameEditingController,
                            onChange: (name) {
                              personalInformation.name = name;
                              checkNameValidationEvent(name: name);
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CustomDropDownButton(
                      selectedValue: personalInformation.governorate!,
                      values: governorates,
                      title: "Governorate *",
                      onChange: (governorate) {
                        personalInformation.governorate = governorate;
                        checkGovernorateValidationEvent(
                            governorate: governorate);
                      },
                      errorMessage:
                          _personalInformationValidationText?.governorate),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(child: Text("Mobile *")),
                      Expanded(
                        child: CustomTextFieldWidget(
                            errorMessage:
                                _personalInformationValidationText?.mobile,
                            controller: mobileEditingController,
                            onChange: (value) {
                              personalInformation.mobile = value;
                              checkMobileValidationEvent(mobile: value);
                            },
                            textInputType: TextInputType.phone),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  RadiobuttonSelectionWidget(
                    values: employType,
                    selectedValue: personalInformation.employType,
                    title: "Employed / Self employed",
                    onChanged: (value) {
                      personalInformation.employType = value;
                      selectEmployTypeEvent(employType: value);
                    },
                  ),
                  const SizedBox(height: 10),
                  RadiobuttonSelectionWidget(
                    values: bankingObligations,
                    selectedValue: personalInformation.bankingObligations,
                    title: "Do you have and banking obligation?*",
                    onChanged: (value) {
                      personalInformation.bankingObligations = value;
                      selectBankingObligationsEvent(bankingObligation: value);
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(child: Text("Company name *")),
                      Expanded(
                        child: CustomTextFieldWidget(
                            errorMessage:
                                _personalInformationValidationText?.companyName,
                            controller: companyEditingController,
                            onChange: (value) {
                              personalInformation.companyName = value;
                              checkCompanyNameValidationEvent(
                                  companyName: value);
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CustomDropDownButton(
                    selectedValue: personalInformation.monthlyIncome!,
                    values: monthlyIncome,
                    title: "Monthly income",
                    onChange: (value) {
                      personalInformation.monthlyIncome = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(child: Text("Email *")),
                      Expanded(
                        child: CustomTextFieldWidget(
                            errorMessage:
                                _personalInformationValidationText?.email,
                            controller: emailEditingController,
                            onChange: (value) {
                              personalInformation.email = value;
                              checkEmailValidationEvent(email: value);
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CustomDropDownButton(
                      selectedValue:
                          personalInformation.whereDidYouHearAboutUs!,
                      values: whereDidYouHearAboutUs,
                      title: "Where did they hear about us?",
                      onChange: (value) {
                        personalInformation.whereDidYouHearAboutUs = value;
                      }),
                  const SizedBox(height: 10),
                  const Spacer(),
                  Text("(*) These fields are mandatory to be filled"),
                  const SizedBox(height: 10,),
                  Center(
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                      onPressed: () {
                        sendButtonPressedEvent(
                            personalInformation: personalInformation);
                      },
                      child: const Text(
                        "Send",
                        style: TextStyle(color: Colors.black),
                      ),
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

  void sendButtonPressedEvent(
      {required PersonalInformation personalInformation}) {
    BlocProvider.of<PersonalInformationBloc>(context).add(
        SendPersonalInformationButtonPressedEvent(
            personalInformation: personalInformation));
  }

  Future<void> navigateToMainScreen() async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainScreen()),
    );
  }
}
