import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/auth/verify_screen/verify_cubit.dart';
import 'package:hedg/screens/auth/verify_screen/verify_state.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../components/components.dart';
import '../../../components/custom_texts.dart';
import '../../../constants/constant_colors.dart';
import '../login_screen/login_screen.dart';  // Make sure to import the login screen

class VerifyScreen extends StatelessWidget {
  VerifyScreen({super.key});



  static String id = "VerifyScreen";

  final formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // Extract phone number from arguments
    final String phone = args?["phone"] ?? "";

    print(phone);

    var cubit = BlocProvider.of<VerifyCubit>(context);
    return BlocBuilder<VerifyCubit, VerifyState>(
      builder: (context, state) {
        if (state is VerifySuccessState) {
          Future.microtask(() {
            Navigator.pushReplacementNamed(context, LoginScreen.id);
          });
        } else if (state is VerifyFailureState) {
          // Delay the snackbar until after the build is complete
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          });
        }


        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Image.asset("assets/images/verification.png").bP16,
                    const BodyLargeText(
                      "Verification",
                      color: KHeadTextColor,
                    ).bP8,
                    const BodySmallText(
                        "enter 4 digit numbers that sent to your phone")
                        .bP25,
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff098AD3).withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      child: Column(
                        children: [
                          PinCodeTextField(
                            appContext: context,
                            length: 4,
                            controller: codeController,
                            validator: (value) {
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            pinTheme: PinTheme.defaults(
                                shape: PinCodeFieldShape.underline,
                                selectedColor: KMainTextColor,
                                activeColor: KHeadTextColor,
                                borderRadius: BorderRadius.circular(10),
                                activeFillColor: Colors.white,
                                borderWidth: 5),
                          ).hp(70).bP8,
                          DefaultTextButton(
                              context: context,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.verifyOtp(phone, codeController.text);
                                }
                              },
                              text: "Continue",
                              color: cubit.canReSend
                                  ? KMainTextColor
                                  : Colors.grey)
                              .hp(20)
                        ],
                      ).vp(40),
                    ).bP25,
                    DefaultElevatedButton(
                      function: cubit.canReSend == false
                          ? () {}
                          : () {
                        cubit.reSendCounter();
                      },
                      text: cubit.canReSend == false
                          ? "Re-Send Code In 0:${cubit.reSendTime.toString()}"
                          : "Re-Send Code",
                    ),
                  ],
                ).vP25.hP16,
              ),
            ),
          ),
        );
      },
    );
  }
}
