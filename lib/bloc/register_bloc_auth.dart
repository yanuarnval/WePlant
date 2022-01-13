import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile_flutter/model/register_auth_state.dart';
import 'package:mobile_flutter/model/Register_event.dart';

class RegisterBlocAuth extends Bloc<RegisterEvent, RegisterAuthState> {
  RegisterBlocAuth() : super(InitialRegisterAuthState()) {
    on<RegisterEvent>((event, emit) async {
      if (event is Register) {
        try {
          print(event.email+event.password);
          UserCredential reg = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(SuccesLoadRegisterAuthState(reg.user!.uid, 'message'));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
            emit(FailureLoadRegisterAuthState(
                "The password provided is too weak"));
          } else if (e.code == 'email-already-in-use') {
            print('user: The account already exists for that email.');
            emit(FailureLoadRegisterAuthState(
                "The account already exists for that email"));
          }
        } catch (e) {
          emit(FailureLoadRegisterAuthState('errorMessage $e'));
        }

      }
    });
  }
}
