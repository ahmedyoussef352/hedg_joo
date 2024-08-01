import 'package:flutter/material.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/components/default_formfield.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/extention/extetion.dart';

import '../../components/circle_progress_bar.dart';
import '../../components/custom_texts.dart';

class CustomPlanScreen extends StatelessWidget {
  CustomPlanScreen({super.key});

  static String id = "CustomPlanScreen";
  final stocksController = TextEditingController();
  final goldController = TextEditingController();
  final incomeController = TextEditingController();
  final moneyController = TextEditingController();
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
          "Custom Plan",
          weight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BodyMediumText(
            "Create Your Own Plan",
            weight: FontWeight.bold,
          ).bP16,
          const BodySmallText(
            "By creating your own plan, you are able to adjust the percentage of the assets you want to invest in. You are going to be responsible of all your gains wether it is profit or loss.",
            maxLines: 5,
            textAlign: TextAlign.start,
          ).bP16,
          const BodyMediumText(
            "Plan Details",
            weight: FontWeight.bold,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BodySmallText(
                      "Stocks",
                      weight: FontWeight.bold,
                    ).bP8,
                    SizedBox(
                      height: 30,
                      width: 100,
                      child: DefaultFormField(
                          controller: stocksController,
                          type: TextInputType.number,
                          validate: (value) {
                            return null;
                          },
                          label: "Stocks"),
                    ).bP16,
                    const BodySmallText(
                      "Gold",
                      weight: FontWeight.bold,
                    ).bP8,
                    SizedBox(
                      height: 30,
                      width: 100,
                      child: DefaultFormField(
                          controller: goldController,
                          type: TextInputType.number,
                          validate: (value) {
                            return null;
                          },
                          label: "Gold"),
                    ).bP16,
                    const BodySmallText(
                      "Fixed Income",
                      weight: FontWeight.bold,
                    ).bP8,
                    SizedBox(
                      height: 30,
                      width: 100,
                      child: DefaultFormField(
                          controller: incomeController,
                          type: TextInputType.number,
                          validate: (value) {
                            return null;
                          },
                          label: "Fixed Income"),
                    ).bP16,
                    const BodySmallText(
                      "Money market",
                      weight: FontWeight.bold,
                    ).bP8,
                    SizedBox(
                      height: 30,
                      width: 100,
                      child: DefaultFormField(
                          controller: moneyController,
                          type: TextInputType.number,
                          validate: (value) {
                            return null;
                          },
                          label: "Money market"),
                    ).bP16
                  ],
                ),
                const CircularProgressBar(
                  value: 250,
                  maxValue: 1000,
                  title: "",
                  subTitle: "",
                  color: Color(0xffFEB532),
                )
              ],
            ).p16,
          ).bP16,
          const Center(
            child: BodySmallText(
              "Total percentage must be equal to (100)!",
              color: Colors.red,
            ),
          ).bP16,
          const BodyMediumText(
            "Amount",
            weight: FontWeight.bold,
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      type: TextInputType.number,
                      isCenter: true,
                      validate: (value) {
                        return null;
                      },
                      label: "Enter Amount"),
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
            ).p16,
          ).bP16,
          DefaultTextButton(
              context: context,
              function: () {},
              text: "Create This Plan",
              color: KMainTextColor)
        ],
      ).p16),
    );
  }
}
