import 'package:empowero/src/di/repository_injector.dart';
import 'package:empowero/src/di/use_case_injector.dart';
import 'package:get_it/get_it.dart';

import 'bloc_injector.dart';
import 'data_layer_injector.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  await initializeDataDependencies();
  await initializeRepositoryDependencies();
  await initializeUseCaseDependencies();
  await initializeBlocDependencies();
}
