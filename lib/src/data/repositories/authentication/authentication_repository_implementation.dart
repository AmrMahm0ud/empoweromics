import 'package:empowero/src/data/sources/remote/empoweromics/authentication/authentication_services.dart';
import 'package:empowero/src/domain/entities/authentication/user.dart';
import 'package:empowero/src/domain/repositories/authentication/authentication.dart';

class AuthenticationRepositoryImplementation
    extends AuthenticationRepositories {
  AuthenticationServices authenticationServices;

  AuthenticationRepositoryImplementation(
      {required this.authenticationServices});

  @override
  Future<User> authenticateWithFacebook() async {
    User user = await authenticationServices.authenticateWithFacebook();
    return user;
  }

  @override
  Future<User> authenticateWithGoogle() async {
    User user = await authenticationServices.authenticateWithGoogle();
    return user;
  }
}
