import 'package:empowero/src/domain/entities/personal_information/drop_down_button_value.dart';
import 'package:empowero/src/domain/entities/personal_information/radio_button_value.dart';

class PersonalInformation {
  final String id;

  final String name;

  final DropDownButtonValue governorate;

  final String mobile;

  final RadioButtonValue employType;

  final RadioButtonValue bankingObligations;

  final String companyName;

  final DropDownButtonValue monthlyIncome;

  final String email;

  final DropDownButtonValue whereDidYouHearAboutUs;

  PersonalInformation(
      {required this.name,
      required this.governorate,
      required this.mobile,
      required this.employType,
      required this.bankingObligations,
      required this.companyName,
      required this.monthlyIncome,
      required this.email,
      required this.whereDidYouHearAboutUs,
      required this.id});
}
