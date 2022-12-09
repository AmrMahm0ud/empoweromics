import 'package:empowero/src/config/theme/theme_manager.dart';
import 'package:empowero/src/data/sources/local/empoweromics/database/personal_information_database_services/models/local_drop_down_button_value.dart';
import 'package:empowero/src/data/sources/local/empoweromics/database/personal_information_database_services/models/local_personal_information.dart';
import 'package:empowero/src/data/sources/local/empoweromics/database/personal_information_database_services/models/local_radio_button_values.dart';
import 'package:empowero/src/di/injector.dart';
import 'package:empowero/src/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:empowero/src/presentation/bloc/personal_information/personal_information_bloc.dart';
import 'package:empowero/src/presentation/screen/main/installment_calculator/installment_calculator_screen.dart';
import 'package:empowero/src/presentation/screen/personal_information/personal_information_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDependencies();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(LocalPersonalInformationAdapter());
  Hive.registerAdapter(LocalDropDownButtonValueAdapter());
  Hive.registerAdapter(LocalRadioButtonValuesAdapter());
  await Hive.openBox<LocalPersonalInformation>('personal_information_table');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(create: (context) => injector()),
        BlocProvider<PersonalInformationBloc>(create: (context) => injector())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Empoweromics',
        theme: getApplicationTheme(),
        home: const InstallmentCalculatorScreen(),
      ),
    );
  }
}
