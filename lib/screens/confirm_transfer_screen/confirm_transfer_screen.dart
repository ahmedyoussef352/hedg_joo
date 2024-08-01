import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/home_screen/home_screen.dart';

import '../../components/custom_texts.dart';
import '../../components/default_formfield.dart';
import '../../constants/constant_colors.dart';
import '../../constants/constant_sizes.dart';

class ConfirmTransferScreen extends StatelessWidget {
  ConfirmTransferScreen({super.key});

  static String id = "ConfirmTransferScreen";
  final formKey = GlobalKey<FormState>();
  final dateDepositedController = TextEditingController();
  final amountDepositedController = TextEditingController();

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
          "Confirm Transfer",
          weight: FontWeight.bold,
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
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
                      "Date Deposited",
                      weight: FontWeight.bold,
                    ).bP16,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BodySmallText(
                          "Date Deposited",
                          weight: FontWeight.bold,
                        ).bP8,
                        DefaultFormField(
                          controller: dateDepositedController,
                          type: TextInputType.text,
                          readOnly: true,
                          suffix: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  useSafeArea: true,
                                  enableDrag: true,
                                  showDragHandle: true,
                                  constraints: const BoxConstraints(
                                    minHeight: 200,
                                    maxHeight: 300,
                                  ),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  context: context,
                                  builder: (context) => CupertinoDatePicker(
                                        initialDateTime: DateTime.now(),
                                        mode: CupertinoDatePickerMode.date,
                                        onDateTimeChanged: (value) {
                                          dateDepositedController.text =
                                              "${value.day}/${value.month}/${value.year}";
                                        },
                                      ));
                            },
                            icon: const Icon(
                              Icons.date_range_rounded,
                              color: KMainTextColor,
                            ),
                          ),
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "please enter date deposited";
                            }
                            return null;
                          },
                          label: "Date Deposited",
                        ).bP16,
                        const BodySmallText(
                          "Amount Deposited",
                          weight: FontWeight.bold,
                        ).bP8,
                        DefaultFormField(
                          controller: amountDepositedController,
                          type: TextInputType.number,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "please enter amount deposited";
                            }
                            return null;
                          },
                          label: "Amount Deposited",
                        ).bP16,
                      ],
                    ).hP4,
                    const BodySmallText(
                      "Funds will be added to your wallet after 1 working day!",
                      maxLines: 2,
                    ).bP16,
                  ],
                ).p16,
              ).bP16,
              const BodySmallText(
                "Transfers must be from a bank account in your own name.",
                maxLines: 2,
                textAlign: TextAlign.start,
                color: Colors.red,
              ).bp(100).hP25,
              DefaultTextButton(
                  context: context,
                  function: () {
                    if (formKey.currentState!.validate()) {
                      AwesomeDialog(
                          context: context,
                          dialogType: DialogType.success,
                          animType: AnimType.rightSlide,
                          onDismissCallback: (value) {
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                HomeScreen.id,
                                ModalRoute.withName(HomeScreen.id));
                          },
                          body: Column(
                            children: [
                              const BodyLargeText(
                                "Done",
                                weight: FontWeight.normal,
                                color: KHeadTextColor,
                              ).bp(50),
                              const BodyMediumText(
                                "We will review your account and get back to you very shortly",
                                weight: FontWeight.normal,
                                color: KMainTextColor,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ).bp(50),
                            ],
                          )).show();
                    }
                  },
                  text: "Send Details",
                  color: KMainTextColor)
            ],
          ).p16,
        ),
      ),
    );
  }
}
