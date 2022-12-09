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
    return await authenticationServices.authenticateWithFacebook();
  }

  @override
  Future<User> authenticateWithGoogle() async {
    return await authenticationServices.authenticateWithGoogle();
  }
}
