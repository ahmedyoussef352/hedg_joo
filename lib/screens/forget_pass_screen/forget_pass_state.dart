abstract class ForgetPassState {}

class ForgetPassInitial extends ForgetPassState {}

class ChangeCountryCodeState extends ForgetPassState {}

class ReSendTimerCancelState extends ForgetPassState {}

class ReSendTimerState extends ForgetPassState {}
