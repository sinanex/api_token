import 'package:ecommerce/model/cart.dart';
import 'package:ecommerce/services/cart.dart';
import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier {
  CartServices cartServices = CartServices();
  List<Data> cartList = [];
  bool isLodding = false;

  void addCart({required String productId}) async {
    await cartServices.AddToCart(productId);
    notifyListeners();
  }

  void getCart() async {
    cartList = await cartServices.getCart();
    notifyListeners();
    
    notifyListeners();
  }
}
