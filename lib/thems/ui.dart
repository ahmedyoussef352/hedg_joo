import 'package:hedg/servies/helpers.dart';
import 'package:hedg/widget/hedg_adaptive_sized_box.dart';
import 'package:hedg/widget/hedg_text_label.dart';

import '../servies/enum.dart';
import '../servies/icons.dart';
import '../widget/hedg_button.dart';

import 'package:flutter/material.dart';



class Toaster {
  Toaster._();

  static Future<bool?> showHedgModalOkCancelBottomSheet(BuildContext context,
      {required ALERT_DIALOG alertType,
      required String title,
      required String message,
      Widget? customIcon,
      TextStyle? titleStyle,
      String? cancelLabel = "No",
      String? okLabel = "Okay",
      bool isDanger = false}) {
    return showModalBottomSheet<bool>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return Container(
              height: 270,
              // margin: EdgeInsets.only(bottom: 40),
              padding: EdgeInsets.only(top: isSmallPhone() ? 16 : 32),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0))),
              child: Column(
                children: [
                  
                  customIcon ??
                      Image.asset(
                        AppIcons.DONE,
                        width: 63,
                        height: 63,
                        cacheWidth: 63,
                        cacheHeight: 63,
                      ),
                  const HedgAdaptiveSizedBox(
                    adaptiveFactor: .4,
                    adaptiveHeight: 16,
                  ),
                  HedgTextLabel(
                    labelText: title,
                    expanded: false,
                    labelSize: 18,
                    labelStyle: titleStyle,
                    labelWeight: FontWeight.normal,
                    labelAlign: TextAlign.center,
                  ),
                  const HedgAdaptiveSizedBox(
                    adaptiveFactor: .7,
                    adaptiveHeight: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: HedgTextLabel(
                      labelText: message,
                      expanded: false,
                      labelSize: 16,
                      labelWeight: FontWeight.normal,
                      labelAlign: TextAlign.center,
                      labelColor: alertType == ALERT_DIALOG.error
                          ? Colors.red
                          : Color(0xFF1B506F),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: isSmallPhone() ? 0 : 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                            child: HedgButton(
                          labelText: okLabel ?? "Okay",
                          fillColor: isDanger
                              ? Colors.red
                              : Color(0xFF30607c),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          expanded: false,
                        )),
                        Flexible(
                            child: HedgButton(
                          labelText: cancelLabel ?? "No",
                          isFilled: false,
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          expanded: false,
                        )),
                      ],
                    ),
                  ),
                  const Spacer()
                ],
              ));
        });
  }

  static Future<bool?> showHedgModalOkBottomSheet(BuildContext context,
      {required ALERT_DIALOG alertType,
      required String title,
      required String message,
      String? cancelLabel = "No",
      String? okLabel = "Okay"}) {
    return showModalBottomSheet<bool>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return Container(
              height: 300,
              padding: EdgeInsets.only(top: isSmallPhone() ? 16 : 32),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0))),
              child: Column(
                children: [
                  Image.asset(
                    alertType == ALERT_DIALOG.success
                        ? AppIcons.CHECKED
                        : alertType == ALERT_DIALOG.error
                            ? AppIcons.FAILURE
                            : AppIcons.LIGHT_APP_ICON,
                    width: 63,
                    height: 63,
                    // cacheHeight: 63,
                    // cacheWidth: 63,
                  ),
                  const HedgAdaptiveSizedBox(
                    adaptiveFactor: .4,
                    adaptiveHeight: 16,
                  ),
                  HedgTextLabel(
                    labelText: title,
                    expanded: false,
                    labelSize: 18,
                    labelWeight: FontWeight.normal,
                    labelAlign: TextAlign.center,
                  ),
                  const HedgAdaptiveSizedBox(
                    adaptiveFactor: .7,
                    adaptiveHeight: 7,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                    child: HedgTextLabel(
                      labelText: message,
                      expanded: false,
                      labelSize: 14,
                      labelWeight: FontWeight.normal,
                      labelAlign: TextAlign.center,
                      labelColor: alertType == ALERT_DIALOG.error
                          ? Colors.red
                          : Color(0xFF1B506F),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                          child: HedgButton(
                        labelText: okLabel ?? "Okay",
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        expanded: true,
                      )),
                    ],
                  ),
                  const Spacer()
                ],
              ));
        });
  }

  static Future<bool?> showHedgAlertDialog(BuildContext context,
      {required String title,
      required String message,
      ALERT_DIALOG? alertDialog,
      String okLabel = "Ok",
      double? height,
      bool? hideButtons = false,
      VoidCallback? onOkPressed}) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side:
                    const BorderSide(color: Color(0xff10284a1a), width: 1)),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: height ?? MediaQuery.of(context).size.height / 2.5,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 42),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:  [
                            BoxShadow(
                                blurRadius: 5,
                                offset: Offset(0, 1),
                                color: Color.fromRGBO(231, 240, 255, 1))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 54, left: 24, right: 24, bottom: 24),
                        child: Column(children: [
                          HedgTextLabel(
                            labelText: title,
                            labelColor: alertDialog == ALERT_DIALOG.success
                                ? Colors.green
                                : (alertDialog == ALERT_DIALOG.danger ||
                                        alertDialog == ALERT_DIALOG.error)
                                    ? Colors.red
                                    : Colors.blue,
                            expanded: false,
                            labelSize: 18,
                            labelWeight: FontWeight.w500,
                          ),
                          const HedgAdaptiveSizedBox(
                            adaptiveFactor: .4,
                            adaptiveHeight: 12,
                          ),
                          Flexible(
                              child: Scrollbar(
                                  // isAlwaysShown: true,
                                  child: ListView(
                            children: [
                              HedgTextLabel(
                                labelText: message,
                                isRtl: isRTLLocale(),
                                labelSize: 15,
                                labelAlign: TextAlign.center,
                                labelWeight: FontWeight.normal,
                                expanded: false,
                              ),
                            ],
                          ))),
                          const HedgAdaptiveSizedBox(
                            adaptiveFactor: .4,
                            adaptiveHeight: 20,
                          ),
                          Visibility(
                            visible: hideButtons == false,
                            child: HedgButton(
                              labelText: okLabel,
                              onPressed: () {
                                Navigator.of(context).pop();
                                onOkPressed?.call();
                              },
                              disablePadding: true,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: alertDialog == ALERT_DIALOG.success
                          ? Image.asset(
                              AppIcons.DONE,
                              scale: 1,
                            )
                          : alertDialog == ALERT_DIALOG.error
                              ? Container(
                                  padding: const EdgeInsets.all(24),
                                  decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 44,
                                  ))
                              : Container(
                                  padding: const EdgeInsets.all(24),
                                  decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 44,
                                  ))),
                ],
              ),
            ),
          );
        });
  }
}
