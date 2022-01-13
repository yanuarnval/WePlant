import 'package:equatable/equatable.dart';
import 'package:mobile_flutter/model/merchant_model.dart';

abstract class RegisterAuthState {

}

class InitialRegisterAuthState extends RegisterAuthState {

}

class LoadingRegisiterAuthState extends RegisterAuthState {}

class SuccesLoadRegisterAuthState extends RegisterAuthState {
  final String token;
  final String message;

  SuccesLoadRegisterAuthState(this.token, this.message);

  @override
  String toString() {
    return 'SuccessLoadAllProductState{listProfiles: $token, message: $message}';
  }
}

class FailureLoadRegisterAuthState extends RegisterAuthState {
  final String errorMessage;

  FailureLoadRegisterAuthState(this.errorMessage);

  @override
  String toString() {
    return 'FailureLoadProductState{errorMessage: $errorMessage}';
  }
}
