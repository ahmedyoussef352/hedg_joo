import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/change_question_screen/change_question_cubit.dart';
import 'package:hedg/screens/change_question_screen/change_question_state.dart';

import '../../components/components.dart';
import '../../components/custom_texts.dart';

class ChangeQuestionScreen extends StatelessWidget {
  ChangeQuestionScreen({super.key});

  static String id = "ChangeQuestionScreen";
  final ExpansionTileController controller = ExpansionTileController();
  final answerController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ChangeQuestionCubit>(context);
    return BlocBuilder<ChangeQuestionCubit, ChangeQuestionState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
          title: const BodyMediumText(
            "Change Security Question",
            weight: FontWeight.bold,
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BodySmallText(
                  "We use security question to help you gain access to your account faster if you forget your password. ",
                  maxLines: 3,
                  textAlign: TextAlign.start,
                ).bP25,
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppExpansionTile(
                        controller: controller,
                        title: cubit.currentQuestion,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.collapse();
                              cubit.setCurrentQuestion(cubit.questions[0]);
                            },
                            child: const BodySmallText(
                              "What is your father's maiden name?",
                              maxLines: 3,
                              textAlign: TextAlign.start,
                            ),
                          ).bP16,
                          InkWell(
                            onTap: () {
                              controller.collapse();
                              cubit.setCurrentQuestion(cubit.questions[1]);
                            },
                            child: const BodySmallText(
                              "What is your favorite food?",
                              maxLines: 3,
                              textAlign: TextAlign.start,
                            ),
                          ).bP16,
                          InkWell(
                            onTap: () {
                              controller.collapse();
                              cubit.setCurrentQuestion(cubit.questions[2]);
                            },
                            child: const BodySmallText(
                              "What is your favorite color?",
                              maxLines: 3,
                              textAlign: TextAlign.start,
                            ),
                          ).bP16,
                          InkWell(
                            onTap: () {
                              controller.collapse();
                              cubit.setCurrentQuestion(cubit.questions[3]);
                            },
                            child: const BodySmallText(
                              "What is your favorite movie?",
                              maxLines: 3,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ).bP25,
                      const BodySmallText(
                        "Your Answer",
                        weight: FontWeight.bold,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (cubit.currentQuestion == "") {
                            return "Please Select Your Security Question Then Enter Your Answer";
                          }
                          if (value!.isEmpty) {
                            return "Please Enter Your Answer";
                          }
                          return null;
                        },
                        controller: answerController,
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                          isDense: true,
                          errorStyle: TextStyle(fontSize: 10),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          contentPadding: EdgeInsets.only(bottom: 5),
                          label: BodySmallText(
                            "your answer",
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: KUnselectedColor, width: 2)),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: KUnselectedColor, width: 1)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: KUnselectedColor, width: 1)),
                        ),
                      )
                    ],
                  ).p16,
                ).bp(50),
                DefaultTextButton(
                  context: context,
                  function: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  text: "Set Security Question",
                  color: cubit.currentQuestion == "" ||
                          answerController.text.isEmpty
                      ? Colors.grey.withOpacity(0.5)
                      : KMainTextColor,
                )
              ],
            ).p16,
          ),
        ),
      ),
    );
  }
}
