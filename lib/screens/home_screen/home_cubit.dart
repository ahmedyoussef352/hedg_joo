import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  bool isNotification = false;
  bool isWalletVisible = false;
  int currentNavIndex = 0;
  int currentTabWalletIndex = 0;
  PageController pageWalletController = PageController();

  void changeNavIndex(int index) {
    currentTabWalletIndex = 0;
    currentNavIndex = index;
    emit(ChangeNavIndex());
  }


  void changeNotificationIcon() {
    isNotification = !isNotification;
    emit(ChangeNotification());
  }

  void changeVisibilityWallet() {
    isWalletVisible = !isWalletVisible;
    emit(ChangeVisibilityWalletState());
  }

  void onWalletTabChanged(int index) {
    currentTabWalletIndex = index;
    pageWalletController.jumpToPage(index);
    emit(IsTabWalletChangedState());
  }

  void onWalletPageChanged(int index) {
    currentTabWalletIndex = index;
    pageWalletController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    emit(IsTabWalletChangedState());
  }
}
