import 'package:flutter/material.dart';
import 'package:hedg/components/default_formfield.dart';
import 'package:hedg/constants/constant_sizes.dart';
import 'package:hedg/extention/extetion.dart';

import '../../components/components.dart';
import '../../components/custom_texts.dart';
import '../../constants/constant_colors.dart';

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen({super.key});

  static String id = "MyAccountScreen";
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

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
          "My Account",
          weight: FontWeight.bold,
        ),
      ),
      body: SizedBox(
        height: AppSizes.getScreenHeight(context) * 0.9,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: KHeadTextColor.withOpacity(0.2),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  color: KHeadTextColor,
                                ).p8,
                              ),
                              const BodyMediumText(
                                "Jacob Smith",
                                weight: FontWeight.bold,
                              ).hP16.bP4,
                            ],
                          ),
                          const Icon(Icons.more_vert_rounded),
                        ],
                      ).p16,
                    ),
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
                      children: [
                        const BodyMediumText("Profile Details",
                                weight: FontWeight.bold)
                            .bP16,
                        DefaultFormField(
                                controller: nameController,
                                type: TextInputType.text,
                                validate: (value) {
                                  return null;
                                },
                                readOnly: true,
                                hint: "Jacob Smith")
                            .bP16,
                        DefaultFormField(
                                controller: nameController,
                                type: TextInputType.text,
                                validate: (value) {
                                  return null;
                                },
                                readOnly: true,
                                hint: "jacobsmith@example.com")
                            .bP16,
                        DefaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (value) {
                            return null;
                          },
                          hint: "12345678910",
                          readOnly: true,
                          prefix: InkWell(
                            onTap: () {},
                            child: SizedBox(
                              width: 60,
                              child: BodyMediumText(
                                "+20",
                                color: KMainTextColor.withOpacity(0.7),
                              ).hP8,
                            ),
                          ),
                        ).bP25.tP16,
                      ],
                    ).p16,
                  ),
                ],
              ).bp(50),
              DefaultTextButton(
                  context: context,
                  function: () {},
                  text: "Save",
                  color: KMainTextColor)
            ],
          ).p16,
        ),
      ),
    );
  }
}
