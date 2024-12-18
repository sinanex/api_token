import 'package:ecommerce/view/home.dart';
import 'package:ecommerce/view/log.dart';
import 'package:ecommerce/view/reg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkTocken();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("splash "),
      ),
    );
  }

  void checkTocken() async {
    FlutterSecureStorage storage = FlutterSecureStorage();

    final token = await storage.read(key: 'auth_token');
    if (token != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegisterPAge()));
    }
  }
}
