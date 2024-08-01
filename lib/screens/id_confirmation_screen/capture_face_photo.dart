import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hedg/servies/constants.dart';
import 'package:hedg/servies/extensions.dart';
import 'package:hedg/thems/ui.dart';
import 'package:hedg/widget/hedg_button.dart';

import '../../controller/digified_controller.dart';
import '../../servies/enum.dart';
import '../../widget/hedg_adaptive_sized_box.dart';
import '../../widget/hedg_text_label.dart';


class CaptureFaceImageScreen extends StatelessWidget {
  const CaptureFaceImageScreen({Key? key}) : super(key: key);
  static String id = "CaptureFaceImageScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///appBar:  HedgBar(text: "Your face".replaceWithTransTempText("وجهك")),
      body: Padding(
        padding: AppConstants.hedgScreenPadding,
        child: GetBuilder<DigifiedController>(builder: (digiController) {
          return Column(
            children: [
              HedgTextLabel(
                labelText: "Your face".replaceWithTransTempText("وجهك"),
                labelStyle: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 16),
                labelAlign: TextAlign.center,
                expanded: true,
              ),
              const SizedBox(
                height: 32,
              ),
              LinearProgressIndicator(
                value: digiController.selectedVerification.progress /
                    digiController.verificationStates.length,
                backgroundColor: Colors.green,
                // color: Theme,
              ),
              const HedgAdaptiveSizedBox(
                adaptiveHeight: 32,
              ),
              Image.file(
                File(digiController.myFaceImage?.path ?? ""),
                height: Get.height / 2,
              ),
              const HedgAdaptiveSizedBox(
                adaptiveHeight: 32,
              ),
              Visibility(
                visible: digiController.verificationDone.value == false,
                child: HedgButton(
                    labelText: "Verify my face".replaceWithTransTempText("تأكد من صورة وجهك"),
                    expanded: true,
                    isLoading: digiController.loading.value,
                    onPressed: () {
                      digiController.verifyMyFace().then((verifyFace) => {
                            if (verifyFace.containsKey(true))
                              {
                                ///TODO: 
                                // showOkAlertDialog(
                                //     context: context,
                                //     title: "Done",
                                //     message: verifyFace[true]["msg"])
                                Toaster.showHedgModalOkBottomSheet(context,
                                            title:
                                                "Face Verification",
                                            alertType: ALERT_DIALOG.success,
                                            message: verifyFace[true]["msg"])
                                        
                              }
                            else
                              {
                                
                                Toaster.showHedgModalOkBottomSheet(context,
                                    alertType: ALERT_DIALOG.error,
                                    title: "Error",
                                    message: verifyFace[false].message)
                              }
                          });
                    }),
                replacement: HedgButton(
                    labelText: "View Results".replaceWithTransTempText("شاهد النتائج"),
                    expanded: true,
                    onPressed: () {
                      digiController
                          .getVerificationResults()
                          .then((verifyFace) => {
                                if (verifyFace.containsKey(true))
                                  {
                                    Toaster.showHedgModalOkBottomSheet(context,
                                            title:
                                                "You Account has been verified",
                                            alertType: ALERT_DIALOG.success,
                                            message: "")
                                        .then((value) => {
                                              Navigator.of(context).popUntil(
                                                  (route) => route.isFirst)
                                            })

                                    ///[]
                                  }
                                else
                                  {
                                    verifyFace[false].toString().printInfo(),
                                    Toaster.showHedgModalOkBottomSheet(context,
                                        alertType: ALERT_DIALOG.error,
                                        title: "Error",
                                        message: verifyFace[false].message)
                                  }
                              });
                    }),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          );
        }),
      ),
    );
  }
}
