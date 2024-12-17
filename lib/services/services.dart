
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/model/register.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RegistrationServices {
  final Dio dio;
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  RegistrationServices()
      : dio = Dio(
          BaseOptions(
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
          ),
        );

  Future<void> registerUser(Register userData) async {
    try {
      log('Registering user: ${userData.toJson()}');

      final response = await dio.post(
        "https://node-project-amber.vercel.app/register",
        data: userData.toJson(),
      );

      log('Response from register: ${response.statusCode} ${response.data}');

      if (response.statusCode == 200) {
        final data = response.data;
        final token = response.data['token'];
        await storage.write(key: 'auth_token', value: token);

        if (data is Map && data['status'] == 'success') {
          log('User registered successfully. Token: ${data['token']}');
        } else {
          log('Registration failed: ${data['message'] ?? "Unknown error"}');
        }
      } else {
        log('Unexpected response status: ${response.statusCode}');
        log('Response data: ${response.data}');
      }
    } catch (e) {
      log('Unexpected error during registration: $e');
    }
  }
}