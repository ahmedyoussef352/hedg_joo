import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hedg/repositories/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;

  LoginCubit({required this.loginRepository}) : super(LoginInitial());

  Future<void> login({required String phoneNumber, required String password}) async {
    try {
      emit(LoginLoading());
      final token = await loginRepository.login(phoneNumber: phoneNumber, password: password);
      emit(LoginSuccess(token: token));
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}
