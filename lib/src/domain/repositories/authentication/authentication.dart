import 'package:empowero/src/domain/entities/authentication/user.dart';

abstract class AuthenticationRepositories {
  Future<User> authenticateWithGoogle();

  Future<User> authenticateWithFacebook();
}
