import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/screens/forget_pass_screen/forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit() : super(ForgetPassInitial());

  String countryCode = '-  -';
  bool canReSend = true;
  int reSendTime = 30;
  Timer? _timer;

  void changeCountryCode({required String code}) {
    countryCode = code;
    emit(ChangeCountryCodeState());
  }

  void reSendCounter() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (reSendTime == 0) {
        _timer!.cancel();
        reSendTime = 30;
        canReSend = true;
        emit(ReSendTimerCancelState());
      } else {
        reSendTime--;
        canReSend = false;
        emit(ReSendTimerState());
      }
    });
  }
}
