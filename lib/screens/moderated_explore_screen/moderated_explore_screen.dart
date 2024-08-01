import 'package:flutter/material.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/preformance_screen/preformance_screen.dart';

import '../../components/components.dart';
import '../../components/custom_texts.dart';
import '../../models/plan.dart';
import '../buy_screen/buy_screen.dart';
import '../calculator_screen/calculator_screen.dart';

class ModeratedExploreScreen extends StatelessWidget {
  final Plan plan;

  const ModeratedExploreScreen({Key? key, required this.plan}) : super(key: key);

  static String id = "ModeratedExploreScreen";
  @override
  Widget build(BuildContext context) {
    print(plan.assetAllocation);
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
        title: BodyMediumText(
          plan.title,
          weight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExploreItem(
              context: context,
              title: plan.title,
              subTitle: plan.shortDescription,
              color: Color(int.parse(plan.color, radix: 16)),
              image: "assets/images/Moderated.png",
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
            BodySmallText(
              plan.description,
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
                      BodySmallText(plan.assetManager)
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
                      BodySmallText(plan.riskProfile)
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
                      BodySmallText(plan.subscriptionFreq)
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
                      BodySmallText(plan.redemptionFreq)
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
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: plan.assetAllocation.length,
                itemBuilder: (context, index){
                  var asset = plan.assetAllocation[index];

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              BodySmallText(asset['name']!),
                            ],
                          ),
                          BodySmallText(asset['value']!),
                        ],
                      ),
                      const Divider(
                        color: KUnselectedTabColor,
                      ).hP16.vP8,
                    ],
                  ).p16;
                },

              ),
            ).bP16,
            DefaultTextButton(
                context: context,
                function: () {
                  Navigator.pushNamed(context, BuyScreen.id, arguments: [1]);
                },
                text: "Buy",
                color: KMainTextColor)
          ],
        ).p16,
      ),
    );
  }
}
