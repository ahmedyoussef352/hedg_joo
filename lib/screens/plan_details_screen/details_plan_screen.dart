import 'package:flutter/material.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/models/plan.dart';
import 'package:hedg/screens/preformance_screen/preformance_screen.dart';

import '../../components/custom_texts.dart';

class DetailsPlanScreen extends StatelessWidget {
  final Plan plan;

  const DetailsPlanScreen({Key? key, required this.plan}) : super(key: key);

  static String id = "ConservativePlanScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plan.title),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffC7EDD8),
                                  borderRadius: BorderRadius.circular(5)),
                              child:
                                  Image.asset("assets/images/Conservative.png")
                                      .p8),
                          const BodySmallText(
                            "Conservative Plan",
                            weight: FontWeight.bold,
                          ).hP8.vP4
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, PreformanceScreen.id);
                            },
                            child: const BodySmallText(
                              "See Performance",
                              color: KHeadTextColor,
                              isUnderlined: true,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            color: KHeadTextColor,
                            size: 20,
                          )
                        ],
                      ),
                    ],
                  ).bP8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const BodyExtraSmallText("Current Value").bP4,
                          const BodySmallText(
                            "2,800 EGP",
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const BodyExtraSmallText("Returns ").bP4,
                          Row(
                            children: [
                              const Icon(
                                Icons.arrow_upward_rounded,
                                size: 18,
                              ),
                              const BodySmallText(
                                "29.7%",
                                weight: FontWeight.bold,
                                color: KHeadTextColor,
                              ).hP4,
                              const BodySmallText(
                                "641.8 EGP",
                                weight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ).p16,
            ).vP8,
            Container(
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BodyExtraSmallText(
                        "Monthly Income",
                        weight: FontWeight.bold,
                      ).bP4,
                      const BodyExtraSmallText(
                        "Yearly Income",
                        weight: FontWeight.bold,
                      ).bP4,
                    ],
                  ),
                  const Divider(
                    thickness: 0.4,
                    color: KUnselectedColor,
                  ).vP8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BodyExtraSmallText(
                        "Monthly Income",
                        weight: FontWeight.bold,
                      ).bP4,
                      const BodyExtraSmallText(
                        "Yearly Income",
                        weight: FontWeight.bold,
                      ).bP4,
                    ],
                  ),
                  const Divider(
                    thickness: 0.4,
                    color: KUnselectedColor,
                  ).vP8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BodyExtraSmallText(
                        "Monthly Income",
                        weight: FontWeight.bold,
                      ).bP4,
                      const BodyExtraSmallText(
                        "Yearly Income",
                        weight: FontWeight.bold,
                      ).bP4,
                    ],
                  ),
                  const Divider(
                    thickness: 0.4,
                    color: KUnselectedColor,
                  ).vP8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BodyExtraSmallText(
                        "Monthly Income",
                        weight: FontWeight.bold,
                      ).bP4,
                      const BodyExtraSmallText(
                        "Yearly Income",
                        weight: FontWeight.bold,
                      ).bP4,
                    ],
                  ),
                ],
              ).p16,
            ).hP16.bP25,
            Container(
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
                children: [
                  const Row(
                    children: [
                      BodyMediumText("Pending Orders"),
                    ],
                  ).bP8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const BodyExtraSmallText(
                              "You don’t have any pending orders yet")
                          .hP8,
                      const Icon(
                        Icons.remove,
                        size: 22,
                        color: KMainTextColor,
                      ),
                    ],
                  )
                ],
              ).p16,
            ).hP16.bP16,
            Container(
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
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BodyMediumText("My Positions"),
                      Icon(
                        Icons.remove,
                        size: 22,
                        color: KMainTextColor,
                      ),
                    ],
                  ).bP8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BodyExtraSmallText(
                            "Purchase Value",
                            weight: FontWeight.bold,
                            color: Colors.grey,
                          ).bP4,
                          const BodyExtraSmallText(
                            "2158.2",
                            weight: FontWeight.bold,
                          ).bP8,
                          const BodyExtraSmallText(
                            "Profit",
                            weight: FontWeight.bold,
                            color: Colors.grey,
                          ).bP4,
                          const BodyExtraSmallText(
                            "641.80",
                            weight: FontWeight.bold,
                            color: KHeadTextColor,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BodyExtraSmallText(
                            "Current Value",
                            weight: FontWeight.bold,
                            color: Colors.grey,
                          ).bP4,
                          const BodyExtraSmallText(
                            "2,800",
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ).bP16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultTextButton(
                          context: context,
                          function: () {},
                          text: "Sell",
                          width: 150,
                          color: KUnselectedColor.withOpacity(0.5),
                          hasBorder: true,
                          borderColor: KUnselectedColor,
                          textColor: KMainTextColor),
                      DefaultTextButton(
                          context: context,
                          function: () {},
                          text: "Buy",
                          width: 150,
                          textColor: Colors.white,
                          color: KMainTextColor)
                    ],
                  )
                ],
              ).p16,
            ).hP16
          ],
        ),
      ),
    );
  }
}
