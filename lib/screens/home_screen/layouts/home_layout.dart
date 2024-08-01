import 'package:flutter/material.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/components/custom_texts.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/extention/extetion.dart';

import '../../../components/circle_progress_bar.dart';
import '../../../constants/constant_sizes.dart';
import '../../orders_history/orders_screen.dart';
import '../../plan_details_screen/details_plan_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Container(
              width: AppSizes.getScreenWidth(context),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff098AD3).withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const BodyMediumText("Hi Moataz"),
                  const BodyExtraSmallText("fri, 31 May 2024"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BodySmallText("Investment Value").bP4,
                          BodySmallText(
                            "60,500 EGP",
                            weight: TextWeight.bold,
                          ).bP8,
                          const BodySmallText("Total Returns").bP4,
                          Row(
                            children: [
                              const Icon(
                                Icons.arrow_drop_up_sharp,
                                color: KHeadTextColor,
                              ),
                              BodySmallText(
                                "11,500 EGP",
                                weight: TextWeight.bold,
                              ).bP8,
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.arrow_drop_up_sharp,
                                color: KHeadTextColor,
                              ),
                              BodySmallText(
                                "12.2%",
                                weight: TextWeight.bold,
                                color: KHeadTextColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const CircularProgressBar(
                        value: 0.5,
                        maxValue: 1,
                        title: '60,500 EGP',
                        subTitle: '11,500 EGP',
                        color: KHeadTextColor,
                      )
                    ],
                  ).tP25.hP25,
                  DefaultTextButton(
                          context: context,
                          function: () {},
                          text: "Portfolio Details",
                          color: KMainTextColor)
                      .hP25
                      .tP16
                ],
              ).p16,
            ).bP16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BodyMediumText(
                  "My Pensions",
                  weight: FontWeight.bold,
                ),
                DefaultElevatedButton(
                    function: () {
                      Navigator.pushNamed(context, OrdersScreen.id);
                    },
                    text: "Orders",
                    color: KUnselectedColor.withOpacity(0.5),
                    textColor: KMainTextColor.withOpacity(0.5)),
              ],
            ).bP8,
            MyPensionsItem(
                onTap: () {
                  Navigator.pushNamed(context, DetailsPlanScreen.id);
                },
                title: "Conservative Plan",
                image: "assets/images/Conservative.png",
                imageBackground: const Color(0xffC7EDD8),
                holeEntry: "2,800 EGP",
                subEntry: "272.5 EGP",
                isLose: false),
            MyPensionsItem(
                title: "Customized Plan",
                image: "assets/images/Customized.png",
                imageBackground: const Color(0xffC9E3F1),
                holeEntry: "5,300 EGP",
                subEntry: "265 EGP",
                isLose: true),
            MyPensionsItem(
                title: "Aggressive Plan",
                image: "assets/images/Aggressive.png",
                imageBackground: const Color(0xffF5D8D8),
                holeEntry: "2,500 EGP",
                subEntry: "212.5 EGP",
                isLose: false),
          ],
        ).hP16.tP25,
      ),
    );
  }
}
