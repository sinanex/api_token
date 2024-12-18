import 'dart:developer';

import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/services/product.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  ProductServices productServices = ProductServices();
  List<AllData> productList = [];
  bool islodding = false;

  void getProducts() async {
    try {
      productList = await productServices.getProduct();

      if (productList.isEmpty) {
        print("product list is empty");
        islodding = false;
      } else {
        log("product fetch success");
        islodding = true;
        notifyListeners();
      }
    } catch (e) {
      log("$e");
    }
    notifyListeners();
  }
}
