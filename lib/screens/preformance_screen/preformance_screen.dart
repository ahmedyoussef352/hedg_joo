import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/components/custom_texts.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/constants/constant_sizes.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/preformance_screen/preformace_cibit.dart';
import 'package:hedg/screens/preformance_screen/preformance_state.dart';
import 'package:interactive_chart/interactive_chart.dart';

class PreformanceScreen extends StatelessWidget {
  const PreformanceScreen({super.key});

  static String id = "PreformanceScreen";

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<PerformanceCubit>(context);
    return BlocBuilder<PerformanceCubit, PerformanceState>(
      builder: (context, state) => Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
              BlocProvider.of<PerformanceCubit>(context).endScreen();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: AppSizes.getScreenHeight(context) * 0.85,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BodyMediumText(
                      "Plan Preformance",
                      weight: FontWeight.bold,
                    ).bP8,
                    DefaultTabController(
                      length: 5,
                      child: Container(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  children: [
                                    BodyMediumText(
                                      "EGP 20.186",
                                      weight: FontWeight.bold,
                                    ),
                                    BodySmallText(
                                      "+ EGP 2.30",
                                      color: KHeadTextColor,
                                      weight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: KMainTextColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: InkWell(
                                    onTap: () {
                                      cubit.changeGraphType();
                                      if (cubit.isLine == true) {
                                        cubit.computeTrendLines();
                                      } else if (cubit.isLine == false) {
                                        cubit.removeTrendLines();
                                      }
                                    },
                                    child: Icon(
                                      cubit.isLine
                                          ? Icons
                                              .settings_input_component_outlined
                                          : Icons.show_chart,
                                      color: Colors.white,
                                      size: 18,
                                    ).p4,
                                  ),
                                ),
                              ],
                            ).bP16,
                            SizedBox(
                              height: 300,
                              width: AppSizes.getScreenWidth(context),
                              child: InteractiveChart(
                                priceLabel: (value) => "",
                                timeLabel: (timestamp, visibleDataCount) => "",
                                style: const ChartStyle(
                                  volumeColor: Colors.red,
                                  priceLabelWidth: 0,
                                  timeLabelHeight: 0,
                                  priceGridLineColor: KUnselectedColor,
                                  priceLabelStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                  timeLabelStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                  volumeHeightFactor: 0.0,
                                ),
                                candles: cubit.generateIrregularCandleData(100),
                              ).bP16,
                            ).bP16,
                            const TabBar(
                              indicatorSize: TabBarIndicatorSize.tab,
                              dividerColor: Colors.transparent,
                              isScrollable: true,
                              physics: BouncingScrollPhysics(),
                              unselectedLabelColor: KUnselectedColor,
                              tabs: [
                                BodySmallText("All"),
                                BodySmallText("Yearly"),
                                BodySmallText("Monthly"),
                                BodySmallText("Weekly"),
                                BodySmallText("Daily"),
                              ],
                            )
                          ],
                        ).p16,
                      ),
                    ),
                  ],
                ),
                DefaultTextButton(
                  context: context,
                  function: () {},
                  text: "Top Up",
                  color: KMainTextColor,
                ),
              ],
            ).p16,
          ),
        ),
      ),
    );
  }
}
