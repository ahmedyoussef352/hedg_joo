import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import '../constants/endpoints.dart';
import '../shared_prefs/shared_prefs.dart';

class InstapayTopUpRepository {
  final TokenService _tokenService = TokenService();

  Future<void> createTopUpTransaction({required double amount, required String receiptPath}) async {
    final dio = Dio();
    final token = await _tokenService.getToken();

    try {
      final formData = FormData.fromMap({
        'amount': amount,
        'receipt': await MultipartFile.fromFile(receiptPath, filename: 'receipt.jpg'),
      });

      final response = await dio.post(
        instapayTopUpEndpoint,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to create top-up transaction');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}
