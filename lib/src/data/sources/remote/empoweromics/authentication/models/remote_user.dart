import 'package:empowero/src/domain/entities/authentication/user.dart';

class RemoteUser extends User {
  final String userId;
  final String email;

  RemoteUser({required this.email, required this.userId})
      : super(userId: userId, email: email);
}
