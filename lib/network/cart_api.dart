import 'dart:convert';
import 'dart:io';

import 'package:mobile_flutter/model/cart_model.dart';
import 'package:mobile_flutter/model/details_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_flutter/model/user_model.dart';
import 'package:mobile_flutter/shared/url.dart';

class CartApi {
  static const urlProduct = '${Url.url_host}/carts/';
  static const urlCart = '${Url.url_host}/customers/';

  static Future<String> postProductToCart(
      String idProduct, String token, String idCustomer) async {
    final urlId = urlProduct + idCustomer;
    Map<String, dynamic> result;

    final response = await http.post(
      Uri.parse(urlId),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{"product_id": idProduct}),
    );

    if (response.statusCode == 200) {
      result = jsonDecode(response.body);
      return result['data']['product_id'];
    } else {
      final e = response.statusCode;
      throw HttpException('error code $e');
    }
  }

  static Future<List<CartModel>> getProductsfromCart(
      String idCustomer, String token) async {
    final urlId = '$urlCart/$idCustomer/carts';
    Map<String, dynamic> result;

    final response = await http.get(
      Uri.parse(urlId),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      result = jsonDecode(response.body);
      List products=result['data']['products'];
      List<CartModel> product=[];
      for(int i=0;i<products.length;i++){
        product.add(CartModel.fromjson(products[i]));
      }
      return product;
    } else {
      final e = response.statusCode;
      throw HttpException('error code $e');
    }
  }
}
