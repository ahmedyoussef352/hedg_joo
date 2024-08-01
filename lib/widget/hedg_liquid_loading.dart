import 'package:hedg/constants/constant_colors.dart';

import 'package:flutter/material.dart';

class HedgLiquidLoading extends StatelessWidget {
  const HedgLiquidLoading(
      {Key? key,
      this.color = const Color(0xFF1B506F),
      required this.value, this.center})
      : super(key: key);

  final Color color;
  final double value;
  final Widget? center;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height / 7,
      height: MediaQuery.of(context).size.height / 7,
      child: CircularProgressIndicator(
        value: value,
        valueColor: AlwaysStoppedAnimation(color),
      
      ),
    );
  }
}
