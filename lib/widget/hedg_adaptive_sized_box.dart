import 'package:flutter/material.dart';

import '../servies/helpers.dart';

class HedgAdaptiveSizedBox extends StatelessWidget {
  const HedgAdaptiveSizedBox({
    Key? key,
    this.adaptiveHeight = 0,
     this.adaptiveFactor = 0.4,
    this.child,
    this.adaptiveWidth = 0,
  }) : super(key: key);
  final double adaptiveHeight;
  final double adaptiveWidth;
  final double adaptiveFactor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isSmallPhone() ? adaptiveHeight * adaptiveFactor : adaptiveHeight,
      width: isSmallPhone() ? adaptiveWidth * adaptiveFactor : adaptiveWidth,
      child: Center(child: child),
    );
  }
}
