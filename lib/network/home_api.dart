import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:mobile_flutter/model/product_model.dart';
import 'package:mobile_flutter/shared/url.dart';

class HomeApi {


  static Future<List<ProductModel>> getAllProduct() async {
    const urlGetAll = '${Url.url_host}/products/';
    Map<String,dynamic> result;
    List<ProductModel> listProduct=[];
    final List<dynamic> jsonarray;
    final response = await http.get(Uri.parse(urlGetAll));
    if(response.statusCode == 200){
      result=jsonDecode(response.body);
      jsonarray=result['data'];
      for(int i=0;i<jsonarray.length;i++){
        listProduct.add(ProductModel.fromJson(jsonarray[i]));
      }
      return listProduct;
    }else{
      final e=response.statusCode;
      throw HttpException('$e');
    }

  }
}