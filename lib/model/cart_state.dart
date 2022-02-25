import 'package:equatable/equatable.dart';
import 'package:mobile_flutter/model/merchant_model.dart';

abstract class CartState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialCartLoadState extends CartState {}

class SuccesLoadCartState extends CartState {

}

class LoadingCartState extends CartState{

}

class FailureLoadCartState extends CartState {
  final String errorMessage;

  FailureLoadCartState(this.errorMessage);

  @override
  String toString() {
    return 'FailureLoadProductState{errorMessage: $errorMessage}';
  }
}
