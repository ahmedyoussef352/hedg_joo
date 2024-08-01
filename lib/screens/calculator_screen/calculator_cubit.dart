import 'package:flutter_bloc/flutter_bloc.dart';

import 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorInitial());
  double initialVal = 0.0;
  double monthlyVal = 0.0;


  void changeInitialVal({required double value}) {
    initialVal = value;
    emit(CalculatorSliderValChange());
  }

  void changeMonthlyVal({required double value}) {
    monthlyVal = value;
    emit(CalculatorSliderValChange());
  }
}
