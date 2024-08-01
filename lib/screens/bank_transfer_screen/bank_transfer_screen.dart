import 'package:flutter/material.dart';
import 'package:hedg/constants/constant_sizes.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/cash_deposit_screen/cash_deposit_screen.dart';
import 'package:hedg/screens/wire_transfer_screen/wire_transfer_screen.dart';

import '../../components/custom_texts.dart';

class BankTransferScreen extends StatelessWidget {
  const BankTransferScreen({super.key});

  static String id = "BankTransferScreen";

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
          "Top-up using bank services",
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
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              onTap: () {
                Navigator.pushNamed(context, CashDepositScreen.id);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/money.png"),
                          const BodyMediumText(
                            "Cash Deposit",
                            weight: FontWeight.bold,
                          ).hP16
                        ],
                      ).bP16,
                      SizedBox(
                        width: AppSizes.getScreenWidth(context) * 0.7,
                        child: const BodySmallText(
                          "Make a cash deposit to our back account",
                          maxLines: 2,
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded)
                ],
              ).p16,
            ),
          ).bP25,
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
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              onTap: () {
                Navigator.pushNamed(context, WireTransferScreen.id);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/wire-transfer.png"),
                          const BodyMediumText(
                            "Wire Transfer",
                            weight: FontWeight.bold,
                          ).hP16
                        ],
                      ).bP16,
                      SizedBox(
                        width: AppSizes.getScreenWidth(context) * 0.7,
                        child: const BodySmallText(
                          "Make a wire transfer from your back account to ours.",
                          maxLines: 2,
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded)
                ],
              ).p16,
            ),
          ),
        ],
      ).p16,
    );
  }
}
