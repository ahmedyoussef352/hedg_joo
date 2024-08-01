import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/signup_repository.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepository signupRepository;
  String countryCode = '-  -';
  bool isPassShow = true;

  SignupCubit(this.signupRepository) : super(SignupInitial());

  void changeCountryCode({required String code}) {
    countryCode = code;
    emit(ChangeCountryCodeState());
  }

  void changePassState() {
    isPassShow = !isPassShow;
    emit(ChangePassState());
  }

  Future<void> signup({
    String? email,
    required String phone,
    required String password,
  }) async {
    emit(SignupLoading());
    try {
      final data = await signupRepository.signup(
        email: email,
        phone: phone,
        password: password,
      );
      emit(SignupSuccess(data));
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}
