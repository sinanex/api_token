import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/model/admin.dart';
import 'package:ecommerce/view/admin_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AdminServices {
  Dio dio = Dio();
  FlutterSecureStorage storage = FlutterSecureStorage();

  void AdminLogin(BuildContext context, Adminmodel admin) async {
    final baseurl = 'https://node-project-amber.vercel.app/adminLogin';

    try {
      final response = await dio.post(baseurl, data: admin.toJosn());
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        final tocken = response.data['data'];
        print(tocken);
        storage.write(key: 'admin-auth', value: tocken);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AdminHome()));
      } else {
        log("${response.data}");
      }
    } catch (e) {
      if (e is DioException) {
        log("${e.response?.data['message']}");
      }
    }
  }
}
