import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticateWithGoogleEvent extends AuthenticationEvent {}

class AuthenticateWithFacebookEvent extends AuthenticationEvent {}
