import 'package:hedg/widget/ripple.dart';

import 'package:flutter/material.dart';


class HedgLoading extends StatelessWidget {
  const HedgLoading({Key? key, this.color}) : super(key: key);

final Color? color;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SpinKitRipple(
        color:color?? Color(0xFF30607c),
      ),
    );
  }
}
