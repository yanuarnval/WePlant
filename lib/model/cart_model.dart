class CartModel {
  String name;
  int quantity;
  int price;

  CartModel(this.name, this.quantity, this.price);

  factory CartModel.fromjson(Map<String, dynamic> json) {
    return CartModel(json['name'], json['quantity'], json['price']);
  }
}
