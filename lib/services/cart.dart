
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/model/cart.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CartServices {
  FlutterSecureStorage storage = FlutterSecureStorage();
  Dio dio = Dio();
  AddToCart(String? productId) async {
    final token = await storage.read(key: 'auth_token');
    final baseUrl = 'https://node-project-amber.vercel.app/$productId/cart';
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    print(productId);
    try {
      final response =
          await dio.post(baseUrl, options: Options(headers: headers));
      if (response.statusCode == 200) {
        log("item added");
        log("${response.data['message']}");
      } else {
        log("error added to cart");
      }
    } catch (e) {
      log("cart error : $e");
    }
  }

  Future<List<Data>> getCart() async {
    final token = await storage.read(key: 'auth_token');
    final baseUrl = 'https://node-project-amber.vercel.app/:id/cart';
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    try {
      final response =
          await dio.get(baseUrl, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        return data.map((json) => Data.fromJson(json)).toList();
      }
    } catch (e) {
      log("$e");
    }
    return [];
  }
}
