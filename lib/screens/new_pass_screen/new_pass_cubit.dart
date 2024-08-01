import 'package:flutter_bloc/flutter_bloc.dart';

import 'new_pass_state.dart';

class NewPassCubit extends Cubit<NewPassState> {
  NewPassCubit() : super(NewPassInitial());
  bool isPassShow = true;
  bool isConfirmPassShow = true;

  void changePassState() {
    isPassShow = !isPassShow;
    emit(ChangePassState());
  }

  void changeConfirmPassState() {
    isConfirmPassShow = !isConfirmPassShow;
    emit(ChangePassState());
  }
}
