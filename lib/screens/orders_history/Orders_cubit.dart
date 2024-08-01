import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  int currentTabIndex = 0;
  PageController pageController = PageController();

  void onTabChanged(int index) {
    currentTabIndex = index;
    pageController.jumpToPage(index);
    emit(IsTabChangedState());
  }

  void onPageChanged(int index) {
    currentTabIndex = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    emit(IsTabChangedState());
  }
}
