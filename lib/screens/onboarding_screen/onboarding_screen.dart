import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/components/custom_texts.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/shared_prefs/shared_prefs.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../auth/login_screen/login_screen.dart';
import 'onboarding_cubit.dart';
import 'onboarding_state.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static String id = "OnboardingScreen";

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<OnboardingCubit>(context);
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) => Scaffold(
        body: Stack(
          children: [
            Center(
              child: PageView(
                controller: cubit.pageController,
                onPageChanged: (value) {
                  cubit.changePage();
                  cubit.currentPage = value;
                  if (cubit.currentPage == 2) {
                    cubit.isLastPage = true;
                  } else {
                    cubit.isLastPage = false;
                  }
                },
                children: const [
                  OnBoardingPage(
                      image: "assets/images/onboarding1.png",
                      headText: "Shape Your Financial Future",
                      subText:
                          "invest your money By Starting With HEDG, and secure financial freedom"),
                  OnBoardingPage(
                      image: "assets/images/onboarding2.png",
                      headText: "Track Your Investments",
                      subText:
                          "see your return on investments in the selected plans"),
                  OnBoardingPage(
                      image: "assets/images/onboarding3.png",
                      headText: "Calculate Before Investing",
                      subText:
                          "calculate your potential growth to choose the perfect option for you"),
                ],
              ).hP25,
            ),
            if (cubit.currentPage != 2)
              Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: DefaultElevatedButton(
                      text: 'Skip',
                      function: () {
                        CacheHelper.saveData(key: "ShowLogin", value: true);
                        Navigator.pushNamedAndRemoveUntil(
                            context, LoginScreen.id, (route) => false);
                      })).tP16,
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultElevatedButton(
                          function: () {
                            cubit.pageController.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOutCubic);
                          },
                          text: "Back",
                          textColor: KMainTextColor)
                      .hP8,
                  FloatingActionButton(
                    onPressed: () {
                      if (cubit.isLastPage == false) {
                        cubit.pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutCubic);
                      } else if (cubit.isLastPage == true) {
                        CacheHelper.saveData(key: "ShowLogin", value: true);
                        Navigator.pushNamedAndRemoveUntil(
                            context, LoginScreen.id, (route) => false);
                      }
                    },
                    shape: const CircleBorder(),
                    backgroundColor: KMainTextColor,
                    child: const Icon(
                      Icons.chevron_right_rounded,
                      size: 35,
                      color: Colors.white,
                    ),
                  ).hP16,
                ],
              ).bp(50),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: SmoothPageIndicator(
                onDotClicked: (index) {
                  cubit.pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOutCubic);
                },
                controller: cubit.pageController,
                count: 3,
                effect: WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    dotColor: KHeadTextColor.withOpacity(0.3),
                    activeDotColor: KHeadTextColor),
              ).bp(170),
            )
          ],
        ),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.headText,
    required this.subText,
  });

  final String image;
  final String headText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          scale: 5,
        ).bp(70),
        BodyLargeText(
          headText,
          textAlign: TextAlign.center,
          color: KHeadTextColor,
        ).bP16,
        BodySmallText(
          subText,
          textAlign: TextAlign.center,
          color: KMainTextColor,
        ).hP25.bp(40),
      ],
    );
  }
}
