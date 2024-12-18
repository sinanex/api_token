import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/model/login.dart';
import 'package:ecommerce/model/register.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RegistrationServices {
  Dio dio = Dio();
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> registerUser(Register userData) async {
    try {
      log('Registering user: ${userData.toJson()}');

      final response = await dio.post(
        "https://node-project-amber.vercel.app/register",
        data: userData.toJson(),
      );

      log('Response from register: ${response.statusCode} ${response.data}');

      if (response.statusCode == 201) {
        final data = response.data;
        final token = response.data['token'];
        await storage.write(key: 'auth_token', value: token);

        print(token);
      } else {
        log('Unexpected response status: ${response.statusCode}');
      }
    } catch (e) {
      log('Unexpected error during registration: $e');
    }
  }

  Future<void> loginUser(Login user) async {
    try {
      final response = await dio.post(
          'https://node-project-amber.vercel.app/login',
          data: user.toJson());
      final status = response.data['status'];
      if (response.statusCode == 200) {
        final token = response.data['token'];
        log("$status");
        log("$token");
        log("${response.statusCode}");
      } else {
        log("${response.statusCode}");
        log("$status");
      }
    } catch (e) {
      log("error $e");
    }
  }
}
