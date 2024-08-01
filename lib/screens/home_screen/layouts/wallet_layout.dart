import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/components/custom_texts.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/home_screen/home_cubit.dart';
import 'package:hedg/screens/home_screen/home_state.dart';

import '../../topup_screen/topup_screen.dart';

class WalletLayout extends StatelessWidget {
  const WalletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => Center(
        child: SingleChildScrollView(
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: KUnselectedColor),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: KHeadTextColor.withOpacity(0.1),
                              ),
                              child: InkWell(
                                onTap: () {
                                  cubit.changeVisibilityWallet();
                                },
                                child: Icon(
                                  cubit.isWalletVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: KHeadTextColor,
                                ).p(10),
                              ))
                        ],
                      ).bP25,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BodyExtraLargeText(
                            cubit.isWalletVisible == false ? "*****" : "500.00",
                            color: Colors.black,
                            weight: FontWeight.bold,
                          ).hP4,
                          const BodySmallText(
                            "EGP",
                            weight: FontWeight.bold,
                            color: Colors.black,
                          ).bP16
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DefaultElevatedButton(
                              function: () {
                                Navigator.pushNamed(context, TopUpScreen.id);
                              },
                              text: "Top Up",
                              borderRadius: 10,
                              icon: Icons.add,
                              textColor: KHeadTextColor,
                              color: KHeadTextColor.withOpacity(0.1)),
                          DefaultElevatedButton(
                              function: () {},
                              borderRadius: 10,
                              text: "Withdraw",
                              icon: Icons.remove_circle_outline_rounded,
                              color: Colors.red.withOpacity(0.1),
                              textColor: Colors.red),
                        ],
                      ).bP25,
                    ],
                  ).p16,
                ).vP16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BodyMediumText(
                      "Recent Activities",
                      weight: FontWeight.bold,
                    ),
                    DefaultTab(
                      onTap: () {},
                      titleColor: Colors.black45,
                      selectedColor: Colors.grey.withOpacity(0.2),
                      title: "View Requests",
                      hasShadow: false,
                    )
                  ],
                ).bP16,
                TabBar(
                    onTap: (index) {
                      cubit.onWalletTabChanged(index);
                    },
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    labelPadding: const EdgeInsets.all(0),
                    splashBorderRadius: BorderRadius.circular(15),
                    splashFactory: NoSplash.splashFactory,
                    tabs: [
                      DefaultTab(
                          selectedColor: cubit.currentTabWalletIndex == 0
                              ? KselectedTabColor
                              : KUnselectedTabColor,
                          title: "All",
                          titleColor: Colors.black45),
                      DefaultTab(
                        selectedColor: cubit.currentTabWalletIndex == 1
                            ? KselectedTabColor
                            : KUnselectedTabColor,
                        title: "Funding",
                        titleColor: Colors.black45,
                      ),
                      DefaultTab(
                        selectedColor: cubit.currentTabWalletIndex == 2
                            ? KselectedTabColor
                            : KUnselectedTabColor,
                        title: "Investing",
                        titleColor: Colors.black45,
                      ),
                      DefaultTab(
                        selectedColor: cubit.currentTabWalletIndex == 3
                            ? KselectedTabColor
                            : KUnselectedTabColor,
                        title: "Other",
                        titleColor: Colors.black45,
                      ),
                    ]).bP16,
                SizedBox(
                  height: 300,
                  child: PageView(
                    controller: cubit.pageWalletController,
                    onPageChanged: (value) {
                      cubit.onWalletPageChanged(value);
                    },
                    children: [
                      ListView(
                        children: [
                          OrderItem(
                            icon: Icons.remove,
                            title: "Withdrawal Fees",
                            subTitle: "- 10.00",
                            date: "18 Dec 2024  03:13 pm",
                          ),
                          OrderItem(
                            icon: Icons.remove,
                            title: "Withdrawal",
                            subTitle: "- 2,800",
                            date: "18 Dec 2024  03:13 pm",
                          ),
                          OrderItem(
                            icon: Icons.remove,
                            title: "Buy Balanced Plan",
                            subTitle: "- 8,990",
                            date: "10 Oct 2024  01:30 pm",
                          ),
                          OrderItem(
                            icon: Icons.remove,
                            title: "Top Up",
                            subTitle: "+ 9,500",
                            date: "09 Oct 2024  03:00 pm",
                          ),
                          OrderItem(
                            icon: Icons.remove,
                            title: "Top Up",
                            subTitle: "+ 9,500",
                            date: "09 Oct 2024  03:00 pm",
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          OrderItem(
                            icon: Icons.remove,
                            title: "Top Up",
                            subTitle: "+ 9,500",
                            date: "09 Oct 2024  03:00 pm",
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          OrderItem(
                            icon: Icons.remove,
                            title: "Withdrawal Fees",
                            subTitle: "- 10.00",
                            date: "18 Dec 2024  03:13 pm",
                          ),
                          OrderItem(
                            icon: Icons.remove,
                            title: "Withdrawal",
                            subTitle: "- 2,800",
                            date: "18 Dec 2024  03:13 pm",
                          ),
                          OrderItem(
                            icon: Icons.remove,
                            title: "Buy Balanced Plan",
                            subTitle: "- 8,990",
                            date: "10 Oct 2024  01:30 pm",
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          OrderItem(
                            icon: Icons.remove,
                            title: "Top Up",
                            subTitle: "+ 9,500",
                            date: "09 Oct 2024  03:00 pm",
                          ),
                          OrderItem(
                            icon: Icons.remove,
                            title: "Top Up",
                            subTitle: "+ 9,500",
                            date: "09 Oct 2024  03:00 pm",
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ).hP25,
          ),
        ),
      ),
    );
  }
}
