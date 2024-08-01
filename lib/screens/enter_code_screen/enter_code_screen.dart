import 'package:flutter/material.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/new_pass_screen/new_pass_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../components/custom_texts.dart';
import '../../constants/constant_colors.dart';

class EnterCodeScreen extends StatelessWidget {
  EnterCodeScreen({super.key});

  static String id = "EnterCodeScreen";
  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Image.asset("assets/images/darkLogo.png").tp(100),
          const BodyMediumText(
            "Enter PIN Code",
            color: KMainTextColor,
          ).vP25.bp(240),
          PinCodeTextField(
            appContext: context,
            onCompleted: (value) {
              Navigator.pushReplacementNamed(context, NewPassScreen.id);
            },
            length: 4,
            controller: codeController,
            keyboardType: TextInputType.number,
            pinTheme: PinTheme.defaults(
                shape: PinCodeFieldShape.box,
                selectedColor: KMainTextColor,
                activeColor: KHeadTextColor,
                borderRadius: BorderRadius.circular(10),
                activeFillColor: Colors.white,
                borderWidth: 5),
          ).hp(90)
        ],
      )),
    );
  }
}
