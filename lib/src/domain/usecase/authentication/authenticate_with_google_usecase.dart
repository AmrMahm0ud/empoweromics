import 'package:empowero/src/domain/entities/authentication/user.dart';
import 'package:empowero/src/domain/repositories/authentication/authentication.dart';

class AuthenticateWithGoogleUseCase {
  final AuthenticationRepositories? socialAuthenticationRepositories;

  AuthenticateWithGoogleUseCase({this.socialAuthenticationRepositories});

  Future<User> call() async {
    return socialAuthenticationRepositories!.authenticateWithGoogle();
  }
}
