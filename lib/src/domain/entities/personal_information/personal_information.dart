import 'package:empowero/src/domain/entities/personal_information/drop_down_button_value.dart';
import 'package:empowero/src/domain/entities/personal_information/radio_button_value.dart';

class PersonalInformation {
  String? id;

  String? name;

  DropDownButtonValue? governorate;

  String? mobile;

  RadioButtonValue? employType;

  RadioButtonValue? bankingObligations;

  String? companyName;

  DropDownButtonValue? monthlyIncome;

  String? email;

  DropDownButtonValue? whereDidYouHearAboutUs;

  PersonalInformation(
      {this.name,
      this.governorate,
      this.mobile,
      this.employType,
      this.bankingObligations,
      this.companyName,
      this.monthlyIncome,
      this.email,
      this.whereDidYouHearAboutUs,
      this.id});
}
