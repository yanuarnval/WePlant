import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/model/register_auth_state.dart';
import 'package:mobile_flutter/model/Register_event.dart';
import 'package:mobile_flutter/network/user_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterBlocAuth extends Bloc<RegisterEvent, RegisterAuthState> {
  RegisterBlocAuth() : super(InitialRegisterAuthState()) {
    on<RegisterEvent>((event, emit) async {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      if (event is Register) {
        emit(LoadingRegisiterAuthState());
        try {
          //login backend
          SharedPreferences pref = await SharedPreferences.getInstance();
          await UserApi()
              .userRegister(
                  event.email, event.name, event.password, event.phone)
              .then((user) async {
            final token = user.token;
            final idCustomer = user.idCustomer;
            if (token.isNotEmpty) {
              await pref.setString('token', token);
              await pref.setString('idCustomer', idCustomer);
            }
            //add user to firestore
            await users.add({
              'email': event.email,
              'name': event.name,
              'photourl': '',
              'phone': event.phone,
              'chatrooms': []
            }).then((value) async {
              await pref.setString('uid', value.id);
              print('erererer');
              emit(SuccesLoadRegisterAuthState());
            }).catchError((onError) => print('error $onError'));
          });
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
          print(e);
          emit(FailureLoadRegisterAuthState('errorMessage $e'));
        }
      }
    });
  }
}
