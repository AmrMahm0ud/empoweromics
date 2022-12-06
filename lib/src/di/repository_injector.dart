import 'package:empowero/src/data/repositories/authentication/authentication_repository_implementation.dart';
import 'package:empowero/src/domain/repositories/authentication/authentication.dart';

import 'package:empowero/src/di/injector.dart';

Future<void> initializeRepositoryDependencies() async {
  injector.registerFactory<AuthenticationRepositories>(() =>
      AuthenticationRepositoryImplementation(
          authenticationServices: injector()));
}
