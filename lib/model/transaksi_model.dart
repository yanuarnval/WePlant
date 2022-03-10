import 'package:mobile_flutter/model/product_model.dart';

class TransaksiModel {
  String id;
  String created_at;
  String updated_at;
  String qr_code;
  String status;
  int total_price;
  List products;
  Map<String, dynamic> address;

  TransaksiModel(this.id, this.created_at, this.updated_at, this.qr_code,
      this.status, this.total_price, this.products, this.address);

  factory TransaksiModel.fromJson(Map<String, dynamic> json) {
    return TransaksiModel(
      json['id'],
      DateTime.fromMillisecondsSinceEpoch(json['created_at']).toString(),
      DateTime.fromMillisecondsSinceEpoch(json['updated_at']).toString(),
      json['qr_code'],
      json['status'],
      json['total_price'],
      json['products'],
      json['address'],
    );
  }
}
