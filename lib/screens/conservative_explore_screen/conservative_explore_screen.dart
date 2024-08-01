import 'package:flutter/material.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/buy_screen/buy_screen.dart';
import 'package:hedg/screens/calculator_screen/calculator_screen.dart';

import '../../components/components.dart';
import '../../components/custom_texts.dart';
import '../preformance_screen/preformance_screen.dart';

class ConservativeExploreScreen extends StatelessWidget {
  const ConservativeExploreScreen({super.key});

  static String id = "ConservativeExploreScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Conservative Plan",
          weight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExploreItem(
              context: context,
              title: "Conservative plan",
              subTitle: "Save more with low risks",
              color: const Color(0xffC7EDD8),
              image: "assets/images/Conservative.png",
            ).bP16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BodyMediumText(
                  "Description",
                  weight: FontWeight.bold,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PreformanceScreen.id);
                  },
                  child: Row(
                    children: [
                      const BodyExtraSmallText(
                        "See Performance",
                        weight: FontWeight.bold,
                        isUnderlined: true,
                        color: KHeadTextColor,
                      ).hP4,
                      const Icon(
                        Icons.arrow_forward,
                        size: 18,
                        color: KHeadTextColor,
                      )
                    ],
                  ),
                ),
              ],
            ).bP16,
            const BodySmallText(
              "Conservative  plans prioritize capital preservation over growth, focusing on investing in low-risk securities and using risk management techniques to avoid losses. Typically investing in Fixed Income and Gold.",
              maxLines: 5,
              textAlign: TextAlign.start,
            ).bP16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Icon(
                        Icons.play_circle_outline_rounded,
                        size: 18,
                        color: Colors.red,
                      ),
                      const BodySmallText(
                        "Watch video",
                        weight: FontWeight.bold,
                        isUnderlined: true,
                        color: Colors.red,
                      ).hP4,
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, CalculatorScreen.id);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calculate_outlined,
                        size: 18,
                        color: KHeadTextColor,
                      ),
                      const BodyExtraSmallText(
                        "Calculator",
                        weight: FontWeight.bold,
                        isUnderlined: true,
                        color: KHeadTextColor,
                      ).hP4,
                      const Icon(
                        Icons.arrow_forward,
                        size: 18,
                        color: KHeadTextColor,
                      )
                    ],
                  ),
                ),
              ],
            ).bP16,
            const BodyMediumText("Plan Details", weight: FontWeight.bold).bP16,
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const BodySmallText("Asset Manager"),
                          const Icon(
                            Icons.help_outline_rounded,
                            size: 18,
                            color: KMainTextColor,
                          ).hP4,
                        ],
                      ),
                      const BodySmallText("Azimut")
                    ],
                  ),
                  const Divider(
                    color: KUnselectedTabColor,
                  ).hP16.vP8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const BodySmallText("Risk Profile"),
                          const Icon(
                            Icons.help_outline_rounded,
                            size: 18,
                            color: KMainTextColor,
                          ).hP4,
                        ],
                      ),
                      const BodySmallText("Low")
                    ],
                  ),
                  const Divider(
                    color: KUnselectedTabColor,
                  ).hP16.vP8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const BodySmallText("Subscription Freq."),
                          const Icon(
                            Icons.help_outline_rounded,
                            size: 18,
                            color: KMainTextColor,
                          ).hP4,
                        ],
                      ),
                      const BodySmallText("Daily")
                    ],
                  ),
                  const Divider(
                    color: KUnselectedTabColor,
                  ).hP16.vP8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const BodySmallText("Redemption Freq."),
                          const Icon(
                            Icons.help_outline_rounded,
                            size: 18,
                            color: KMainTextColor,
                          ).hP4,
                        ],
                      ),
                      const BodySmallText("Daily")
                    ],
                  ),
                ],
              ).p16,
            ).bP16,
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
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
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BodySmallText("Fixed Income"),
                        ],
                      ),
                      BodySmallText("85%"),
                    ],
                  ),
                  const Divider(
                    color: KUnselectedTabColor,
                  ).hP16.vP8,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BodySmallText("Gold"),
                        ],
                      ),
                      BodySmallText("15%")
                    ],
                  ),
                ],
              ).p16,
            ).bP16,
            DefaultTextButton(
                context: context,
                function: () {
                  Navigator.pushNamed(context, BuyScreen.id, arguments: [0]);
                },
                text: "Buy",
                color: KMainTextColor)
          ],
        ).p16,
      ),
    );
  }
}
