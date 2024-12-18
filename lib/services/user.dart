import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/model/login.dart';
import 'package:ecommerce/model/register.dart';
import 'package:ecommerce/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationServices {
  Dio dio = Dio();
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> registerUser(Register userData,BuildContext context) async {
    try {
      log('Registering user: ${userData.toJson()}');

      final response = await dio.post(
        "https://node-project-amber.vercel.app/register",
        data: userData.toJson(),
      );

      log('Response from register: ${response.statusCode} ${response.data}');
      if (response.statusCode == 201) {
        log("${response.data['message']}");
       final token = response.data['token'];
        await storage.write(key: 'auth_token', value: token);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
      } else if (response.statusCode == 400) {
        log("${response.data['message']}");
      } else {
        log('Unexpected response status: ${response.statusCode}');
      }
    } catch (e) {
      if (e is DioException) {
        log('DioError: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        log('Unexpected error during registration: $e');
      }
    }
  }

  Future<void> loginUser(Login user,BuildContext context) async {

    try {
      final response = await dio.post(
        'https://node-project-amber.vercel.app/login',
        data: user.toJson(),
      );
      log('Response from login: ${response.statusCode} ${response.data}');
      if (response.statusCode == 200) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
        final token = response.data['token'];
        storage.write(key: 'auth_token', value: token);
        log("${response.data['status']}");
        log("$token");
      } else {
        log("${response.data['status']}");
      }
    } catch (e) {
      if (e is DioException) {
        log('DioError: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        log("Unexpected error during login: $e");
      }
    }
  }
}
