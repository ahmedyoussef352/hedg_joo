import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import '../constants/endpoints.dart';
import '../shared_prefs/shared_prefs.dart';

class SignupRepository {
  final TokenService _tokenService = TokenService();

  Future<Map<String, dynamic>> signup({
    String? email,
    required String phone,
    required String password,
  }) async {
    final dio = Dio();

    try {
      final response = await dio.post(
        signUpEndpoint,
        data: jsonEncode({
          'email': email,
          'phone': phone,
          'password': password,
        }),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 201) {
        final data = response.data;
        if (data != null && data['access_token'] != null) {
          await _tokenService.saveToken(data['access_token']); // Save the token
          return data;
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to signup');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}
