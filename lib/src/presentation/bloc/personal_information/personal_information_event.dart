import 'package:empowero/src/domain/entities/personal_information/drop_down_button_value.dart';
import 'package:empowero/src/domain/entities/personal_information/radio_button_value.dart';
import 'package:equatable/equatable.dart';

abstract class PersonalInformationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StorePersonalInformationInDataBaseEvent extends PersonalInformationEvent {
}

class CheckNameValidationEvent extends PersonalInformationEvent {
  final String name;

  CheckNameValidationEvent({required this.name});
}

class CheckMobileValidationEvent extends PersonalInformationEvent {
  final String mobile;

  CheckMobileValidationEvent({required this.mobile});
}

class CheckGovernorateValidationEvent extends PersonalInformationEvent {
  final DropDownButtonValue governorate;

  CheckGovernorateValidationEvent({required this.governorate});
}

class CheckBankObligationValidationEvent extends PersonalInformationEvent {
  final RadioButtonValue bankObligation;

  CheckBankObligationValidationEvent({required this.bankObligation});
}

class CheckCompanyNameValidationEvent extends PersonalInformationEvent {
  final String companyName;

  CheckCompanyNameValidationEvent({required this.companyName});
}

class CheckMonthlyIncomeValidationEvent extends PersonalInformationEvent {
  final DropDownButtonValue monthlyIncome;

  CheckMonthlyIncomeValidationEvent({required this.monthlyIncome});
}

class CheckEmailValidationEvent extends PersonalInformationEvent {
  final String email;

  CheckEmailValidationEvent({required this.email});
}

class CheckWhereHearAboutUsValidationEvent extends PersonalInformationEvent {
  final DropDownButtonValue whereHearAboutUsAnswer;

  CheckWhereHearAboutUsValidationEvent({required this.whereHearAboutUsAnswer});
}

class SelectEmployTypeEvent extends PersonalInformationEvent {
  final RadioButtonValue employType;

  SelectEmployTypeEvent({required this.employType});
}

class SelectBackingObligationEvent extends PersonalInformationEvent {
  final RadioButtonValue bankingObligation;

  SelectBackingObligationEvent({required this.bankingObligation});
}
