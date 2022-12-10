import 'package:empowero/src/data/sources/remote/empoweromics/authentication/models/remote_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthenticationServices {
  Future<RemoteUser> authenticateWithGoogle();

  Future<RemoteUser> authenticateWithFacebook();
}

class AuthenticationServicesImplementation extends AuthenticationServices {
  @override
  Future<RemoteUser> authenticateWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult =
        await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final userData = await FacebookAuth.instance.getUserData();

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

    RemoteUser remoteUser =
        RemoteUser(email: userData['email'], userId: userData['id']);

    return remoteUser;
  }

  @override
  Future<RemoteUser> authenticateWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // // Create a new credential
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth.accessToken,
    //   idToken: googleAuth.idToken,
    // );

    RemoteUser remoteUser =
        RemoteUser(email: googleUser.email, userId: googleUser.id);

    return remoteUser;
  }
}
