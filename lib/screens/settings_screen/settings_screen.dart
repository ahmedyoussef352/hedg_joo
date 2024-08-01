import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/notifications_settings_screen/notifications_settings_screen.dart';

import '../../components/components.dart';
import '../../components/custom_texts.dart';
import '../../constants/constant_colors.dart';
import '../auth/login_screen/login_screen.dart';
import '../faq_screen/faq_screen.dart';
import '../security_screen/security_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static String id = "SettingsScreen";

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
          "Settings",
          weight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                      Navigator.pushNamed(
                          context, NotificationsSettingsScreen.id);
                    },
                    title: "Notifications settings",
                  ).bP16,
                  SettingsItem(
                    onTap: () {
                      Navigator.pushNamed(context, SecurityScreen.id);
                    },
                    title: "Security",
                  ).bP16,
                  SettingsItem(
                    onTap: () {},
                    title: "Privacy",
                  ).bP16,
                  SettingsItem(
                    onTap: () {
                      Navigator.pushNamed(context, FaqScreen.id);
                    },
                    title: "FAQs",
                  ).bP16,
                  SettingsItem(
                      onTap: () {
                        AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                            onDismissCallback: (DismissType type) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, LoginScreen.id, (route) => false);
                            },
                            body: Column(
                              children: [
                                const BodyLargeText(
                                  "Done",
                                  weight: FontWeight.normal,
                                  color: KHeadTextColor,
                                ).bp(50),
                                const BodyMediumText(
                                  "this bank account has been deleted successfully",
                                  weight: FontWeight.normal,
                                  color: KMainTextColor,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ).bp(50),
                              ],
                            )).show();
                      },
                      title: "Delete account",
                      isRed: true),
                ],
              ).p25,
            ).tp(50).bP25,
            InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.id, (route) => false);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.logout_rounded,
                    color: KMainTextColor.withOpacity(0.7),
                  ),
                  BodyMediumText(
                    "Logout",
                    color: KMainTextColor.withOpacity(0.7),
                    isUnderlined: true,
                  ).hP8,
                ],
              ).lP25,
            )
          ],
        ).p16,
      ),
    );
  }
}
