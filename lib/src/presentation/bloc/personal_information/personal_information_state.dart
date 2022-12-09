import 'package:empowero/src/domain/entities/personal_information/personal_information_validation_text.dart';
import 'package:empowero/src/domain/entities/personal_information/radio_button_value.dart';
import 'package:equatable/equatable.dart';

abstract class PersonalInformationState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class InitialPersonalInformationState extends PersonalInformationState {}

class PersonalInformationValidationState extends PersonalInformationState {
  final PersonalInformationValidationText personalInformationValidationText;

  PersonalInformationValidationState(
      {required this.personalInformationValidationText});
}

class PersonalInformationValidFormState extends PersonalInformationState {}

class FailSavePersonalInformationIntoDataBaseState
    extends PersonalInformationState {}

class SuccessSavePersonalInformationIntoDataBaseState
    extends PersonalInformationState {}

class SelectedEmployTypeState extends PersonalInformationState {
  final RadioButtonValue employType;

  SelectedEmployTypeState({required this.employType});
}

class SelectedBankingObligationState extends PersonalInformationState {
  final RadioButtonValue bankingObligation;

  SelectedBankingObligationState({required this.bankingObligation});
}
