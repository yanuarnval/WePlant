import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddProductToCart extends CartEvent {
  String idProduct;

  AddProductToCart(this.idProduct);
}

class GetProductsFromCart extends CartEvent{

}
