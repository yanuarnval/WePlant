import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/model/Login_state_model.dart';
import 'package:mobile_flutter/model/login_event.dart';
import 'package:mobile_flutter/network/user_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginAuthState> {
  LoginBloc() : super(InitialLoginAuthState()) {
    on<LoginEvent>((event, emit) async {
      final users = FirebaseFirestore.instance.collection('users');
      QuerySnapshot<Map<String, dynamic>> userList = await users.get();
      if (event is Login) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        try {
          emit(LoadingLoginAuthState());
          await UserApi()
              .userLogin(event.email, event.password)
              .then((value) async{
            final token = value.token;
            final idCustomer = value.idCustomer;
            if (token.isNotEmpty) {
              await pref.setString('token', token);
              await pref.setString('idCustomer', idCustomer);
            }
            for (int i = 0; i < userList.docs.length; i++) {
              if (userList.docs
                  .elementAt(i)
                  .data()
                  .containsValue(event.email)) {
                emit(SuccesLoadLoginAuthState(
                    userList.docs
                        .elementAt(i)
                        .id));
              }
            }
          });
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(FailureLoadLoginAuthState('No user found for that email.'));
          } else if (e.code == 'wrong-password') {
            emit(FailureLoadLoginAuthState('Wrong password'));
          }
        }
      }
    });
  }
}
