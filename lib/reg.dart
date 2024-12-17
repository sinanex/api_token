import 'package:ecommerce/model/register.dart';
import 'package:ecommerce/services/services.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  TextEditingController nameCrtl = TextEditingController();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: nameCrtl,
            decoration: InputDecoration(
                hintText: 'name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          TextField(
            controller: usernameCtrl,
            decoration: InputDecoration(
                hintText: 'username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          TextField(
            controller: emailCtrl,
            decoration: InputDecoration(
                hintText: 'email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          TextField(
            controller: passwordCtrl,
            decoration: InputDecoration(
                hintText: 'password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          ElevatedButton(
              onPressed: () {
                RegistrationServices registrationServices=RegistrationServices();
                final data = Register(name: nameCrtl.text, username: usernameCtrl.text, email: emailCtrl.text, password: passwordCtrl.text);
                registrationServices.registerUser(
                  data
                );
              },
              child: Text("submit"))
        ],
      ),
    );
  }
}
