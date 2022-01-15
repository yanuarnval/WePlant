import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class Login extends LoginEvent {
  final String email;
  final String password;

  Login(this.email, this.password);
}
