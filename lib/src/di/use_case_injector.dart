import 'package:empowero/src/di/injector.dart';
import 'package:empowero/src/domain/usecase/authentication/authenticate_with_facebook_usecase.dart';
import 'package:empowero/src/domain/usecase/authentication/authenticate_with_google_usecase.dart';

Future<void> initializeUseCaseDependencies() async {
  injector.registerFactory<AuthenticateWithGoogleUseCase>(() =>
      AuthenticateWithGoogleUseCase(
          socialAuthenticationRepositories: injector()));

  injector.registerFactory<AuthenticateWithFacebookUseCase>(() =>
      AuthenticateWithFacebookUseCase(
          socialAuthenticationRepositories: injector()));
}
