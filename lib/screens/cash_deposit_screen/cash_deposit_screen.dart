import 'package:flutter/material.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/confirm_deposit_screen/confirm_deposit_screen.dart';

import '../../components/custom_texts.dart';
import '../../components/default_formfield.dart';
import '../../constants/constant_sizes.dart';

class CashDepositScreen extends StatelessWidget {
  CashDepositScreen({super.key});

  static String id = "CashDepositScreen";
  final formKey = GlobalKey<FormState>();
  final bankNameController = TextEditingController();
  final beneficiaryNameController = TextEditingController();
  final beneficiaryAddressController = TextEditingController();
  final accountNumberController = TextEditingController();

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
          "Cash Deposit",
          weight: FontWeight.bold,
        ),
      ),
      body: SizedBox(
        height: AppSizes.getScreenHeight(context),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const BodyExtraSmallText(
                      "Proceed to the nearest ENBD branch and make a deposit with the following details, then confirm transfer on HEDG app.",
                      textAlign: TextAlign.start,
                    ).bP16,
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
                          const BodySmallText(
                            "Bank Name",
                            weight: FontWeight.bold,
                          ).bP8,
                          DefaultFormField(
                            controller: bankNameController,
                            type: TextInputType.text,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "please enter bank name";
                              }
                              return null;
                            },
                            label: "Bank Name",
                          ).bP16,
                          const BodySmallText(
                            "Beneficiary Name",
                            weight: FontWeight.bold,
                          ).bP8,
                          DefaultFormField(
                            controller: beneficiaryNameController,
                            type: TextInputType.text,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "please enter beneficiary name";
                              }
                              return null;
                            },
                            label: "Beneficiary Name",
                          ).bP16,
                          const BodySmallText(
                            "Beneficiary Address",
                            weight: FontWeight.bold,
                          ).bP8,
                          DefaultFormField(
                            controller: beneficiaryAddressController,
                            type: TextInputType.text,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "please enter beneficiary address ";
                              }
                              return null;
                            },
                            label: "Beneficiary Address",
                          ).bP16,
                          const BodySmallText(
                            "Account Number",
                            weight: FontWeight.bold,
                          ).bP8,
                          DefaultFormField(
                            controller: accountNumberController,
                            type: TextInputType.number,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "please enter account number";
                              }
                              return null;
                            },
                            label: "Account Number",
                          ).bP16,
                        ],
                      ).p16,
                    ).bP25,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BodySmallText(
                          "Please keep a photo of your deposit receipt to confirm your deposit. The amount will be credited within 1 working days after funds receipt. ",
                          maxLines: 4,
                          textAlign: TextAlign.start,
                          color: Colors.red,
                        ).bP16,
                        const BodySmallText(
                          "Note: ATM deposits are not supported!",
                          maxLines: 2,
                          color: Colors.red,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ).hP16,
                  ],
                ).bp(100),
                DefaultTextButton(
                    context: context,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, ConfirmDepositScreen.id);
                      }
                    },
                    text: "Confirm Deposit",
                    color: KMainTextColor),
              ],
            ).p16,
          ),
        ),
      ),
    );
  }
}
