import 'package:equatable/equatable.dart';
import 'package:mobile_flutter/model/merchant_model.dart';

abstract class RegisterAuthState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialRegisterAuthState extends RegisterAuthState {}

class LoadingRegisiterAuthState extends RegisterAuthState {}

class SuccesLoadRegisterAuthState extends RegisterAuthState {
  SuccesLoadRegisterAuthState();
}

class FailureLoadRegisterAuthState extends RegisterAuthState {
  final String errorMessage;

  FailureLoadRegisterAuthState(this.errorMessage);

  @override
  String toString() {
    return 'FailureLoadProductState{errorMessage: $errorMessage}';
  }
}
