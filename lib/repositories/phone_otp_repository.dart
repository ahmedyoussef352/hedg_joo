import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import '../constants/endpoints.dart';

class VerifyRepository {
  Future<Map<String, dynamic>> verifyOtp({
    required String mobileNumber,
    required String otp,
  }) async {
    final dio = Dio();

    try {
      final response = await dio.post(
        verifyOtpEndpoint,
        data: jsonEncode({
          'mobile_number': mobileNumber,
          'otp': otp,
        }),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to verify OTP');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}
