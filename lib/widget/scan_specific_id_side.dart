
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/models/verified_national_id.dart';
import 'package:hedg/servies/enum.dart';
import 'package:hedg/servies/helpers.dart';


import 'package:hedg/servies/constants.dart';
import 'package:hedg/servies/extensions.dart';
import 'package:hedg/servies/icons.dart';
import 'package:hedg/widget/hedg_button.dart';

import '../../controller/digified_controller.dart';
import '../../widget/hedg_adaptive_sized_box.dart';
import '../../widget/hedg_text_label.dart';

class ScanSpecificIdSide extends StatelessWidget {
  const ScanSpecificIdSide({
    Key? key,
    this.onTap,
    required this.idSide, required this.digiController,
  }) : super(key: key);

  final VoidCallback? onTap;
  final NationalId idSide;
  final DigifiedController digiController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        
        HedgTextLabel(
          labelText: idSide == NationalId.front_id
              ? "Capture ID Front"
              : idSide == NationalId.back_id
                  ? "Capture ID Back"
                  : "",
          labelStyle:
              Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16),
          labelAlign: TextAlign.center,
          expanded: true,
        ),
        const HedgAdaptiveSizedBox(adaptiveHeight: 32,),
        LinearProgressIndicator(
          value: digiController.selectedVerification.progress /
              digiController.verificationStates.length,
          backgroundColor:KHeadTextColor,
          // color: Theme,
        ),
        const HedgAdaptiveSizedBox(adaptiveHeight: 32,),
        HedgTextLabel(
          labelText: "Now place your phone directly on top of national id",
          labelStyle: Theme.of(context).textTheme.labelLarge,
          labelAlign: TextAlign.center,
          expanded: true,
        ),
        Image.asset(AppIcons.SCAN_NATIONAL_ID),
        Table(
          border: TableBorder.symmetric(
            outside: const BorderSide(color:  Color.fromRGBO(219, 230, 246, 1)),
            inside:  BorderSide(color: Color.fromRGBO(219, 230, 246, 1)
                    .withOpacity(0.5)),
          ),
          children: [
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: HedgTextLabel(
                  labelText: AppConstants.RULES.tr,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 16),
                  labelAlign: TextAlign.center,
                  expanded: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: HedgTextLabel(
                  labelText: AppConstants.DESCRIPTION.tr,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 16),
                  labelAlign: TextAlign.center,
                  expanded: false,
                ),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HedgTextLabel(
                  labelText: "Good Lighting"
                     ,
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
                  expanded: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HedgTextLabel(
                  labelText: "Make sure you are in well-lighted area.",
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
                  expanded: false,
                ),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HedgTextLabel(
                  labelText:
                      "Flat Surface",
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
                  expanded: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HedgTextLabel(
                  labelText: "Please put the National ID on a flat surface."
                     ,
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
                  expanded: false,
                ),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HedgTextLabel(
                  labelText: "Capture",
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
                  expanded: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HedgTextLabel(
                  labelText:
                      "Position your photo inside the frame and capture the Photo"
                          ,
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
                  expanded: false,
                ),
              ),
            ])
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        GetBuilder<DigifiedController>(builder: (digiController) {
          return HedgButton(
              onPressed: onTap,
              expanded: true,
              disablePadding: true,
              labelText: AppConstants.CAPTURE.tr);
        }),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
