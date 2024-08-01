import 'package:flutter/material.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/constants/constant_sizes.dart';
import 'package:hedg/extention/extetion.dart';

import '../../components/custom_texts.dart';

class DebitCardScreen extends StatelessWidget {
  DebitCardScreen({super.key});

  static String id = "DebitCardScreen";
  final amountController = TextEditingController();

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
          "Debit card top-up",
          weight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Container(
            width: AppSizes.getScreenWidth(context),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BodyMediumText(
                  "How much to to-up with?",
                  weight: FontWeight.bold,
                ).bP16,
                Row(
                  children: [
                    const BodyMediumText("EGP"),
                    SizedBox(
                      height: 50,
                      width: 110,
                      child: TextField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 25),
                              cursorHeight: 0)
                          .hP8,
                    ),
                  ],
                ).hP25.bP25,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const BodyExtraSmallText(
                          "Service fees",
                          color: Colors.grey,
                        ),
                        const Icon(
                          Icons.help,
                          color: Colors.grey,
                          size: 15,
                        ).hP8,
                      ],
                    ),
                    const BodyExtraSmallText(
                      "EGP 10.00",
                      color: Colors.grey,
                    )
                  ],
                ).hP16.bP25,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BodyExtraSmallText(
                      "Credit or International cards ",
                      color: Colors.grey,
                    ),
                    BodyExtraSmallText(
                      "are not accepted",
                      color: Colors.grey,
                      isUnderlined: true,
                    ),
                  ],
                ),
              ],
            ).p16,
          ).bP25,
          DefaultTextButton(
              context: context,
              subText: amountController.text,
              function: () {},
              text: "Confirm",
              color: KMainTextColor)
        ],
      ).p16,
    );
  }
}
