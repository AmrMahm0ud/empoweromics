import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialAuthenticationState extends AuthenticationState {}

class SuccessAuthenticateState extends AuthenticationState {}

class FailAuthenticationState extends AuthenticationState {}

class NetworkErrorAuthenticationState extends AuthenticationState {}

class ShowAuthenticationLoaderState extends AuthenticationState {}

class HideAuthenticationLoaderState extends AuthenticationState {}
