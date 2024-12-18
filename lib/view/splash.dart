import 'dart:async';

import 'package:ecommerce/view/admin_home.dart';
import 'package:ecommerce/view/home.dart';
import 'package:ecommerce/view/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), checkTocken);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("splash ",style: TextStyle(
          fontSize: 20,
        ),),
      ),
    );
  }

  void checkTocken() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    final adminToken = await storage.read(key: 'admin-auth');
    final token = await storage.read(key: 'auth_token');
    if (adminToken != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AdminHome()));
    } else if (token != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => RegisterPAge()));
    }
  }
}
