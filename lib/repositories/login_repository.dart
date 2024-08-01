import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import '../constants/endpoints.dart';
import '../shared_prefs/shared_prefs.dart';

class LoginRepository {
  final TokenService _tokenService = TokenService();

  Future<String> login({required String phoneNumber, required String password}) async {
    final dio = Dio();

    try {
      final response = await dio.post(
        loginEndpoint,
        data: jsonEncode({
          'phone': phoneNumber,
          'password': password,
        }),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data != null && data['access_token'] != null) {
          final token = data['access_token'];
          await _tokenService.saveToken(token); // Save the token
          return token;
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}
