class CartModel {
  String product_id;
  String img;
  String name;
  int quantity;
  int price;

  CartModel(this.name, this.quantity, this.price, this.img,this.product_id);

  factory CartModel.fromjson(Map<String, dynamic> json) {
    return CartModel(json['name'], json['quantity'], json['price'],
        json['main_image']['url'],json['product_id']);
  }
}
