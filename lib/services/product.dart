import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/model/product.dart';

class ProductServices {
  final Dio dio = Dio();

  Future<List<AllData>> getProduct() async {
    final url = 'https://node-project-amber.vercel.app/products/';
    try {

      final response = await dio.get(url);
      if (response.statusCode == 200) {
        log("${response.data['status']}");
        List<dynamic> data = response.data['data'];
        return data.map((json) => AllData.fromJson(json)).toList();
      }else{
        log("${response.data['status']}");
      }
    } catch (e) {
      log("$e");
    }
    return [];
  }
}
