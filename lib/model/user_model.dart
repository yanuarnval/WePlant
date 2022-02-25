class UserModel {
  String token;
  String idCustomer;

  UserModel(this.token, this.idCustomer);

  factory UserModel.jsonFrom(Map<String, dynamic> json) {
    return UserModel(json['token'], json['id']);
  }
}
