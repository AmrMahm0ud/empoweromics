import 'package:empowero/src/di/injector.dart';
import 'package:empowero/src/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:empowero/src/presentation/bloc/personal_information/personal_information_bloc.dart';

Future<void> initializeBlocDependencies() async {
  injector.registerFactory<AuthenticationBloc>(() => AuthenticationBloc(
      authenticateWithGoogleUseCase: injector(),
      authenticateWithFacebookUseCase: injector()));

  injector.registerFactory<PersonalInformationBloc>(() =>
      PersonalInformationBloc(
          validateNameUseCase: injector(),
          validateGovernorateUseCase: injector(),
          validateMobileNumberUseCase: injector(),
          validateCompanyNameUseCase: injector(),
          validateEmailUseCase: injector()));
}
