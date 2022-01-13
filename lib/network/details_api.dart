import 'dart:convert';
import 'dart:io';

import 'package:mobile_flutter/model/details_event.dart';
import 'package:mobile_flutter/model/details_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_flutter/model/merchant_model.dart';
import 'package:mobile_flutter/shared/url.dart';

class DetailsApi {

  static const urlProduct = '${Url.url_host}products/';


  static Future<DetailsModel> getProductById(String idProduct) async {
    final urlId = urlProduct + idProduct;
    Map<String,dynamic> result,data;

    final response = await http.get(Uri.parse(urlId));
    if (response.statusCode == 200) {
        result=jsonDecode(response.body);
        data=result['data'];
        return DetailsModel.fromJson(data);
    }else{
      final e=response.statusCode;
      throw HttpException('error code $e');
    }
  }


}
