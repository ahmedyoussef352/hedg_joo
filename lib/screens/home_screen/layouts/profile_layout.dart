import 'package:flutter/material.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/about_us_screen/about_us_screen.dart';
import 'package:hedg/screens/bank_info_screen/bank_info_screen.dart';
import 'package:hedg/screens/settings_screen/settings_screen.dart';
import 'package:hedg/screens/terms_conditions_screen/terms_conditions_screen.dart';
import 'package:hedg/screens/transaction_history_screen/transaction_history_screen.dart';

import '../../../components/components.dart';
import '../../../components/custom_texts.dart';
import '../../my_account_screen/my_account_screen.dart';

class ProfileLayout extends StatelessWidget {
  const ProfileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Navigator.pushNamed(context, MyAccountScreen.id);
              },
              child: Row(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BodyMediumText(
                        "Jacob Smith",
                        weight: FontWeight.bold,
                      ).hP16.bP4,
                      const BodyExtraSmallText(
                        "jacobsmith@example.com",
                        color: KHeadTextColor,
                      ).hP16.bP8
                    ],
                  )
                ],
              ).p16,
            ),
          ).bP16,
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
                ProfileItem(
                  onTap: () {
                    Navigator.pushNamed(context, BankInfoScreen.id);
                  },
                  title: "Insights And Performance",
                  icon: Icons.account_balance,
                ),
                const Divider(
                  color: KUnselectedTabColor,
                ).vP8,
                ProfileItem(
                  onTap: () {
                    Navigator.pushNamed(context, TransactionHistoryScreen.id);
                  },
                  title: "Transactions History",
                  icon: Icons.history,
                ),
              ],
            ).p16,
          ).bP16,
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
                ProfileItem(
                  onTap: () {},
                  title: "Insights And Performance",
                  icon: Icons.trending_up_rounded,
                ),
                const Divider(
                  color: KUnselectedTabColor,
                ).vP8,
                ProfileItem(
                  onTap: () {},
                  title: "HEDG Learn",
                  icon: Icons.support_agent,
                ),
              ],
            ).p16,
          ).bP16,
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
                ProfileItem(
                  onTap: () {
                    Navigator.pushNamed(context, SettingsScreen.id);
                  },
                  title: "Settings",
                  icon: Icons.settings_outlined,
                ),
                const Divider(
                  color: KUnselectedTabColor,
                ).vP8,
                ProfileItem(
                  onTap: () {
                    Navigator.pushNamed(context, AboutUsScreen.id);
                  },
                  title: "About Us",
                  icon: Icons.info_rounded,
                ),
                const Divider(
                  color: KUnselectedTabColor,
                ).vP8,
                ProfileItem(
                  onTap: () {
                    Navigator.pushNamed(context, TermsConditionsScreen.id);
                  },
                  title: "Terms & Conditions",
                  icon: Icons.gavel_rounded,
                ),
                const Divider(
                  color: KUnselectedTabColor,
                ).vP8,
                ProfileItem(
                  onTap: () {},
                  title: "Change Language, تغير اللغة",
                  icon: Icons.g_translate_rounded,
                ),
                const Divider(
                  color: KUnselectedTabColor,
                ).vP8,
                ProfileItem(
                  onTap: () {},
                  title: "Support",
                  icon: Icons.help_rounded,
                ),
              ],
            ).p16,
          ).bP16
        ],
      ).p16,
    );
  }
}
