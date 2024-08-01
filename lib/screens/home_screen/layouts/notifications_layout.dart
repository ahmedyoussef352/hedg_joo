import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hedg/extention/extetion.dart';

import '../../../components/components.dart';

class NotificationsLayout extends StatelessWidget {
  const NotificationsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotificationItem(
                color: const Color(0xffF5D8D8),
                image: "assets/images/Aggressive.png",
                title: "Aggressive Plan",
                subTitle:
                    "You Paid Successfully For New Instruments In Aggressive Plan ",
                date: "3 m ago")
            .bP16,
        NotificationItem(
                color: const Color(0xffC9E3F1),
                image: "assets/images/Customized.png",
                title: "Cusomized Plan",
                subTitle:
                    "Your Return Percentage Has Been Less Than The Previous Month",
                date: "4 days ago")
            .bP16,
        NotificationItem(
                color: const Color(0xffFAEBD1),
                image: "assets/images/Moderated.png",
                title: "Moderated Plan Fund",
                subTitle: "You Got A Return 275 EGP Conceptive Plan Fund",
                date: "a week ago")
            .bP16,
        NotificationItem(
                color: const Color(0xffFAEBD1),
                title: "Don't Miss Your Session !",
                subTitle:
                    "Your Expert Session Has Been Approved To Be On 22 Feb 2023",
                date: "2 weeks ago")
            .bP16,
        NotificationItem(
                color: const Color(0xffFAEBD1),
                title: "Buy More- Make More",
                subTitle:
                    "Buy More Funds And You Will Make More Money By Investing With Us",
                date: "1 month ago")
            .bP16,
      ],
    ).p16;
  }
}
