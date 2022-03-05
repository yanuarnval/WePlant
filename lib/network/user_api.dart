import 'dart:convert';
import 'dart:io';

import 'package:mobile_flutter/model/user_model.dart';
import 'package:mobile_flutter/shared/url.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static const urlRegister = '${Url.url_host}/customers/';
  static const urlLogin = '${Url.url_host}/auth/customer';

  Future<UserModel> userRegister(
      String email, String name, String password, String phone) async {
    print(urlRegister);
    final response = await http.post(Uri.parse(urlRegister),
        body: jsonEncode({
          "email": email,
          "password": password,
          "user_name": name,
          "phone": phone
        }));
    Map<String, dynamic> decode = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return UserModel.jsonFrom(decode['data']);
    } else {
      print(decode);
      final e = response.statusCode;
      throw HttpException('$e');
    }
  }

  Future<UserModel> userLogin(String email, String password) async {
    final response = await http.post(Uri.parse(urlLogin),
        body: jsonEncode({
          "email": email,
          "password": password,
        }));

    if (response.statusCode == 200) {
      Map<String, dynamic> decode = jsonDecode(response.body);
      print('res 200');
      return UserModel.jsonFrom(decode['data']);
    } else {
      final e = response.statusCode;
      throw HttpException('error code $e');
    }
  }
}
