abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final Map<String, dynamic> data;

  SignupSuccess(this.data);
}

class SignupFailure extends SignupState {
  final String error;

  SignupFailure(this.error);
}

class ChangeCountryCodeState extends SignupState {}

class ChangePassState extends SignupState {}
