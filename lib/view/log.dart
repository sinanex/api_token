import 'package:ecommerce/view/admin_log.dart';
import 'package:ecommerce/view/home.dart';
import 'package:ecommerce/model/login.dart';
import 'package:ecommerce/view/reg.dart';
import 'package:ecommerce/services/user.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegisterPAge extends StatelessWidget {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  RegisterPAge({super.key});

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
                RegistrationServices service = RegistrationServices();
                final data = Login(
                    username: usernameCtrl.text, password: passwordCtrl.text);
                service.loginUser(data,context);
              
              },
              child: Text("login")),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Loginpage()));
              },
              child: Text("don't have an account??")),
               TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AdminLoginPAge()));
              },
              child: Text("are youhh admin??")),
              
        ],
      ),
    );
  }
}
