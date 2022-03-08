import 'package:equatable/equatable.dart';
import 'package:mobile_flutter/model/cart_model.dart';

abstract class CartState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialCartLoadState extends CartState {}

class SuccesLoadCartState extends CartState {
  List<CartModel> listProducts;

  SuccesLoadCartState(this.listProducts);
}

class SuccesLoadPostCartState extends CartState {
  String status;

  SuccesLoadPostCartState(this.status);
}


class LoadingCartState extends CartState {}

class FailureLoadCartState extends CartState {
  final String errorMessage;

  FailureLoadCartState(this.errorMessage);

  @override
  String toString() {
    return 'FailureLoadProductState{errorMessage: $errorMessage}';
  }
}
