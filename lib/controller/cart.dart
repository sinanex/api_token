import 'package:ecommerce/services/cart.dart';
import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier {
  CartServices cartServices = CartServices();

  void addCart({required String productId}) async {
    await cartServices.AddToCart(productId);
    notifyListeners();
  }
}
