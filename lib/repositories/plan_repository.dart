import 'package:dio/dio.dart';
import 'package:hedg/models/plan.dart';

import '../constants/endpoints.dart';

class PlanRepository {
  final Dio _dio = Dio();

  Future<List<Plan>> fetchPlans() async {
      final response = await _dio.get(plansListEndpoint);
      if (response.statusCode == 200) {
        final List<dynamic>? results = response.data['results'];
        if (results != null) {
          // Debug print to check results
          // Map results to List<Plan>
          return results.map((e) => Plan.fromJson(e)).toList();
        } else {
          throw Exception('Results are null or empty');
        }
      } else {
        throw Exception('Failed to load plans: ${response.statusCode}');
      }
  }



}
