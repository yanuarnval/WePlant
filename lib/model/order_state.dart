import 'package:equatable/equatable.dart';
import 'package:mobile_flutter/model/cart_model.dart';
import 'package:mobile_flutter/model/product_model.dart';

import 'order_model.dart';

abstract class OrderState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialOrderLoadState extends OrderState {}

class SuccesLoadOrderState extends OrderState {
  List<OrderModel> listProducts;

  SuccesLoadOrderState(this.listProducts);
}

class LoadingOrderState extends OrderState {}

class FailureLoadOrderState extends OrderState {
  final String errorMessage;

  FailureLoadOrderState(this.errorMessage);

  @override
  String toString() {
    return 'FailureLoadProductState{errorMessage: $errorMessage}';
  }
}
