import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/screens/guidance_screen/guidance_state.dart';

class GuidanceCubit extends Cubit<GuidanceState> {
  GuidanceCubit() : super(GuidanceInitialState());
  String currentLookingFor = "short term ( less than 3 years )";
  String currentDescribes = "I’m a full time employee";
  String currentIncome = "Less than 8000";
  int currentRisk = 0;

  List<String> lookingFor = [
    "short term ( less than 3 years )",
    "Medium term ( from 3 to 8 years )",
    "Long term ( 8+ years )"
  ];

  List<String> describes = [
    "I’m a full time employee",
    "I’m a free lancer ",
    "I’m a business owner",
    "I’m a student",
    "Other"
  ];

  List<String> income = [
    "Less than 8000",
    "Between 8000 : 15000",
    "Between 15000 : 25000",
    "More than 25000",
  ];

  void changeLookingFor({required String looking}) {
    currentLookingFor = looking;
    emit(ChangeLookingForState());
  }

  void changeDescribes({required String describes}) {
    currentDescribes = describes;
    emit(ChangeDescribesState());
  }

  void changeIncome({required String income}) {
    currentIncome = income;
    emit(ChangeIncomeState());
  }

  void increaseRisk() {
    currentRisk++;
    emit(ChangeRiskState());
  }

  void decreaseRisk() {
    currentRisk--;
    emit(ChangeRiskState());
  }
}
