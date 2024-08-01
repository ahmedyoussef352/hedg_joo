import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/constants/constant_sizes.dart';
import 'package:hedg/extention/extetion.dart';

import '../../components/components.dart';
import '../../components/custom_texts.dart';
import '../../components/default_formfield.dart';
import '../../constants/constant_colors.dart';
import '../bank_info_screen/bank_info_cubit.dart';

class AddAccScreen extends StatelessWidget {
  const AddAccScreen({super.key});

  static String id = "AddAccScreen";

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<BankInfoCubit>(context);
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
          "Bank Information",
          weight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
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
                    // ignore: prefer_const_constructors
                    BodyMediumText("Bank Information").bP16,
                    DefaultFormField(
                      controller: cubit.nameController,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "please enter your your full name";
                        }
                        return null;
                      },
                      label: "Your full name",
                    ).bP16,
                    DefaultFormField(
                      controller: cubit.bankNameController,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "please enter your bank Name";
                        }
                        return null;
                      },
                      label: "Bank Name",
                    ).bP16,
                    DefaultFormField(
                      controller: cubit.accNumberController,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "please enter your bank account number";
                        }
                        return null;
                      },
                      label: "Bank account number",
                    ).bP16,
                    DefaultFormField(
                      controller: cubit.IBANController,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "please enter your IBAN";
                        }
                        return null;
                      },
                      label: "IBAN",
                    ),
                  ],
                ).p16,
              ).bp(50),
              DefaultTextButton(
                      context: context,
                      function: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.addAccount();
                          Navigator.pop(context);
                        }
                      },
                      text: "Save",
                      color: KMainTextColor)
                  .p16
            ],
          ).p16,
        ),
      ),
    );
  }
}
