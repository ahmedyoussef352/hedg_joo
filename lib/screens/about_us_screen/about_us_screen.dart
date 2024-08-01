import 'package:flutter/material.dart';
import 'package:hedg/constants/constant_sizes.dart';
import 'package:hedg/extention/extetion.dart';

import '../../components/custom_texts.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  static String id = "AboutUsScreen";

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
          "About Us",
          weight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
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
              child: Image.asset(
                "assets/images/greenLogo.png",
                scale: 2,
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
              child: const BodySmallText(
                "We are a group of entrepreneurs, investment advisors, and tech gurus. Who wants to expose the value of investing to the public. We help you make the best value of your money, by investing your savings into the financial markets in a professional way with no hassle. Our mission is to help individuals build their own wealth by providing digital access to buy, track, and compare investment funds in a smooth way. We do care about numbers since numbers are our key measurement value of success. Saving in banks for CDs or TDs is very well known nowadays, however, the other assets are still an ambiguity to most of the public. We wish to standardize it for most individuals to get the best value of their savings by investing.",
                maxLines: 20,
                textAlign: TextAlign.start,
              ).p16,
            ).bP16
          ],
        ).p16,
      ),
    );
  }
}
