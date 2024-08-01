import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/constants/constant_sizes.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/calculator_screen/calculator_cubit.dart';
import 'package:hedg/screens/calculator_screen/calculator_state.dart';

import '../../components/custom_texts.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  static String id = "CalculatorScreen";

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CalculatorCubit>(context);
    return BlocBuilder<CalculatorCubit, CalculatorState>(
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
            "Calculator",
            weight: FontWeight.bold,
          ),
        ),
        body: SingleChildScrollView(
            child: SizedBox(
          height: AppSizes.getScreenHeight(context) * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BodySmallText(
                    "Expected Profit Within 10 Years",
                    weight: FontWeight.bold,
                  ).bP16,
                  const BodySmallText(
                    "Total: 380,500 Egp",
                  ).bP4,
                  const BodySmallText(
                    "Investment: 130,000 Egp",
                  ).bP4,
                  const BodySmallText(
                    "Profit: 250,500 Egp",
                  ).bP4,
                ],
              ).p16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BodyExtraSmallText(
                        "Initial Investment: ${cubit.initialVal.round()} Egp",
                        weight: FontWeight.bold,
                      ),
                      Slider(
                        activeColor: KHeadTextColor,
                        value: cubit.initialVal,
                        onChanged: (value) {
                          cubit.changeInitialVal(value: value);
                        },
                        max: 50000,
                        min: 0,
                        divisions: 10,
                        label: cubit.initialVal.round().toString(),
                      ),
                      BodyExtraSmallText(
                        "Monthly Investment: ${cubit.monthlyVal.round()} Egp",
                        weight: FontWeight.bold,
                      ),
                      Slider(
                        activeColor: KHeadTextColor,
                        value: cubit.monthlyVal,
                        onChanged: (value) {
                          cubit.changeMonthlyVal(value: value);
                        },
                        max: 500000,
                        min: 0,
                        divisions: 20,
                        label: cubit.monthlyVal.round().toString(),
                      ),
                    ],
                  ).p16,
                  Container(
                    width: AppSizes.getScreenWidth(context),
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: Image.asset(
                      "assets/images/greenLogo.png",
                      scale: 3,
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
