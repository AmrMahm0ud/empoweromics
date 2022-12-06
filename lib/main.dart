import 'package:empowero/src/config/theme/theme_manager.dart';
import 'package:empowero/src/di/injector.dart';
import 'package:empowero/src/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:empowero/src/presentation/screen/authentication/authentication_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(create: (context) => injector())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Empoweromics',
        theme: getApplicationTheme(),
        home: const AuthenticationScreen(),
      ),
    );
  }
}
