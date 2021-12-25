class ProductModel {
  String id;
  int create_at;
  int updated_at;
  String name;
  String description;
  int price;
  Map<String, dynamic> imagesModel;

  ProductModel(
      {required this.id,
      required this.create_at,
      required this.updated_at,
      required this.name,
      required this.description,
      required this.price,
      required this.imagesModel});

  factory ProductModel.fromJson(Map<String, dynamic> object) {
    return ProductModel(
        id: object['id'],
        create_at: object['created_at'],
        updated_at: object['updated_at'],
        name: object['name'],
        description: object['description'],
        price: object['price'],
        imagesModel: object['main_image']);
  }
}
