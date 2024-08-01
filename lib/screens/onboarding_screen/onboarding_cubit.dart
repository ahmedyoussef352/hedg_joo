import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  final PageController pageController = PageController();
  int currentPage = 0;
  bool isLastPage = false;

  void changePage() {
    currentPage++;
    emit(ChangeOnboardingPageState());
  }
}
