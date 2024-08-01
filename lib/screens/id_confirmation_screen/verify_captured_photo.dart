import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/models/failure.dart';
import 'package:hedg/screens/id_confirmation_screen/verify_back_identity.dart';
import 'package:hedg/servies/constants.dart';
import 'package:hedg/servies/extensions.dart';
import 'package:hedg/thems/ui.dart';
import 'package:hedg/widget/hedg_button.dart';
import 'package:hedg/widget/hedg_liquid_loading.dart';

import '../../controller/digified_controller.dart';
import '../../servies/enum.dart';
import '../../widget/hedg_adaptive_sized_box.dart';
import '../../widget/hedg_text_label.dart';


class VerifyCapturedPhotoScreen extends StatelessWidget {
  const VerifyCapturedPhotoScreen({Key? key, required this.idSide})
      : super(key: key);
      static String id = "VerifyCapturedPhotoScreen";
  final NationalId idSide;

  @override
  Widget build(BuildContext context) {
    // VerifiedNationalId.fromJson;
    return WillPopScope(
      onWillPop: () {
        Get.find<DigifiedController>().dismissScanId();
        return Future.value(true);
      },
      child: Scaffold(
        ///appBar: HedgBar(text: AppConstants.VERIFY_ACCOUNT.tr),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppConstants.hedgScreenPadding,
            child:
                // TODO:step 1 of selection
                Column(children: [
              const SizedBox(
                height: 16,
              ),
              GetBuilder<DigifiedController>(builder: (digiController) {
                return Column(
                  children: [
                    HedgTextLabel(
                      labelText: idSide == NationalId.front_id
                          ? AppConstants.VERIFY_IMAGE_INPUT
                              .trParams({"face": AppConstants.FRONT_ID.tr})
                          : idSide == NationalId.back_id
                              ? AppConstants.VERIFY_IMAGE_INPUT
                                  .trParams({"face": AppConstants.BACK_ID.tr})
                              : "",
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 16),
                      labelAlign: TextAlign.center,
                      expanded: true,
                    ),
                    const HedgAdaptiveSizedBox(
                      adaptiveHeight: 32,
                    ),
                    LinearProgressIndicator(
                      value: digiController.selectedVerification.progress /
                          digiController.verificationStates.length,
                      backgroundColor: KHeadTextColor,
                      // color: Theme,
                    ),
                    // Text(digiController.selectedVerification.toString()),
                    const HedgAdaptiveSizedBox(
                      adaptiveHeight: 32,
                    ),

                    HedgTextLabel(
                      labelText: idSide == NationalId.front_id
                          ? "This is the Front side of the national id that you captured, please check and confirm or dismiss and capture again."
                              .replaceWithTransTempText(
                                  "التقطت الوجه الأمامي للبطاقة فضلا تأكد من الصورة جيداً قبل استكمال الخطوات التالية أو أعد الالتقاط ")
                          : "This is the Back side of the national id that you captured, please check and confirm or dismiss and capture again."
                              .replaceWithTransTempText(
                                  "التقطت الوجه الخلفي للبطاقة فضلا تأكد من الصورة جيداً قبل استكمال الخطوات التالية أو أعد الالتقاط "),
                      labelStyle: Theme.of(context).textTheme.labelLarge,
                      labelAlign: TextAlign.center,
                      expanded: true,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      height: Get.height / 3,
                      child: Stack(
                        children: [
                          Visibility(
                            visible: (idSide == NationalId.front_id &&
                                    digiController.frontNatIdCard != null) ||
                                (idSide == NationalId.back_id &&
                                    digiController.backNatIdCard != null),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: idSide == NationalId.front_id
                                  ? Image.file(
                                      File(
                                          digiController.frontNatIdCard?.path ??
                                              ""),
                                      height: Get.height / 2,
                                    )
                                  : Image.file(
                                      File(digiController.backNatIdCard?.path ??
                                          ""),
                                      height: Get.height / 2,
                                    ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: InkWell(
                              onTap: () {
                                Toaster.showHedgModalOkCancelBottomSheet(
                                  context,
                                  title: "Recapture"
                                      .replaceWithTransTempText("أعد الالتقاط"),
                                  message: "Are you sure you want to rescan ?"
                                      .replaceWithTransTempText(
                                          "هل أنت متأكد من الرغبة من إعادة الالتقاط"),
                                  alertType: ALERT_DIALOG.success,
                                ).then((rescanValue) {
                                  if (rescanValue == true) {
                                    digiController.scanNationalId(
                                        idFace: idSide);
                                  }
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                    color: KMainTextColor,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.replay,
                                  color: Colors.white,
                                  // size: 55,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Visibility(
                      visible: digiController.selectedVerification ==
                          VerificationStep.analysis_national_id,
                      child: HedgButton(
                          labelText:
                              "Review".replaceWithTransTempText("مراجعة"),
                          expanded: true,
                          onPressed: () async {
                             Navigator.of(context).pop();
                             Navigator.of(context).pop();
                          }),
                      replacement: Visibility(
                        visible: digiController.loading.value == false,
                        replacement: Column(
                          children: [
                            HedgLiquidLoading(
                                center: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    digiController.displayedProgressVal ?? "",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                value: digiController.progrssVal),
                            const SizedBox(
                              height: 16,
                            ),
                            HedgButton(
                                labelText: AppConstants.DISMISS.tr,
                                isDanger: true,
                                onPressed: () async {
                                  digiController.cancelExtractionRequest();
                                }),
                          ],
                        ),
                        child: Column(
                          children: [
                            HedgButton(
                                expanded: true,
                                labelText: AppConstants.NEXT.tr,
                                disablePadding: true,
                                isLoading: digiController.loading.value,
                                onPressed: () {
                                  if (idSide == NationalId.front_id) {
                                    digiController.setVerificationStep(
                                        VerificationStep.scan_back_id);
                                    Get.to(
                                        () => const VerifyBackIdentityScreen());
                                  } else {
                                    //do for back side
                                    digiController
                                        .extractRequest()
                                        .then((extractVal) {
                                      if (extractVal.containsKey(false)) {
                                        var failure = extractVal[false];
                                        if (failure is Failure) {
                                          Toaster.showHedgModalOkBottomSheet(
                                              context,
                                              alertType: ALERT_DIALOG.error,
                                              title: failure.error ??
                                                  AppConstants.UNKNOWN_ERROR.tr,
                                              message: failure.message,
                                              okLabel: AppConstants.RETRY.tr).then((retryVal) {
                                                if(retryVal == true){
                                                    Navigator.of(context).pop();
                                                }
                                              });
                                        }
                                      }
                                    });
                                  }
                                }),
                            const SizedBox(
                              height: 16,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  digiController.dismissScanId();
                                  Navigator.of(context).pop();
                                },
                                child: Text(AppConstants.DISMISS.tr)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                );
              }),
            ]),
          ),
        ),
      ),
    );
  }
}
