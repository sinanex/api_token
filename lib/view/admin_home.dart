import 'package:ecommerce/view/admin_log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                logout(context);
              },
              icon: Icon(Icons.logout))
        ],
        title: Text("admin page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Row(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Column(
                    children: [
                      Icon(CupertinoIcons.person),
                      Text("user managemnt"),
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  child: Column(
                    children: [
                      Icon(Icons.add_shopping_cart),
                      Text("add product"),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Column(
                    children: [
                      Icon(Icons.update),
                      Text("update product"),
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  child: Column(
                    children: [
                      Icon(Icons.remove_shopping_cart),
                      Text("delete product"),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void logout(BuildContext context) async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.delete(key: 'admin-auth');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => AdminLoginPAge()),
      (route) => false,
    );
  }
}
