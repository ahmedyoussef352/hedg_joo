import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/components/custom_texts.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/constants/constant_sizes.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/enter_code_screen/enter_code_screen.dart';
import 'package:hedg/screens/forget_pass_screen/forget_pass_cubit.dart';
import 'package:hedg/screens/forget_pass_screen/forget_pass_state.dart';

import '../../components/default_formfield.dart';

class ForgetPassScreen extends StatelessWidget {
  ForgetPassScreen({super.key});

  static String id = "ForgetPassScreen";
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ForgetPassCubit>(context);
    return BlocBuilder<ForgetPassCubit, ForgetPassState>(
      builder: (context, state) => Scaffold(
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
                  Image.asset("assets/images/forgot-password.png").bP16,
                  const BodyLargeText(
                    "Forgot Password?",
                    color: KHeadTextColor,
                  ).bP8,
                  const BodySmallText(
                          "enter your phone number to reset your password")
                      .bP25,
                  Container(
                    width: AppSizes.getScreenWidth(context) * 0.9,
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
                        DefaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (value) {
                            if (cubit.countryCode == "-  -") {
                              return "please select country code";
                            }
                            if (value!.isEmpty) {
                              return "please enter your phone number";
                            }
                            return null;
                          },
                          label: 'Phone Number',
                          prefix: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                useSafeArea: true,
                                enableDrag: true,
                                showDragHandle: true,
                                context: context,
                                builder: (context) => CountryCodesSheet(
                                  context: context,
                                  cubit: cubit,
                                ),
                              );
                            },
                            child: SizedBox(
                              width: 60,
                              child: BodyMediumText(
                                cubit.countryCode,
                                color: KMainTextColor.withOpacity(0.7),
                              ).hP8,
                            ),
                          ),
                        ).bP25,
                        DefaultTextButton(
                            context: context,
                            function: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.pushNamed(
                                    context, EnterCodeScreen.id);
                              }
                            },
                            text: "Send",
                            color:
                                cubit.canReSend ? KMainTextColor : Colors.grey)
                      ],
                    ).vp(40).hp(20),
                  ).bP25,
                  DefaultElevatedButton(
                    function: cubit.canReSend == false
                        ? () {}
                        : () {
                            if (formKey.currentState!.validate()) {
                              cubit.reSendCounter();
                            }
                          },
                    text: cubit.canReSend == false
                        ? "Re-Send Code In 0:${cubit.reSendTime.toString()}"
                        : "Re-Send Code",
                  ).hP25,
                ],
              ).vP25,
            ),
          ),
        ),
      ),
    );
  }
}
