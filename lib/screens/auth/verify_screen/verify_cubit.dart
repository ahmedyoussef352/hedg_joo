import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/screens/auth/verify_screen/verify_state.dart';
import 'package:hedg/repositories/phone_otp_repository.dart';

class VerifyCubit extends Cubit<VerifyState> {
  final VerifyRepository verifyRepository;
  VerifyCubit(this.verifyRepository) : super(VerifyInitial());

  bool canReSend = true;
  int reSendTime = 30;
  Timer? _timer;

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

  Future<void> verifyOtp(String mobileNumber, String otp) async {
    try {
      final response = await verifyRepository.verifyOtp(
        mobileNumber: mobileNumber,
        otp: otp,
      );

      if (response['message'] == 'Mobile number verified successfully.') {
        emit(VerifySuccessState());
      } else {
        emit(VerifyFailureState(response['message']));
      }
    } catch (error) {
      print(error);
      emit(VerifyFailureState('Invalid OTP'));
    }
  }
}
