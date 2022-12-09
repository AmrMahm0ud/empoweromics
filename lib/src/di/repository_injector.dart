import 'package:empowero/src/data/repositories/authentication/authentication_repository_implementation.dart';
import 'package:empowero/src/data/repositories/personal_information/personal_information_repositorey_implementation.dart';
import 'package:empowero/src/di/injector.dart';
import 'package:empowero/src/domain/repositories/authentication/authentication.dart';
import 'package:empowero/src/domain/repositories/personal_information/personal_information_repository.dart';

Future<void> initializeRepositoryDependencies() async {
  injector.registerFactory<AuthenticationRepositories>(() =>
      AuthenticationRepositoryImplementation(
          authenticationServices: injector()));
  injector.registerFactory<PersonalInformationRepository>(() =>
      PersonalInformationRepositoryImplementation(
          personalInformationDatabaseServices: injector()));
}
