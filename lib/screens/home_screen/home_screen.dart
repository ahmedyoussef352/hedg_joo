import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/screens/home_screen/home_cubit.dart';
import 'package:hedg/screens/home_screen/home_state.dart';
import 'package:hedg/screens/home_screen/layouts/notifications_layout.dart';

import '../../constants/constant_colors.dart';
import 'layouts/explore_layout/explore_layout.dart';
import 'layouts/home_layout.dart';
import 'layouts/profile_layout.dart';
import 'layouts/wallet_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          title: Image.asset(
            "assets/images/greenLogo.png",
            scale: 3,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  cubit.changeNotificationIcon();
                },
                icon: Icon(
                  Icons.notifications,
                  color: cubit.isNotification == false
                      ? KUnselectedColor
                      : KMainTextColor,
                ))
          ],
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: KUnselectedColor.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, 0)),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: BottomNavigationBar(
                currentIndex: cubit.currentNavIndex,
                onTap: (index) {
                  cubit.changeNavIndex(index);
                },
                unselectedItemColor: KUnselectedColor,
                selectedItemColor: KMainTextColor,
                selectedFontSize: 10,
                unselectedFontSize: 10,
                showUnselectedLabels: true,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        size: 24,
                      ),
                      label: ('Home')),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.account_balance_wallet_rounded,
                        size: 24,
                      ),
                      label: ('Wallet')),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.explore,
                        size: 24,
                      ),
                      label: ('Explore')),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        size: 24,
                      ),
                      label: ('Profile')),
                ],
              ),
            )),
        body: cubit.isNotification == true
            ? const NotificationsLayout()
            : cubit.currentNavIndex == 0
                ? const HomeLayout()
                : cubit.currentNavIndex == 1
                    ? const WalletLayout()
                    : cubit.currentNavIndex == 2
                        ? ExploreLayout()
                        : const ProfileLayout(),
      ),
    );
  }
}
