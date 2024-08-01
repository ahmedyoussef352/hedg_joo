part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess({required this.token});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginSuccess && other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginFailure && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
