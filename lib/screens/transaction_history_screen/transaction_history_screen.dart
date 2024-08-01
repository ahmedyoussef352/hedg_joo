import 'package:flutter/material.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/extention/extetion.dart';

import '../../components/components.dart';
import '../../components/custom_texts.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  static String id = "TransactionHistoryScreen";

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
          "Transactions History",
          weight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BodyMediumText(
              "Feb 2022",
              weight: FontWeight.bold,
            ).bP16,
            TransactionsItem(
              date: "18 Feb 2022",
              icon: const Icon(
                Icons.account_balance,
                size: 18,
                color: KMainTextColor,
              ),
              status: "Withdraw",
              amount: "800 EGP",
              info: "Account **** 9351",
              isIncome: false,
            ).bP8,
            TransactionsItem(
              date: "10 Feb 2022",
              icon: Image.asset(
                "assets/images/vodafone.png",
                scale: 2,
              ),
              status: "Withdraw",
              amount: "1,500 EGP",
              info: "VF cash",
              isIncome: false,
            ).bP8,
            TransactionsItem(
              date: "6 Feb 2022",
              icon: Image.asset(
                "assets/images/insta-pay.png",
                scale: 2,
              ),
              status: "Deposit",
              amount: "300 EGP",
              info: "****5231",
              isIncome: true,
            ).bP16,
            const BodyMediumText(
              "Dec 2021",
              weight: FontWeight.bold,
            ).bP16,
            TransactionsItem(
              date: "1 Dec 2021",
              icon: Image.asset(
                "assets/images/credit-card.png",
                scale: 2,
              ),
              status: "Deposit",
              amount: "800 EGP",
              info: "Visa****5231",
              isIncome: true,
            ).bP16,
            const BodyMediumText(
              "Oct 2021",
              weight: FontWeight.bold,
            ).bP16,
            TransactionsItem(
              date: "10 Oct 2021",
              icon: const Icon(
                Icons.account_balance,
                size: 18,
                color: KMainTextColor,
              ),
              status: "Deposit",
              amount: "500 EGP",
              info: "Account **** 9351",
              isIncome: false,
            ).bP8,
            TransactionsItem(
              date: "1 Dec 2021",
              icon: Image.asset("assets/images/insta-pay.png", scale: 2),
              status: "Deposit",
              amount: "500 EGP",
              info: "****5231",
              isIncome: true,
            ).bP8,
          ],
        ).p16,
      ),
    );
  }
}
