import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/product.dart';
import 'package:ecommerce/services/product.dart';
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
        title: Text("All products"),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, product, child) => ListView.builder(
          itemCount: product.productList.length,
          itemBuilder: (context, index) {
            final productdata = product.productList[index];
            return Container(
              width: 200,
              height: 200,
              child: Column(
                children: [
                 Image.network(productdata.src??' ',width: 150,),
                  Text(productdata.productName ?? "no data"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
