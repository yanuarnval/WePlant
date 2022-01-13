class MerchantModel {
  String id;
  int created_at;
  int updated_at;
  String email;
  String name;
  String phone;
  Map<String, dynamic> main_image;
  Map<String, dynamic> address;

  MerchantModel(this.id, this.created_at, this.updated_at, this.email,
      this.name, this.phone, this.main_image, this.address);

  factory MerchantModel.fromJson(Map<String, dynamic> data) {
    return MerchantModel(
        data['id'],
        data['created_at'],
        data['updated_at'],
        data['email'],
        data['name'],
        data['phone'],
        data['main_image'],
        data['address']);
  }
}
