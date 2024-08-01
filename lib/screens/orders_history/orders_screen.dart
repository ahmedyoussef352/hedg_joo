import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/components/custom_texts.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/constants/constant_sizes.dart';
import 'package:hedg/extention/extetion.dart';

import '../../components/components.dart';
import 'Orders_cubit.dart';
import 'Orders_state.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  static String id = "OrdersScreen";

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<OrdersCubit>(context);
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) => Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
          title: const BodyMediumText(
            "Order History",
            weight: FontWeight.bold,
          ),
        ),
        body: SingleChildScrollView(
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                TabBar(
                    onTap: (index) {
                      cubit.onTabChanged(index);
                    },
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    labelPadding: const EdgeInsets.all(0),
                    splashBorderRadius: BorderRadius.circular(15),
                    splashFactory: NoSplash.splashFactory,
                    tabs: [
                      DefaultTab(
                          selectedColor: cubit.currentTabIndex == 0
                              ? KselectedTabColor
                              : KUnselectedTabColor,
                          title: "All",
                          titleColor: Colors.black45),
                      DefaultTab(
                        selectedColor: cubit.currentTabIndex == 1
                            ? KselectedTabColor
                            : KUnselectedTabColor,
                        title: "Completed",
                        titleColor: Colors.black45,
                      ),
                      DefaultTab(
                        selectedColor: cubit.currentTabIndex == 2
                            ? KselectedTabColor
                            : KUnselectedTabColor,
                        title: "Pending",
                        titleColor: Colors.black45,
                      ),
                      DefaultTab(
                        selectedColor: cubit.currentTabIndex == 3
                            ? KselectedTabColor
                            : KUnselectedTabColor,
                        title: "Cancelled",
                        titleColor: Colors.black45,
                      ),
                    ]).hP16.bP25,
                SizedBox(
                  height: AppSizes.getScreenHeight(context),
                  child: PageView(
                    controller: cubit.pageController,
                    onPageChanged: (value) {
                      cubit.onPageChanged(value);
                    },
                    children: [
                      Column(
                        children: [
                          OrderItem(
                              title: "Buy Moderated Plan",
                              date: "09 Oct 2024   03:25 pm",
                              subTitle: "2,800 EGP",
                              status: "Pending"),
                          OrderItem(
                              title: "Buy Conservative Plan",
                              date: "09 Sep 2024   01:05 pm",
                              subTitle: "3,500 EGP",
                              status: "Fulfilled"),
                          OrderItem(
                              title: "Buy Conservative Plan",
                              date: "09 Aug 2024   03:25 pm",
                              subTitle: "2,800 EGP",
                              status: "Fulfilled"),
                          OrderItem(
                              title: "Buy Aggressive Plan",
                              date: "09 Oct 2024   03:25 pm",
                              subTitle: "1,500 EGP",
                              status: "Cancelled"),
                          OrderItem(
                              title: "Sell Moderated Plan",
                              date: "09 Oct 2024   03:25 pm",
                              subTitle: "1,800 EGP",
                              status: "Fulfilled"),
                        ],
                      ),
                      Column(
                        children: [
                          OrderItem(
                              title: "Buy Conservative Plan",
                              date: "09 Sep 2024   01:05 pm",
                              subTitle: "3,500 EGP",
                              status: "Fulfilled"),
                          OrderItem(
                              title: "Buy Conservative Plan",
                              date: "09 Aug 2024   03:25 pm",
                              subTitle: "2,800 EGP",
                              status: "Fulfilled"),
                          OrderItem(
                              title: "Sell Moderated Plan",
                              date: "09 Oct 2024   03:25 pm",
                              subTitle: "1,800 EGP",
                              status: "Fulfilled"),
                        ],
                      ),
                      Column(
                        children: [
                          OrderItem(
                              title: "Buy Moderated Plan",
                              date: "09 Oct 2024   03:25 pm",
                              subTitle: "2,800 EGP",
                              status: "Pending"),
                        ],
                      ),
                      Column(
                        children: [
                          OrderItem(
                              title: "Buy Aggressive Plan",
                              date: "09 Oct 2024   03:25 pm",
                              subTitle: "1,500 EGP",
                              status: "Cancelled"),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ).p8,
          ),
        ),
      ),
    );
  }
}
