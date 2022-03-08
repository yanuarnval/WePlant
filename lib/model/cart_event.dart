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

class RemoveProductFromCart extends CartEvent{
  String productId;

  RemoveProductFromCart(this.productId);
}

class PlusCartQuantity extends CartEvent{
  int value;
  String productId;
  PlusCartQuantity(this.value,this.productId);
}

class MinusCartQuantity extends CartEvent{
  int value;
  String productId;
  MinusCartQuantity(this.value,this.productId);
}
