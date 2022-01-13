
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class Register extends RegisterEvent{
  String email;
  String password;
  Register(this.email, this.password);
}

