import 'package:ecommerce/controller/cart.dart';
import 'package:ecommerce/controller/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProductProvider>(context, listen: false).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).getProducts();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.cart)),
          IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
        ],
        title: Text("All products"),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, product, child) => ListView.builder(
          itemCount: product.productList.length,
          itemBuilder: (context, index) {
            final productdata = product.productList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                height: 200,
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addCart(productId: productdata.id ?? "");
                        },
                        icon: Icon(CupertinoIcons.cart)),
                    Image.network(
                      productdata.src ?? ' ',
                      width: 100,
                    ),
                    Text(productdata.productName ?? "no data"),
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
