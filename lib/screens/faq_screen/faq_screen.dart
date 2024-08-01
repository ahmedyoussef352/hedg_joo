import 'package:flutter/material.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/extention/extetion.dart';

import '../../components/custom_texts.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  static String id = "FaqScreen";

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
          "FAQ",
          weight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BodyMediumText(
              "Frequently Asked Questions",
              weight: FontWeight.bold,
            ).bP16,
            FAQExpansionTile(title: 'Who Is Available To Help?', children: [
              const BodyExtraSmallText(
                "Our team offers personalized support for technical issues, financial moves, and professional guidance, including one-on-one advice from Certified Financial Planners™.",
                textAlign: TextAlign.start,
              )
            ]).bP8,
            FAQExpansionTile(title: 'How Is Digivst Different?', children: [
              const BodyExtraSmallText(
                "Our team offers personalized support for technical issues, financial moves, and professional guidance, including one-on-one advice from Certified Financial Planners™.",
                textAlign: TextAlign.start,
              )
            ]).bP8,
            FAQExpansionTile(
                title: 'Who Is Eligible To Use Digivst?',
                children: [
                  const BodyExtraSmallText(
                    "Our team offers personalized support for technical issues, financial moves, and professional guidance, including one-on-one advice from Certified Financial Planners™.",
                    textAlign: TextAlign.start,
                  )
                ]).bP8,
            FAQExpansionTile(title: 'What Are Digivst’s Fees?', children: [
              const BodyExtraSmallText(
                "Our team offers personalized support for technical issues, financial moves, and professional guidance, including one-on-one advice from Certified Financial Planners™.",
                textAlign: TextAlign.start,
              )
            ]).bP8,
            FAQExpansionTile(
                title: 'What Mobile Platform Does Digivst Support?',
                children: [
                  const BodyExtraSmallText(
                    "Our team offers personalized support for technical issues, financial moves, and professional guidance, including one-on-one advice from Certified Financial Planners™.",
                    textAlign: TextAlign.start,
                  )
                ]).bP8,
            FAQExpansionTile(
                title: 'Is My Personal Information Safe With Digivst?',
                children: [
                  const BodyExtraSmallText(
                    "Our team offers personalized support for technical issues, financial moves, and professional guidance, including one-on-one advice from Certified Financial Planners™.",
                    textAlign: TextAlign.start,
                  )
                ]).bP8,
            FAQExpansionTile(
                title: 'Can I Invest In An Individual Stock?',
                children: [
                  const BodyExtraSmallText(
                    "Our team offers personalized support for technical issues, financial moves, and professional guidance, including one-on-one advice from Certified Financial Planners™.",
                    textAlign: TextAlign.start,
                  )
                ]).bP8,
            FAQExpansionTile(
                title: 'Can I Move My Money Out If I Want To?',
                children: [
                  const BodyExtraSmallText(
                    "Our team offers personalized support for technical issues, financial moves, and professional guidance, including one-on-one advice from Certified Financial Planners™.",
                    textAlign: TextAlign.start,
                  )
                ]).bP8,
            FAQExpansionTile(title: 'How To Withdraw My Money?', children: [
              const BodyExtraSmallText(
                "Our team offers personalized support for technical issues, financial moves, and professional guidance, including one-on-one advice from Certified Financial Planners™.",
                textAlign: TextAlign.start,
              )
            ]),
          ],
        ).p16,
      ),
    );
  }
}
