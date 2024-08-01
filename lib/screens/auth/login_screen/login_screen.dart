import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/repositories/login_repository.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/components/custom_texts.dart';
import 'package:hedg/constants/constant_sizes.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/forget_pass_screen/forget_pass_screen.dart';
import 'package:hedg/screens/id_confirmation_screen/id_confirmation_screen.dart';
import 'package:hedg/components/default_formfield.dart';
import 'package:hedg/constants/constant_colors.dart';
import '../signup_screen/signup_screen.dart';
import 'login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static String id = "LoginScreen";
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(loginRepository: LoginRepository()),
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        "assets/images/loginBackground.png",
                        fit: BoxFit.cover,
                        width: AppSizes.getScreenWidth(context),
                      ),
                      PositionedDirectional(
                          top: AppSizes.getScreenHeight(context) * 0.12,
                          start: 0,
                          end: 0,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/whiteLogo.png",
                                scale: 3,
                              ).bP25,
                              const BodyLargeText(
                                "Log In Your Account",
                                color: Colors.white,
                              )
                            ],
                          ))
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                width: AppSizes.getScreenWidth(context) * 0.9,
                height: AppSizes.getScreenHeight(context) * 0.6,
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
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        DefaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "please enter your phone";
                            }
                            return null;
                          },
                          label: 'phone',
                        ).tp(60),
                        DefaultFormField(
                          controller: passwordController,
                          type: TextInputType.text,
                          isPassword: true,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "please enter your password";
                            }
                            return null;
                          },
                          label: 'Password',
                        ).vP16,
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, ForgetPassScreen.id);
                          },
                          child: const BodySmallText(
                            "Forgot Your Password?",
                            weight: FontWeight.bold,
                          ),
                        ),
                        BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state is LoginSuccess) {
                              Navigator.pushNamed(context, IdConfirmationScreen.id);
                            } else if (state is LoginFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.error)),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is LoginLoading) {
                              return CircularProgressIndicator();
                            }
                            return DefaultTextButton(
                              context: context,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<LoginCubit>(context).login(
                                    phoneNumber: phoneController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              text: "Log In",
                              textColor: Colors.white,
                              color: KMainTextColor,
                            ).tP16;
                          },
                        ),
                        const BodySmallText("Or", color: KMainTextColor).vP16,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffE6F3FB),
                              ),
                              child: Image.asset(
                                "assets/images/google.png",
                                scale: 1.5,
                              ).p16,
                            ),
                            const SizedBox(
                              width: 26,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffE6F3FB),
                              ),
                              child: Image.asset(
                                "assets/images/apple.png",
                                scale: 1.5,
                              ).p16,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const BodySmallText(
                              "Don't have an account? ",
                              color: KMainTextColor,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, SignupScreen.id);
                              },
                              child: const BodySmallText(
                                "Sign Up",
                                color: KHeadTextColor,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ).vP16
                      ],
                    ),
                  ).hp(20),
                ),
              ).bp(50),
            )
          ],
        ),
      ),
    );
  }
}
