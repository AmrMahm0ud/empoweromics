import 'package:empowero/src/di/injector.dart';
import 'package:empowero/src/presentation/bloc/authentication/authentication_bloc.dart';

Future<void> initializeBlocDependencies() async {
  injector.registerFactory<AuthenticationBloc>(() => AuthenticationBloc(
      authenticateWithGoogleUseCase: injector(),
      authenticateWithFacebookUseCase: injector()));
}
