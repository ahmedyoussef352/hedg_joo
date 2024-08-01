import 'package:flutter/material.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/change_question_screen/change_question_screen.dart';

import '../../components/components.dart';
import '../../components/custom_texts.dart';
import '../change_pass_screen/change_pass_screen.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  static String id = "SecurityScreen";

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
          "Security",
          weight: FontWeight.bold,
        ),
      ),
      body: Column(
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
                SettingsItem(
                  onTap: () {
                    Navigator.pushNamed(context, ChangePassScreen.id);
                  },
                  title: "Change Password",
                ).bP16,
                SettingsItem(
                  onTap: () {
                    Navigator.pushNamed(context, ChangeQuestionScreen.id);
                  },
                  title: "Change/Set Security Question",
                ).bP16,
                SettingsItem(
                  onTap: () {},
                  title: "Add/Change Phone Number",
                ).bP16,
                SettingsItem(
                  onTap: () {},
                  title: "Add/Change Trusted Contact",
                ).bP16,
                SettingsItem(
                  onTap: () {},
                  title: "Change User Name",
                ).bP16,
                SettingsItem(
                  onTap: () {},
                  title: "Change Email",
                ),
              ],
            ).p25,
          ).tp(50).bP25,
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
            child: AppSwitch(
                    title: "Biometrics Enabled",
                    value: true,
                    onChanged: (value) {})
                .p16,
          )
        ],
      ).p25,
    );
  }
}
