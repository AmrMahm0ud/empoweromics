import 'package:empowero/src/core/resources/image_paths.dart';
import 'package:empowero/src/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:empowero/src/presentation/bloc/authentication/authentication_event.dart';
import 'package:empowero/src/presentation/bloc/authentication/authentication_state.dart';
import 'package:empowero/src/presentation/screen/personal_information/personal_information_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthenticationScreen extends StatefulWidget{
   const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
          if (state is FailAuthenticationState) {
          } else if (state is SuccessAuthenticateState) {
            navigateToPersonalInformationScreen();
          }
        }, builder: (context, state) {
          return _buildScreen();
        }),
      ),
    );
  }

  Widget _buildScreen() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => authenticateWithGoogleEvent(),
              icon: SvgPicture.asset(ImagePaths.googleIcon),
              label: const Text(
                "Sign in with google",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => authenticateWithFacebookEvent(),
              icon: SvgPicture.asset(ImagePaths.facebookIcon,
                  color: Colors.white, width: 25, height: 25),
              label: const Text(
                "Sign in with facebook",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            )
          ],
        ),
      ),
    );
  }

  void authenticateWithGoogleEvent() {
    BlocProvider.of<AuthenticationBloc>(context)
        .add(AuthenticateWithGoogleEvent());
  }

  void authenticateWithFacebookEvent() {
    BlocProvider.of<AuthenticationBloc>(context)
        .add(AuthenticateWithFacebookEvent());
  }

  Future<void> navigateToPersonalInformationScreen() async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const PersonalInformationScreen()),
    );
  }
}
