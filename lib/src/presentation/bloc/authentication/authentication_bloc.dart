import 'package:empowero/src/domain/entities/authentication/user.dart';
import 'package:empowero/src/domain/usecase/authentication/authenticate_with_facebook_usecase.dart';
import 'package:empowero/src/domain/usecase/authentication/authenticate_with_google_usecase.dart';
import 'package:empowero/src/presentation/bloc/authentication/authentication_event.dart';
import 'package:empowero/src/presentation/bloc/authentication/authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticateWithFacebookUseCase authenticateWithFacebookUseCase;

  final AuthenticateWithGoogleUseCase authenticateWithGoogleUseCase;

  AuthenticationBloc(
      {required this.authenticateWithGoogleUseCase,
      required this.authenticateWithFacebookUseCase})
      : super(InitialAuthenticationState()) {
    on<AuthenticateWithGoogleEvent>(_onAuthenticateWithGoogleEvent);
    on<AuthenticateWithFacebookEvent>(_onAuthenticateWithFacebookEvent);
  }

  Future<void> _onAuthenticateWithGoogleEvent(AuthenticateWithGoogleEvent event,
      Emitter<AuthenticationState> emit) async {
    emit(ShowAuthenticationLoaderState());

    User user = await authenticateWithGoogleUseCase();

    if (user.userId == "") {
      emit(FailAuthenticationState());
    } else {
      emit(SuccessAuthenticateState());
    }
    emit(HideAuthenticationLoaderState());
  }

  Future<void> _onAuthenticateWithFacebookEvent(
      AuthenticateWithFacebookEvent event,
      Emitter<AuthenticationState> emit) async {
    emit(ShowAuthenticationLoaderState());
    User user = await authenticateWithFacebookUseCase();
    if (user.userId == "") {
      emit(FailAuthenticationState());
    } else {
      emit(SuccessAuthenticateState());
    }
    emit(HideAuthenticationLoaderState());
  }
}
