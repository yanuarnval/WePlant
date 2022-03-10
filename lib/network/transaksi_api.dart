import 'dart:convert';

import 'package:mobile_flutter/model/transaksi_model.dart';
import 'package:mobile_flutter/shared/url.dart';
import 'package:http/http.dart' as http;

class TransaksiApi {
  final url = Url.url_host;

  Future<String> postTransaksi(String idUser, String token, String addres,
      String city, String province, String postalcode) async {
    final urlTransaksi = url + '/transactions/$idUser';
    print(urlTransaksi);
    final response = await http.post(
      Uri.parse(urlTransaksi),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        {
          "address": addres,
          "city": city,
          "province": province,
          "postal_code": postalcode
        },
      ),
    );
    Map<String, dynamic> body = jsonDecode(response.body);
    print(body['status']);
    if (response.statusCode == 200 && body['status'] == 'OK') {
      return body['data']['qr_code'];
    } else {
      throw ('${body['status']}');
    }
  }

  Future<List<TransaksiModel>> getTransaksi(
      String customerId, String token) async {
    final urlTransaksi = url + '/customers/$customerId/transactions';
    final request = await http.get(Uri.parse(urlTransaksi), headers: {
      'Authorization': 'Bearer $token',
    });
    Map<String, dynamic> body = jsonDecode(request.body);
    print(body);
    if (request.statusCode == 200) {
      List transaction = body['data']['transactions'];
      List<TransaksiModel> model = [];
      for (int i = 0; i < transaction.length; i++) {
        model.add(TransaksiModel.fromJson(transaction[i]));
      }
      return model;
    }else{
      throw(request.statusCode.toString());
    }
  }
}
