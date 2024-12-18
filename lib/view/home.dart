import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/cart.dart';
import 'package:ecommerce/controller/product.dart';
import 'package:ecommerce/view/cart.dart';
import 'package:ecommerce/view/log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).getProducts();
    bool isLodding =
        Provider.of<ProductProvider>(context, listen: false).islodding;
    if (isLodding == false) {
      Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
              icon: Icon(CupertinoIcons.cart)),
          IconButton(
              onPressed: () {
                logout();
              },
              icon: Icon(Icons.logout)),
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
                    CachedNetworkImage(
                      imageUrl: 
                      productdata.src ?? ' ',
                      width: 100,
                      placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                      errorWidget: (context, url, error) => Center(child: Icon(Icons.error),),
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

  void logout() {
    FlutterSecureStorage storage = FlutterSecureStorage();

    storage.delete(key: 'auth_token');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => RegisterPAge()),
      (route) {
        return false;
      },
    );
  }
}
