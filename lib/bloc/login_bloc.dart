import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/model/Login_state_model.dart';
import 'package:mobile_flutter/model/login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginAuthState> {
  LoginBloc() : super(InitialLoginAuthState()) {
    on<LoginEvent>((event, emit) async {
      if(event is Login){
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
              email: event.email,
              password: event.password);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
          }
        }
      }
    });
  }
}
