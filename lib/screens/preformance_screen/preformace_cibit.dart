import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/screens/preformance_screen/preformance_state.dart';
import 'package:interactive_chart/interactive_chart.dart';

class PerformanceCubit extends Cubit<PerformanceState> {
  PerformanceCubit() : super(PerformanceInitial());
  bool isLine = false;
  DateTime startDate = DateTime(2022, 1, 1);
  List<CandleData> candles = [];
  Random random = Random();
  double previousClose = 100.0;
  var trends = [];

  List<CandleData> generateIrregularCandleData(int count) {
    for (int i = 0; i < count; i++) {
      DateTime date = startDate.add(Duration(days: i));

      double open =
          previousClose + random.nextDouble() * 10 - 5; // Random variation
      double close = open + random.nextDouble() * 10 - 5; // Random variation
      double high =
          max(open, close) + random.nextDouble() * 5; // Ensure high is higher
      double low =
          min(open, close) - random.nextDouble() * 5; // Ensure low is lower
      double volume =
          10000 + random.nextDouble() * 1000; // Random volume variation

      candles.add(CandleData(
        timestamp: date.millisecondsSinceEpoch,
        open: open,
        high: high,
        low: low,
        close: close,
        volume: volume,
      ));

      previousClose = close;
    }
    return candles;
  }

  void computeTrendLines() {
    final ma7 = CandleData.computeMA(candles, 7);
    final ma30 = CandleData.computeMA(candles, 30);
    final ma90 = CandleData.computeMA(candles, 90);

    for (int i = 0; i < candles.length; i++) {
      trends = candles[i].trends = [ma7[i], ma30[i], ma90[i]];
    }
  }

  void removeTrendLines() {
    for (final candle in candles) {
      trends = candle.trends = [];
    }
    emit(RemoveTrendLines());
  }

  void changeGraphType() {
    isLine = !isLine;
    emit(ChangeGraphType());
  }

  void endScreen() {
    isLine = false;
    emit(EndScreenState());
  }
}
