import 'package:flutter/material.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/extention/extetion.dart';

import '../../components/custom_texts.dart';
import '../../components/default_formfield.dart';
import '../../constants/constant_sizes.dart';
import '../confirm_transfer_screen/confirm_transfer_screen.dart';

class WireTransferScreen extends StatelessWidget {
  WireTransferScreen({super.key});

  static String id = "WireTransferScreen";
  final formKey = GlobalKey<FormState>();
  final beneficiaryNameController = TextEditingController();
  final beneficiaryAddressController = TextEditingController();
  final bankNameController = TextEditingController();
  final accountNumberController = TextEditingController();
  final IBANController = TextEditingController();

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
          "Wire Transfer to HEDG",
          weight: FontWeight.bold,
        ),
      ),
      body: Form(
        key: formKey,
        child: SizedBox(
          height: AppSizes.getScreenHeight(context),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BodySmallText(
                  "Cope these Info to make a bank transfer. Fees might apply:",
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ).bP16,
                const BodySmallText(
                  "The user name must be mentioned in your transfer, to avoid any delay or transfer might be rejected.",
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  color: Colors.red,
                ).bP16.hP16,
                const BodyExtraSmallText(
                  "Transfer must be from a bank account under your own name, or else might be rejected.",
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  color: Colors.red,
                ).bP16.hP25,
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
                            return "please enter beneficiary address";
                          }
                          return null;
                        },
                        label: "Beneficiary Name",
                      ).bP16,
                      const BodySmallText(
                        "Bank Name",
                        weight: FontWeight.bold,
                      ).bP8,
                      DefaultFormField(
                        controller: bankNameController,
                        type: TextInputType.text,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "please enter bank name ";
                          }
                          return null;
                        },
                        label: "Bank Name",
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
                      const BodySmallText(
                        "IBAN",
                        weight: FontWeight.bold,
                      ).bP8,
                      DefaultFormField(
                        controller: IBANController,
                        type: TextInputType.text,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "please enter IBAN";
                          }
                          return null;
                        },
                        label: "IBAN",
                      ).bP16,
                    ],
                  ).p16,
                ).bP25,
                const BodySmallText(
                  "Please allow 1 working day after funds receipt to credit.",
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  color: Colors.red,
                ).bP16.hP16,
                const BodyExtraSmallText(
                  "Amounts to your wallet. Except for any potential delay from your bank.",
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  color: Colors.red,
                ).bP16.hP25,
                DefaultTextButton(
                    context: context,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, ConfirmTransferScreen.id);
                      }
                    },
                    text: "Confirm Deposit",
                    color: KMainTextColor)
              ],
            ).p16,
          ),
        ),
      ),
    );
  }
}
