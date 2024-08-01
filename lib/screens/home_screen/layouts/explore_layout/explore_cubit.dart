import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/plan.dart';
import '../../../../repositories/plan_repository.dart';

class ExploreCubit extends Cubit<List<Plan>> {
  final PlanRepository _repository = PlanRepository();

  ExploreCubit() : super([]);

  void fetchPlans() async {
    try {
      final plans = await _repository.fetchPlans();
      print(plans);
      emit(plans);
    } catch (e) {
      // Handle error
      emit([]);
    }
  }
}
