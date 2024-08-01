import 'package:flutter/material.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/components/default_formfield.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/extention/extetion.dart';

import '../../components/custom_texts.dart';

class ChangePassScreen extends StatelessWidget {
  ChangePassScreen({super.key});

  static String id = "ChangePassScreen";
  final formKey = GlobalKey<FormState>();
  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

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
          "Change Security Question",
          weight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                    children: [
                      // ignore: prefer_const_constructors
                      BodyMediumText(
                        "Change Password",
                        weight: FontWeight.bold,
                      ).bP25,
                      DefaultFormField(
                          controller: currentPassController,
                          type: TextInputType.text,
                          label: "Current Password",
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Current Password";
                            }
                            return null;
                          }).bP16,
                      DefaultFormField(
                          controller: newPassController,
                          type: TextInputType.text,
                          label: "new password",
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter New Password";
                            }
                            return null;
                          }).bP16,
                      DefaultFormField(
                          controller: confirmPassController,
                          type: TextInputType.text,
                          label: "re-password",
                          validate: (value) {
                            if (newPassController.text !=
                                confirmPassController.text) {
                              return "Password doesn't match";
                            }
                            if (value!.isEmpty) {
                              return "Please Enter New Password Again";
                            }
                            return null;
                          }).bP16,
                    ],
                  ).p16),
              DefaultTextButton(
                      context: context,
                      function: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      text: "Save",
                      color: KMainTextColor)
                  .tp(50)
            ],
          ).p16,
        ),
      ),
    );
  }
}
