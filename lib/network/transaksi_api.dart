import 'dart:convert';

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
}
