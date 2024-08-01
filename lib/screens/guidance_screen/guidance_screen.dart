import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/guidance_screen/guidance_cubit.dart';
import 'package:hedg/screens/guidance_screen/guidance_state.dart';

import '../../components/custom_texts.dart';
import '../../components/default_formfield.dart';
import '../../constants/constant_colors.dart';

class GuidanceScreen extends StatelessWidget {
  GuidanceScreen({super.key});

  static String id = "GuidanceScreen";
  final riskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<GuidanceCubit>(context);
    return BlocBuilder<GuidanceCubit, GuidanceState>(
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
            "Guidance",
            weight: FontWeight.bold,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BodyMediumText(
                "Need Guidance ?",
                weight: FontWeight.bold,
              ).bP16,
              const BodySmallText(
                "We are here to help you! By answering our questions, we will choose the best plan that suits you.",
                maxLines: 3,
                textAlign: TextAlign.start,
              ).bP16,
              const BodyMediumText(
                "Plan Details",
                weight: FontWeight.bold,
              ).bP16,
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
                    const BodySmallText("chose your risk tolerance from 1 : 3")
                        .bP8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: InkWell(
                            onTap: () {
                              if (cubit.currentRisk > 1) {
                                cubit.decreaseRisk();
                                riskController.text =
                                    cubit.currentRisk.toString();
                              }
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 28,
                              color: Colors.red,
                            ).p4,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 200,
                          child: DefaultFormField(
                              controller: riskController,
                              readOnly: true,
                              type: TextInputType.number,
                              isCenter: true,
                              validate: (value) {
                                return null;
                              },
                              label: "0"),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: KHeadTextColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: InkWell(
                            onTap: () {
                              if (cubit.currentRisk < 3) {
                                cubit.increaseRisk();
                                riskController.text =
                                    cubit.currentRisk.toString();
                              }
                            },
                            child: const Icon(
                              Icons.add,
                              size: 28,
                              color: KHeadTextColor,
                            ).p4,
                          ),
                        ),
                      ],
                    ).bP16,
                    const BodySmallText("Are you looking for : ").bP8,
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                                activeColor: KHeadTextColor,
                                fillColor: WidgetStateProperty.all(
                                  KHeadTextColor,
                                ),
                                value: cubit.lookingFor[0],
                                groupValue: cubit.currentLookingFor,
                                onChanged: (value) {
                                  cubit.changeLookingFor(
                                      looking: value.toString());
                                }),
                            BodySmallText(cubit.lookingFor[0]),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                activeColor: KHeadTextColor,
                                fillColor: WidgetStateProperty.all(
                                  KHeadTextColor,
                                ),
                                value: cubit.lookingFor[1],
                                groupValue: cubit.currentLookingFor,
                                onChanged: (value) {
                                  cubit.changeLookingFor(
                                      looking: value.toString());
                                }),
                            BodySmallText(cubit.lookingFor[1]),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                activeColor: KHeadTextColor,
                                fillColor: WidgetStateProperty.all(
                                  KHeadTextColor,
                                ),
                                value: cubit.lookingFor[2],
                                groupValue: cubit.currentLookingFor,
                                onChanged: (value) {
                                  cubit.changeLookingFor(
                                      looking: value.toString());
                                }),
                            BodySmallText(cubit.lookingFor[2]),
                          ],
                        ),
                      ],
                    ).bP8,
                    const BodySmallText("what best describes you ?").bP8,
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                                activeColor: KHeadTextColor,
                                fillColor: WidgetStateProperty.all(
                                  KHeadTextColor,
                                ),
                                value: cubit.describes[0],
                                groupValue: cubit.currentDescribes,
                                onChanged: (value) {
                                  cubit.changeDescribes(
                                      describes: value.toString());
                                }),
                            BodySmallText(cubit.describes[0]),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                activeColor: KHeadTextColor,
                                fillColor: WidgetStateProperty.all(
                                  KHeadTextColor,
                                ),
                                value: cubit.describes[1],
                                groupValue: cubit.currentDescribes,
                                onChanged: (value) {
                                  cubit.changeDescribes(
                                      describes: value.toString());
                                }),
                            BodySmallText(cubit.describes[1]),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                activeColor: KHeadTextColor,
                                fillColor: WidgetStateProperty.all(
                                  KHeadTextColor,
                                ),
                                value: cubit.describes[2],
                                groupValue: cubit.currentDescribes,
                                onChanged: (value) {
                                  cubit.changeDescribes(
                                      describes: value.toString());
                                }),
                            BodySmallText(cubit.describes[2]),
                          ],
                        ),
                      ],
                    ).bP8,
                    const BodySmallText("monthly income range ?").bP8,
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                                activeColor: KHeadTextColor,
                                fillColor: WidgetStateProperty.all(
                                  KHeadTextColor,
                                ),
                                value: cubit.income[0],
                                groupValue: cubit.currentIncome,
                                onChanged: (value) {
                                  cubit.changeIncome(income: value.toString());
                                }),
                            BodySmallText(cubit.income[0]),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                activeColor: KHeadTextColor,
                                fillColor: WidgetStateProperty.all(
                                  KHeadTextColor,
                                ),
                                value: cubit.income[1],
                                groupValue: cubit.currentIncome,
                                onChanged: (value) {
                                  cubit.changeIncome(income: value.toString());
                                }),
                            BodySmallText(cubit.income[1]),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                activeColor: KHeadTextColor,
                                fillColor: WidgetStateProperty.all(
                                  KHeadTextColor,
                                ),
                                value: cubit.income[2],
                                groupValue: cubit.currentIncome,
                                onChanged: (value) {
                                  cubit.changeIncome(income: value.toString());
                                }),
                            BodySmallText(cubit.income[2]),
                          ],
                        ),
                      ],
                    ),
                  ],
                ).p16,
              ).bP16,
              DefaultTextButton(
                      context: context,
                      function: () {},
                      text: "Find Your Plan",
                      color: KMainTextColor)
                  .bP16
            ],
          ).p16,
        ),
      ),
    );
  }
}
