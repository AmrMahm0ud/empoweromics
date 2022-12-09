import 'package:empowero/src/di/injector.dart';
import 'package:empowero/src/domain/usecase/authentication/authenticate_with_facebook_usecase.dart';
import 'package:empowero/src/domain/usecase/authentication/authenticate_with_google_usecase.dart';
import 'package:empowero/src/domain/usecase/personal_information/save_personal_information_into_local_database_use_case.dart';
import 'package:empowero/src/domain/usecase/personal_information/validate_company_name_use_case.dart';
import 'package:empowero/src/domain/usecase/personal_information/validate_email_use_case.dart';
import 'package:empowero/src/domain/usecase/personal_information/validate_governorate_use_case.dart';
import 'package:empowero/src/domain/usecase/personal_information/validate_mobile_number_use_case.dart';
import 'package:empowero/src/domain/usecase/personal_information/validate_name_use_case.dart';

Future<void> initializeUseCaseDependencies() async {
  injector.registerFactory<AuthenticateWithGoogleUseCase>(() =>
      AuthenticateWithGoogleUseCase(
          socialAuthenticationRepositories: injector()));

  injector.registerFactory<AuthenticateWithFacebookUseCase>(() =>
      AuthenticateWithFacebookUseCase(
          socialAuthenticationRepositories: injector()));
  injector.registerFactory<ValidateNameUseCase>(() => ValidateNameUseCase());
  injector.registerFactory<ValidateGovernorateUseCase>(
      () => ValidateGovernorateUseCase());
  injector.registerFactory<ValidateMobileNumberUseCase>(
      () => ValidateMobileNumberUseCase());
  injector.registerFactory<ValidateCompanyNameUseCase>(
      () => ValidateCompanyNameUseCase());
  injector.registerFactory<ValidateEmailUseCase>(() => ValidateEmailUseCase());
  injector.registerFactory<SavePersonalInformationIntoDataBaseUseCase>(() =>
      SavePersonalInformationIntoDataBaseUseCase(
          personalInformationRepository: injector()));
}
