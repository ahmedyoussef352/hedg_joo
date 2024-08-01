abstract class VerifyState {}

class VerifyInitial extends VerifyState {}

class ReSendTimerState extends VerifyState {}

class ReSendTimerCancelState extends VerifyState {}

class VerifySuccessState extends VerifyState {}

class VerifyFailureState extends VerifyState {
  final String message;

  VerifyFailureState(this.message);
}
