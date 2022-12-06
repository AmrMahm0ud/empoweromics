import 'package:empowero/src/domain/entities/authentication/user.dart';
import 'package:empowero/src/domain/repositories/authentication/authentication.dart';

class AuthenticateWithFacebookUseCase {
  final AuthenticationRepositories? socialAuthenticationRepositories;

  AuthenticateWithFacebookUseCase({this.socialAuthenticationRepositories});

  Future<User> call() async {
    return socialAuthenticationRepositories!.authenticateWithFacebook();
  }
}
