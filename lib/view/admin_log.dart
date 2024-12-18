import 'package:ecommerce/model/admin.dart';
import 'package:ecommerce/services/admin.dart';
import 'package:ecommerce/view/reg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminLoginPAge extends StatelessWidget {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  AdminLoginPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: usernameCtrl,
              decoration: InputDecoration(
                  hintText: 'username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordCtrl,
              decoration: InputDecoration(
                  hintText: 'password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                AdminServices adminServices = AdminServices();
                final AdminDatdata = Adminmodel(
                    username: usernameCtrl.text, password: passwordCtrl.text);
                adminServices.AdminLogin(context, AdminDatdata);
              },
              child: Text("login")),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Loginpage()));
              },
              child: Text("are youhh user??")),
        ],
      ),
    );
  }
}
