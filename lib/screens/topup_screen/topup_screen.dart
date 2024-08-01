import 'package:flutter/material.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/bank_transfer_screen/bank_transfer_screen.dart';
import 'package:hedg/screens/insta_pay_screen/insta_pay_screen.dart';
import 'package:hedg/screens/vodafone_cash_screen/vodafone_cash_screen.dart';

import '../../components/custom_texts.dart';
import '../debit_card_screen/debit_card_screen.dart';

class TopUpScreen extends StatelessWidget {
  const TopUpScreen({super.key});

  static String id = "TopUpScreen";

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
          "Chose top-up method",
          weight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DefaultTextButton(
                    context: context,
                    function: () {},
                    text: "Refer friends, and get EGP 50! ",
                    color: Colors.white,
                    hasBorder: true,
                    borderColor: KHeadTextColor,
                    textColor: KMainTextColor,
                    icon: Icons.rocket_launch_outlined)
                .bP16,
            TopUpItem(
              title: "Pay With Card",
              fees: "Fees Apply",
              duration: "It takes up to 4 mins to process",
              image: "assets/images/credit-card.png",
              onTap: () {
                Navigator.pushNamed(context, DebitCardScreen.id);
              },
            ),
            TopUpItem(
              title: "Pay With InstaPay",
              fees: "No Fees",
              duration: "1 working day after funds received",
              image: "assets/images/insta-pay.png",
              onTap: () {
                Navigator.pushNamed(context, InstaPayScreen.id);
              },
            ),
            TopUpItem(
              title: "Pay With Vodafone Cash",
              fees: "Fees Apply",
              duration: "It takes up to 4 mins to process",
              image: "assets/images/vodafone.png",
              onTap: () {
                Navigator.pushNamed(context, VodafoneCashScreen.id);
              },
            ),
            TopUpItem(
              title: "Bank Transfer",
              fees: "No Fees",
              duration: "1 working day after funds received",
              image: "assets/images/bank-transfer.png",
              onTap: () {
                Navigator.pushNamed(context, BankTransferScreen.id);
              },
            ),
          ],
        ).p16,
      ),
    );
  }
}
