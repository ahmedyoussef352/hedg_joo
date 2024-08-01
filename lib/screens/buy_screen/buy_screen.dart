import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hedg/extention/extetion.dart';

import '../../components/components.dart';
import '../../components/custom_texts.dart';
import '../../components/default_formfield.dart';
import '../../constants/constant_colors.dart';
import '../home_screen/home_screen.dart';

class BuyScreen extends StatelessWidget {
  BuyScreen({
    super.key,
  });

  static String id = "BuyScreen";
  final amountController = TextEditingController();
  final minAmountController = TextEditingController();
  final maxAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List plan = ModalRoute.of(context)!.settings.arguments as List;
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
          "Buying Plan",
          weight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.remove,
                            size: 28,
                            color: Colors.red,
                          ).p4,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 200,
                        child: DefaultFormField(
                            controller: amountController,
                            readOnly: true,
                            type: TextInputType.number,
                            isCenter: true,
                            validate: (value) {
                              return null;
                            },
                            label: "0 EGP"),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: KHeadTextColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.add,
                            size: 28,
                            color: KHeadTextColor,
                          ).p4,
                        ),
                      ),
                    ],
                  ).bP16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const BodySmallText(
                            "Min Amount",
                          ).bP8,
                          SizedBox(
                            height: 40,
                            width: 100,
                            child: DefaultFormField(
                                controller: minAmountController,
                                type: TextInputType.number,
                                isCenter: true,
                                validate: (value) {
                                  return null;
                                },
                                label: "0"),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const BodySmallText(
                            "Max Amount",
                          ).bP8,
                          SizedBox(
                            height: 40,
                            width: 100,
                            child: DefaultFormField(
                                controller: maxAmountController,
                                type: TextInputType.number,
                                isCenter: true,
                                validate: (value) {
                                  return null;
                                },
                                label: "0"),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ).p16,
            ),
            const BodySmallText(
              "You are buying conservative plan Amount 800.00 EGP",
              maxLines: 3,
            ).hp(50).vP16,
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
                  ExploreItem(
                    context: context,
                    isBuy: true,
                    title: plan[0] == 0
                        ? "Conservative plan"
                        : plan[0] == 1
                            ? "Moderated plan"
                            : plan[0] == 2
                                ? "Aggressive plan"
                                : "44",
                    color: plan[0] == 0
                        ? const Color(0xffC7EDD8)
                        : plan[0] == 1
                            ? const Color(0xffFAEBD1)
                            : const Color(0xffF5D8D8),
                    image: plan[0] == 0
                        ? "assets/images/Conservative.png"
                        : plan[0] == 1
                            ? "assets/images/Moderated.png"
                            : "assets/images/Aggressive.png",
                  ).bP8,
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: KUnselectedColor,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [BodySmallText("Market"), BodySmallText("EGY")],
                    ).p16,
                  ).bP8,
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: KUnselectedColor,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BodySmallText("Asset manager"),
                        BodySmallText(
                          "Azimut",
                          color: KHeadTextColor,
                        )
                      ],
                    ).p16,
                  ).bP8,
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: KUnselectedColor,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BodySmallText("Investment Amount"),
                        BodySmallText(
                          "800.00",
                          color: KHeadTextColor,
                        )
                      ],
                    ).p16,
                  ).bP8,
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: KUnselectedColor,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BodySmallText("Transaction fees"),
                        BodySmallText(
                          "10 EGP",
                          color: KHeadTextColor,
                        )
                      ],
                    ).p16,
                  ).bP8,
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: KUnselectedColor,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BodySmallText("Estimated Total "),
                        BodySmallText(
                          "810.00",
                          color: KHeadTextColor,
                        )
                      ],
                    ).p16,
                  ).bP8
                ],
              ).p16,
            ).bP16,
            DefaultTextButton(
                context: context,
                function: () {
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.rightSlide,
                      onDismissCallback: (DismissType type) {
                        Navigator.pushNamed(context, HomeScreen.id);
                      },
                      body: Column(
                        children: [
                          const BodyLargeText(
                            "Invested Successfully",
                            weight: FontWeight.normal,
                            color: KHeadTextColor,
                          ).bp(25),
                          const BodyMediumText(
                            "you just have paid for Conservative Plan",
                            weight: FontWeight.normal,
                            color: KMainTextColor,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ).bp(50).hp(50),
                        ],
                      )).show();
                },
                text: "Next",
                color: KMainTextColor)
          ],
        ).p16,
      ),
    );
  }
}
