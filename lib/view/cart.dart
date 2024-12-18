import 'package:ecommerce/controller/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context, listen: false).getCart();
    return Scaffold(
      appBar: AppBar(
        title: Text("cart"),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) => ListView.builder(
          itemCount: cart.cartList.length,
          itemBuilder: (context, index) {
            final data = cart.cartList[index];
            return ListTile(
              title: Text(data.productName ?? ''),
            );
          },
        ),
      ),
    );
  }
}
