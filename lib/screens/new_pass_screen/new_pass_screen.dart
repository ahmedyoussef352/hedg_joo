import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/new_pass_screen/new_pass_cubit.dart';
import 'package:hedg/screens/new_pass_screen/new_pass_state.dart';

import '../../components/components.dart';
import '../../components/custom_texts.dart';
import '../../components/default_formfield.dart';
import '../../constants/constant_colors.dart';
import '../../constants/constant_sizes.dart';

class NewPassScreen extends StatelessWidget {
  NewPassScreen({super.key});

  static String id = "NewPassScreen";
  final formKey = GlobalKey<FormState>();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NewPassCubit>(context);
    return BlocBuilder<NewPassCubit, NewPassState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/forgot-password.png").bP16,
                  const BodyLargeText(
                    "Create New Password",
                    color: KHeadTextColor,
                  ).bP8,
                  const BodySmallText(
                    "your new password must be different from previously used passwords",
                  ).bP25.hP16,
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
                          controller: newPassController,
                          type: TextInputType.text,
                          isPassword: cubit.isPassShow,
                          suffix: IconButton(
                            onPressed: () {
                              cubit.changePassState();
                            },
                            icon: Icon(
                              cubit.isPassShow
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: KMainTextColor.withOpacity(0.4),
                            ),
                          ),
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "please enter the new password";
                            }
                            return null;
                          },
                          label: 'New Password',
                        ).bP25,
                        DefaultFormField(
                          controller: confirmPassController,
                          isPassword: cubit.isConfirmPassShow,
                          type: TextInputType.text,
                          suffix: IconButton(
                            onPressed: () {
                              cubit.changeConfirmPassState();
                            },
                            icon: Icon(
                              cubit.isConfirmPassShow
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: KMainTextColor.withOpacity(0.4),
                            ),
                          ),
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "please enter the password again";
                            }
                            if (newPassController.text !=
                                confirmPassController.text) {
                              return "passwords don't match";
                            }
                            return null;
                          },
                          label: 'Confirm New Password',
                        ).bP25,
                        DefaultTextButton(
                                context: context,
                                function: () {
                                  if (formKey.currentState!.validate()) {}
                                },
                                text: "Confirm",
                                color: KMainTextColor)
                            .hp(20)
                      ],
                    ).vp(40),
                  ),
                ],
              ).vP25,
            ).hP16,
          ),
        ),
      ),
    );
  }
}
