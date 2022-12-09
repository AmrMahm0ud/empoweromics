import 'package:empowero/src/domain/entities/personal_information/personal_information.dart';
import 'package:empowero/src/domain/entities/personal_information/personal_information_validation_text.dart';
import 'package:empowero/src/domain/usecase/personal_information/save_personal_information_into_local_database_use_case.dart';
import 'package:empowero/src/domain/usecase/personal_information/validate_company_name_use_case.dart';
import 'package:empowero/src/domain/usecase/personal_information/validate_email_use_case.dart';
import 'package:empowero/src/domain/usecase/personal_information/validate_governorate_use_case.dart';
import 'package:empowero/src/domain/usecase/personal_information/validate_mobile_number_use_case.dart';
import 'package:empowero/src/domain/usecase/personal_information/validate_name_use_case.dart';
import 'package:empowero/src/presentation/bloc/personal_information/personal_information_event.dart';
import 'package:empowero/src/presentation/bloc/personal_information/personal_information_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInformationBloc
    extends Bloc<PersonalInformationEvent, PersonalInformationState> {
  final ValidateNameUseCase validateNameUseCase;
  final ValidateGovernorateUseCase validateGovernorateUseCase;
  final ValidateMobileNumberUseCase validateMobileNumberUseCase;
  final ValidateCompanyNameUseCase validateCompanyNameUseCase;
  final ValidateEmailUseCase validateEmailUseCase;
  final SavePersonalInformationIntoDataBaseUseCase
      savePersonalInformationIntoDataBaseUseCase;

  PersonalInformationBloc(
      {required this.validateNameUseCase,
      required this.validateGovernorateUseCase,
      required this.validateMobileNumberUseCase,
      required this.validateCompanyNameUseCase,
      required this.validateEmailUseCase,
      required this.savePersonalInformationIntoDataBaseUseCase})
      : super(InitialPersonalInformationState()) {
    on<StorePersonalInformationInDataBaseEvent>(
        _onStorePersonalInformationInDataBaseEvent);
    on<CheckNameValidationEvent>(_onCheckNameValidationEvent);
    on<CheckGovernorateValidationEvent>(_onCheckGovernorateValidationEvent);
    on<CheckMobileValidationEvent>(_onCheckMobileValidationEvent);
    on<SelectEmployTypeEvent>(_onSelectEmployTypeEvent);
    on<SelectBackingObligationEvent>(_onSelectBackingObligationEvent);
    on<CheckCompanyNameValidationEvent>(_onCheckCompanyNameValidationEvent);
    on<CheckEmailValidationEvent>(_onCheckEmailValidationEvent);
    on<SendPersonalInformationButtonPressedEvent>(
        _onSendPersonalInformationButtonPressedEvent);
  }

  PersonalInformationValidationText personalInformationValidationText =
      PersonalInformationValidationText();

  void _onCheckNameValidationEvent(
      CheckNameValidationEvent event, Emitter<PersonalInformationState> emit) {
    bool validation = validateNameUseCase(name: event.name);
    if (validation == true) {
      personalInformationValidationText.name = "Name filed is required";
    } else {
      personalInformationValidationText.name = null;
    }
    emit(PersonalInformationValidationState(
        personalInformationValidationText: personalInformationValidationText));
  }

  void _onCheckGovernorateValidationEvent(CheckGovernorateValidationEvent event,
      Emitter<PersonalInformationState> emit) {
    if (validateGovernorateUseCase(governorate: event.governorate) == true) {
      personalInformationValidationText.governorate = "Please select a value";
    } else {
      personalInformationValidationText.governorate = null;
    }
    emit(PersonalInformationValidationState(
        personalInformationValidationText: personalInformationValidationText));
  }

  void _onCheckMobileValidationEvent(CheckMobileValidationEvent event,
      Emitter<PersonalInformationState> emit) {
    if (validateMobileNumberUseCase(mobileNumber: event.mobile) == true) {
      personalInformationValidationText.mobile =
          "Mobile Number filed is required";
    } else {
      personalInformationValidationText.mobile = null;
    }
    emit(PersonalInformationValidationState(
        personalInformationValidationText: personalInformationValidationText));
  }

  void _onSelectEmployTypeEvent(
      SelectEmployTypeEvent event, Emitter<PersonalInformationState> emit) {
    emit(SelectedEmployTypeState(employType: event.employType));
  }

  void _onSelectBackingObligationEvent(SelectBackingObligationEvent event,
      Emitter<PersonalInformationState> emit) {
    emit(SelectedBankingObligationState(
        bankingObligation: event.bankingObligation));
  }

  void _onCheckCompanyNameValidationEvent(CheckCompanyNameValidationEvent event,
      Emitter<PersonalInformationState> emit) {
    if (validateCompanyNameUseCase(companyName: event.companyName) == true) {
      personalInformationValidationText.companyName =
          "Company name filed is required";
    } else {
      personalInformationValidationText.companyName = null;
    }
    emit(PersonalInformationValidationState(
        personalInformationValidationText: personalInformationValidationText));
  }

  void _onCheckEmailValidationEvent(
      CheckEmailValidationEvent event, Emitter<PersonalInformationState> emit) {
    if (validateEmailUseCase(email: event.email) == true) {
      personalInformationValidationText.email = "Email filed is required";
    } else {
      personalInformationValidationText.email = null;
    }
    emit(PersonalInformationValidationState(
        personalInformationValidationText: personalInformationValidationText));
  }

  void _onSendPersonalInformationButtonPressedEvent(
      SendPersonalInformationButtonPressedEvent event,
      Emitter<PersonalInformationState> emit) {
    add(CheckNameValidationEvent(name: event.personalInformation.name ?? ""));
    add(CheckGovernorateValidationEvent(
        governorate: event.personalInformation.governorate!));
    add(CheckMobileValidationEvent(
        mobile: event.personalInformation.mobile ?? ""));
    add(CheckCompanyNameValidationEvent(
        companyName: event.personalInformation.companyName ?? ""));
    add(CheckEmailValidationEvent(
        email: event.personalInformation.email ?? ""));

    if (personalInformationValidForm(
        personalInformation: event.personalInformation)) {
      add(StorePersonalInformationInDataBaseEvent(
          personalInformation: event.personalInformation));
    }
  }

  Future<void> _onStorePersonalInformationInDataBaseEvent(
      StorePersonalInformationInDataBaseEvent event,
      Emitter<PersonalInformationState> emit) async {
    await savePersonalInformationIntoDataBaseUseCase(
        personalInformation: event.personalInformation);
  }

  bool personalInformationValidForm(
      {required PersonalInformation personalInformation}) {
    if (personalInformationValidationText.name == null &&
        personalInformationValidationText.governorate == null &&
        personalInformationValidationText.mobile == null &&
        personalInformationValidationText.companyName == null &&
        personalInformationValidationText.email == null) {
      return true;
    }
    return false;
  }
}
