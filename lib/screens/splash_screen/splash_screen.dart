import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hedg/components/custom_texts.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/constants/constant_sizes.dart';
import 'package:hedg/screens/onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  final String id = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, OnboardingScreen.id);
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: AppSizes.getScreenHeight(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/hedgLogo.png"),
              const BodyExtraLargeText(
                "HEDG",
                textAlign: TextAlign.center,
                weight: FontWeight.bold,
                color: KHeadTextColor,
              ),
              const BodySmallText("INVEST IN YOUR MONEY",
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
