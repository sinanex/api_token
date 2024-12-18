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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                width: double.infinity,
                height: 200,
                child: Column(
                  children: [
                    Image.network(
                      '${data.src}',
                      width: 100,
                    ),
                    Text(data.productName ?? ''),
                    SizedBox(
                      height: 10,
                    ),
                    Text("price :\$${data.price}")
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
