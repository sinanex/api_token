import 'dart:developer';

import 'package:dio/dio.dart';
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

   getCart()async{

  }
}
