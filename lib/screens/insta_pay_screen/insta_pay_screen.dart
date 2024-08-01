import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/constants/constant_sizes.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/confirm_deposit_screen/confirm_deposit_screen.dart';

import '../../components/custom_texts.dart';
import '../../components/default_formfield.dart';

class InstaPayScreen extends StatelessWidget {
  InstaPayScreen({super.key});

  static String id = "InstaPayScreen";
  final bankNameController = TextEditingController();
  final accountNumberController = TextEditingController();
  final receiverNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
          "Instapay",
          weight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BodySmallText("Cope these info to make an InstaPay top-up:")
                  .bP16,
              Container(
                width: AppSizes.getScreenWidth(context),
                decoration: BoxDecoration(
                  color: const Color(0xffDDEAFA),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xff0091FF),
                  ),
                ),
                child: Column(
                  children: [
                    const BodySmallText(
                      "Make a top-up using this reference",
                      weight: FontWeight.bold,
                    ).bP8,
                    const BodySmallText(
                      "Cope this reference to InstaPay transfer notes",
                    ),
                  ],
                ).vP25,
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
                      suffix: IconButton(
                        onPressed: () {
                          Clipboard.setData(
                              ClipboardData(text: bankNameController.text));
                        },
                        icon: const Icon(Icons.copy_rounded),
                      ),
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "please enter bank name";
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
                      type: TextInputType.text,
                      suffix: IconButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(
                              text: accountNumberController.text));
                        },
                        icon: const Icon(Icons.copy_rounded),
                      ),
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "please enter account number";
                        }
                        return null;
                      },
                      label: "Account Number",
                    ).bP16,
                    const BodySmallText(
                      "Receiver Name",
                      weight: FontWeight.bold,
                    ).bP8,
                    DefaultFormField(
                      controller: receiverNameController,
                      type: TextInputType.text,
                      suffix: IconButton(
                        onPressed: () {
                          Clipboard.setData(
                              ClipboardData(text: receiverNameController.text));
                        },
                        icon: const Icon(Icons.copy_rounded),
                      ),
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "please enter receiver name";
                        }
                        return null;
                      },
                      label: "Receiver Name",
                    ).bP16,
                  ],
                ).p16,
              ).bP25,
              Column(
                children: [
                  const BodySmallText(
                    "Please make sure to use the account number for transfers.",
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    color: Colors.red,
                  ).bP16,
                  const BodySmallText(
                    "Transfers must be from a bank account under your own name.",
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    color: Colors.red,
                  ),
                ],
              ).hP25.bp(50),
              DefaultTextButton(
                  context: context,
                  function: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, ConfirmDepositScreen.id);
                    }
                  },
                  text: "Confirm Deposit",
                  color: KMainTextColor)
            ],
          ),
        ),
      ).p16,
    );
  }
}
