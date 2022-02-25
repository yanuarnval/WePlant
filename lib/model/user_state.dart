import 'package:equatable/equatable.dart';
import 'package:mobile_flutter/model/merchant_model.dart';

abstract class UserState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialUserState extends UserState{

}

class SuccesLoadUserState extends UserState{
  String name;
  String email;
  String photourl;
  SuccesLoadUserState(this.email,this.name,this.photourl);

}

class FailureLoadUserState extends UserState{
  final String errorMessage;

  FailureLoadUserState(this.errorMessage);

  @override
  String toString() {
    return 'FailureLoadProductState{errorMessage: $errorMessage}';
  }
}