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
    Map<String, dynamic> result = {};
    final response = await http.post(
      Uri.parse(urlId),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{"product_id": idProduct}),
    );
    result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(response.statusCode);
      return result['status'];
    } else {
      throw HttpException(result['data']);
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
      List products = [];
      List<CartModel> product = [];
      print(result['data']['products']);
      if (result['data']['products'] != null) {
        products = result['data']['products'];
        for (int i = 0; i < products.length; i++) {
          product.add(CartModel.fromjson(products[i]));
        }
        return product;
      }
      return product;
    } else {
      final e = response.statusCode;
      throw HttpException('error code $e');
    }
  }

  Future<String> removeProductFromCart(
      String customerId, String productId, String token) async {
    final url =
        Uri.parse(urlProduct + '$customerId' + '/products' + '/$productId');
    final response = await http.delete(url, headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return 'Cart Products remove';
    } else {
      throw (response.statusCode.toString());
    }
  }

  Future<int> updateQuantityProduct(
      String customerId, String productId, String token, int quantity) async {
    final url =
        Uri.parse(urlProduct + '$customerId' + '/products' + '/$productId');
    final response = await http.patch(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'quantity': quantity}));
    if (response.statusCode == 200) {
      final r= jsonDecode(response.body);
      return r['data']['quantity'];
    } else {
      throw (response.statusCode.toString());
    }
  }
}
