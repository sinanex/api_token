import 'package:ecommerce/view/log.dart';
import 'package:ecommerce/model/register.dart';
import 'package:ecommerce/services/user.dart';
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameCrtl,
              decoration: InputDecoration(
                  hintText: 'name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
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
              controller: emailCtrl,
              decoration: InputDecoration(
                  hintText: 'email',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  RegistrationServices registrationServices =
                      RegistrationServices();
                  final data = Register(
                      name: nameCrtl.text,
                      username: usernameCtrl.text,
                      email: emailCtrl.text,
                      password: passwordCtrl.text);
                  registrationServices.registerUser(data, context);
                },
                child: Text("submit")),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPAge()));
              },
              child: Text("already have an account??"))
        ],
      ),
    );
  }
}
