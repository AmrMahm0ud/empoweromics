import 'package:empowero/src/data/sources/local/empoweromics/database/personal_information_database_services/personal_information_database_services.dart';
import 'package:empowero/src/data/sources/remote/empoweromics/authentication/authentication_services.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDataDependencies() async {
  injector.registerFactory<AuthenticationServices>(
      () => AuthenticationServicesImplementation());
  injector.registerFactory<PersonalInformationDatabaseServices>(
      () => PersonalInformationDatabaseServicesImplementation());
}
