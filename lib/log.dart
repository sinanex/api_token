import 'package:ecommerce/services/services.dart';
import 'package:flutter/material.dart';

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
         
          TextField(
            controller: usernameCtrl,
            decoration: InputDecoration(
                hintText: 'username',
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
          ElevatedButton(onPressed: (){
            
          }, child: Text("register")),
        ],
      ),
    );
  }
}