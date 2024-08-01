import 'package:flutter/material.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CircularProgressBar extends StatelessWidget {
  const CircularProgressBar(
      {super.key,
      required this.value,
      required this.maxValue,
      required this.title,
      required this.subTitle,
      required this.color});

  final double value;
  final double maxValue;
  final String title;
  final String subTitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
        size: 130,
        customColors: CustomSliderColors(
          shadowMaxOpacity: 20,
          shadowColor: color,
          trackColor: KUnselectedColor,
          progressBarColor: color,
        ),
        infoProperties: InfoProperties(
          modifier: (percentage) {
            return title;
          },
          mainLabelStyle: const TextStyle(
            fontSize: 15,
            color: KMainTextColor,
            fontWeight: FontWeight.bold,
          ),
          bottomLabelText: subTitle,
          bottomLabelStyle: const TextStyle(
            fontSize: 10,
            color: KHeadTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        startAngle: 270,
        angleRange: 360,
        animationEnabled: true,
        animDurationMultiplier: 3,
        customWidths: CustomSliderWidths(
          progressBarWidth: 5,
          trackWidth: 5,
          handlerSize: 0,
          shadowWidth: 5,
        ),
      ),
      min: 0,
      max: 100,
      initialValue: 25,
    );
  }
}
