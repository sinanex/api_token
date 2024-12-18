import 'package:ecommerce/controller/cart.dart';
import 'package:ecommerce/controller/product.dart';
import 'package:ecommerce/view/log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider(),),
        ChangeNotifierProvider(create: (context) => CartProvider(),),
      ],
      child: MaterialApp(
        home: RegisterPAge(),
      ),
    );
  }
}
