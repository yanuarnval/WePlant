import 'dart:convert';

import 'package:mobile_flutter/model/order_model.dart';
import 'package:mobile_flutter/model/product_model.dart';
import 'package:mobile_flutter/shared/url.dart';
import 'package:http/http.dart' as http;

class OrderApi {
  final url = Url.url_host;

  Future<List<OrderModel>> getOrder(String customerId,String token) async {
    final urlOrde0r = url + '/customers/$customerId/orders';
    final request = await http.get(
      Uri.parse(urlOrde0r),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    Map<String, dynamic> body = jsonDecode(request.body);
    print(body);
    if (request.statusCode == 200) {
      List products = body['data']['products'];
      List<OrderModel> model = [];

      for (int i = 0; i < products.length; i++) {
        model.add(OrderModel.fromJson(products[i]));
      }
      return model;
    } else {
      print(body);
      throw (request.statusCode.toString());
    }
  }
}
