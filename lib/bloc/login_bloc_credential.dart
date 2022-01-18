import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile_flutter/model/Login_state_model.dart';
import 'package:mobile_flutter/model/login_event.dart';

class LoginBlocCredential extends Bloc<LoginEvent, LoginAuthState> {
  LoginBlocCredential() : super(InitialLoginAuthState()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginWithCredential) {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        emit(SuccesLoadLoginAuthState('token', 'message'));
      }
    });
  }
}
