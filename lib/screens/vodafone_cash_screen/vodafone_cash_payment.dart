import 'package:flutter/material.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/constants/constant_sizes.dart';
import 'package:hedg/extention/extetion.dart';

import '../../components/custom_texts.dart';

class VodafoneCashPayment extends StatelessWidget {
  VodafoneCashPayment({super.key});

  static String id = "VodafoneCashPayment";
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
          "Vodafone Cash",
          weight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: AppSizes.getScreenHeight(context) * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                          "Amount To Transfer",
                          weight: FontWeight.bold,
                        ).bP25,
                        const BodyExtraSmallText(
                          "Paid Amount (EGP)",
                          textAlign: TextAlign.start,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 35,
                          width: 170,
                          child: TextField(
                                  controller: amountController,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      hintStyle: TextStyle(fontSize: 12),
                                      hintText: "Please enter the Amount"),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 15),
                                  cursorHeight: 0)
                              .hP8,
                        ).bP16,
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BodyExtraSmallText(
                              "Vodafone Cash Fees",
                              weight: FontWeight.bold,
                            ),
                            BodyExtraSmallText(
                              "1.5 %",
                            ),
                          ],
                        ).bP16,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const BodyExtraSmallText(
                              "Estimate Amount",
                              weight: FontWeight.bold,
                            ),
                            BodyExtraSmallText(
                              "${((double.parse("${amountController.text}.0")) + ((double.parse("${amountController.text}.0")) * 0.015)).toStringAsFixed(2)} EGP",
                            ),
                          ],
                        ).bP16,
                        const BodyExtraSmallText(
                          "Maximum deposit of 100,000 EGP",
                        ),
                      ],
                    ).p16,
                  ).bp(50),
                  Container(
                    width: AppSizes.getScreenWidth(context),
                    decoration: BoxDecoration(
                        color: const Color(0xffF8FBC8),
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
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BodyExtraSmallText(
                          "Note: you will be redirected to confirmation page to enter your wallet password & OTP password. ",
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ).p16.vP16,
                  ),
                ],
              ),
              DefaultTextButton(
                  context: context,
                  function: () {},
                  text: "Next",
                  color: amountController.text.isEmpty
                      ? Colors.grey.withOpacity(0.4)
                      : KMainTextColor)
            ],
          ).p16,
        ),
      ),
    );
  }
}
