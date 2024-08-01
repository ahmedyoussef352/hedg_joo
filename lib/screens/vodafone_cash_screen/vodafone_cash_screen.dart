import 'package:flutter/material.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/constants/constant_sizes.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/vodafone_cash_screen/vodafone_cash_payment.dart';

import '../../components/custom_texts.dart';

class VodafoneCashScreen extends StatelessWidget {
  const VodafoneCashScreen({super.key});

  static String id = "VodafoneCashScreen";

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
                          "Enter Wallet Phone Number",
                          weight: FontWeight.bold,
                        ).bP16,
                        const BodyExtraSmallText(
                          "Please enter your e-wallet phone number that you will transfer from.",
                          textAlign: TextAlign.start,
                        ).bP8,
                        const BodyExtraSmallText(
                          "Vodafone Cash Phone Number:",
                        ).bP25,
                        const Center(
                          child: BodyExtraSmallText(
                            "+2 e.g.  0123456789",
                            weight: FontWeight.bold,
                          ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BodyExtraSmallText(
                          "We can’t guarantee the reliability of non-vodafone cash wallets.",
                          textAlign: TextAlign.start,
                        ).bP16,
                        const BodyExtraSmallText(
                          "By submitting this transfer, you are confirming that the number used in the transfer is associated with you. ",
                          textAlign: TextAlign.start,
                        ).bP8,
                      ],
                    ).p16.vP16,
                  ),
                ],
              ),
              DefaultTextButton(
                  context: context,
                  function: () {
                    Navigator.pushNamed(context, VodafoneCashPayment.id);
                  },
                  text: "Next",
                  color: KMainTextColor)
            ],
          ).p16,
        ),
      ),
    );
  }
}
