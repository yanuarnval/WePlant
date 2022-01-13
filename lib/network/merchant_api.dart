import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mobile_flutter/model/merchant_model.dart';
import 'package:mobile_flutter/shared/url.dart';

class MerchantApi{
  static const urlMerchant = '${Url.url_host}merchants/';

  static Future<MerchantModel> getMerchantById(String idMerchant) async {
    final urlId = urlMerchant + idMerchant;
    Map<String,dynamic> result,data;
    final response = await http.get(Uri.parse(urlId));
    if (response.statusCode == 200) {
      result=jsonDecode(response.body);
      data=result['data'];
      return MerchantModel.fromJson(data);
    }else{
      final e=response.statusCode;
      throw HttpException('error code $e');
    }
  }
}