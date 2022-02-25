
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class Register extends RegisterEvent{
  String email;
  String password;
  String name;
  String phone;
  Register(this.email, this.password,this.name,this.phone);
}

class RegisterWithCredential extends RegisterEvent{

}
