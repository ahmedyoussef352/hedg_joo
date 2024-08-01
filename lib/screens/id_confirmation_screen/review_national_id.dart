import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/models/verified_national_id.dart';
import 'package:hedg/servies/helpers.dart';

import 'capture_face_photo.dart';

import 'package:hedg/servies/constants.dart';
import 'package:hedg/servies/extensions.dart';
import 'package:hedg/widget/hedg_button.dart';

import '../../controller/digified_controller.dart';
import '../../widget/hedg_adaptive_sized_box.dart';
import '../../widget/hedg_text_label.dart';

class ReviewNationalIdScreen extends StatelessWidget {
  const ReviewNationalIdScreen({Key? key}) : super(key: key);
  static String id = "ReviewNationalIdScreen";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // Get.find<DigifiedController>().decreaseVerificationStep();
        return Future.value(false);
      },
      child: Scaffold(
        ///appBar: HedgBar(text: AppConstants.REVIEW_ACCOUNT.tr),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppConstants.hedgScreenPadding,
            child: GetBuilder<DigifiedController>(builder: (digiController) {
              return Column(
                children: [
                  HedgTextLabel(
                    labelText: "Review Account"
                        .replaceWithTransTempText("مراجعة الحساب"),
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
                  const HedgAdaptiveSizedBox(
                    adaptiveHeight: 32,
                  ),
                  HedgTextLabel(
                    labelText: "Front".replaceWithTransTempText("وجه البطاقة"),
                  ),
                  const HedgAdaptiveSizedBox(
                    adaptiveHeight: 16,
                  ),
                  FrontIdDetails(
                    front: digiController.verifiedNationalId?.front,
                  ),
                  const HedgAdaptiveSizedBox(
                    adaptiveHeight: 16,
                  ),
                  HedgTextLabel(
                    labelText:
                        "Back".replaceWithTransTempText("وجه البطاقة الخلفي"),
                  ),
                  const HedgAdaptiveSizedBox(
                    adaptiveHeight: 16,
                  ),
                  BackIdDetails(
                    back: digiController.verifiedNationalId?.back,
                  ),
                  const HedgAdaptiveSizedBox(
                    adaptiveHeight: 16,
                  ),
                  HedgButton(
                      labelText: "Capture Face"
                          .replaceWithTransTempText("التقط صورة لوجهك"),
                      expanded: true,
                      onPressed: () {
                        digiController.scanMyFace().then((faceVal) => {
                              if (faceVal)
                                {
                                  Navigator.of(context).pop(),
                                  Navigator.of(context).pop()
                                }
                            });
                        // Get.to(() => const CaptureFaceImageScreen());
                      }),
                  const HedgAdaptiveSizedBox(
                    adaptiveHeight: 16,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class FrontIdDetails extends StatelessWidget {
  const FrontIdDetails({
    Key? key,
    required this.front,
  }) : super(key: key);

  final Front? front;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.symmetric(
        outside: const BorderSide(color: Color.fromRGBO(237, 89, 57, 1)),
        inside: const BorderSide(color: Color(0xFFFCDDD5)),
      ),
      children: [
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: HedgTextLabel(
              labelText: "Field".replaceWithTransTempText("الحقول"),
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
              labelText: "Picture".replaceWithTransTempText("صورتك"),
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.memory(base64Decode(front?.faceImage ?? "")),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: AppConstants.NAME.tr,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: front?.name,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: TextAlign.right,
              expanded: false,
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: "Family Name".replaceWithTransTempText("اسم العائلة"),
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: front?.familyName,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: TextAlign.right,
              expanded: false,
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: "Address".replaceWithTransTempText("العنوان"),
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: front?.address,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: TextAlign.right,
              expanded: false,
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText:
                  "Address Details".replaceWithTransTempText("تفاصيل العنوان"),
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: front?.addressDetails,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: TextAlign.right,
              expanded: false,
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: AppConstants.NATIONAL_ID.tr,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: front?.nationalId.toString(),
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: TextAlign.center,
              expanded: false,
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: AppConstants.BIRTH_DATE.tr,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: front?.birthdate,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: TextAlign.center,
              expanded: false,
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: "District".replaceWithTransTempText("المنطقة"),
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: front?.district,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: TextAlign.right,
              expanded: false,
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: "City".replaceWithTransTempText("المدينة"),
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: front?.governorate,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: TextAlign.right,
              expanded: false,
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: "Serial"
                  .replaceWithTransTempText("الرقم السري الخاص بالبطاقة"),
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: front?.serial,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: TextAlign.center,
              expanded: false,
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: "Sub District".replaceWithTransTempText("الحي الفرعي"),
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: front?.subdistrict,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: TextAlign.right,
              expanded: false,
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: "Street".replaceWithTransTempText("الشارع"),
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: front?.street,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: TextAlign.right,
              expanded: false,
            ),
          ),
        ]),
      ],
    );
  }
}

class BackIdDetails extends StatelessWidget {
  const BackIdDetails({
    Key? key,
    required this.back,
  }) : super(key: key);

  final Back? back;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.symmetric(
        outside: const BorderSide(color: Color.fromRGBO(237, 89, 57, 1)),
        inside: const BorderSide(color: Color(0xFFFCDDD5)),
      ),
      children: [
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: HedgTextLabel(
              labelText: "Fields".replaceWithTransTempText("الحقول"),
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
              labelText: "Job Title".replaceWithTransTempText("المسمى الوظيفي"),
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: back?.jobTitle,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: TextAlign.right,
              expanded: false,
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: "Job Place".replaceWithTransTempText("محل العمل"),
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: back?.jobPlace,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: TextAlign.right,
              expanded: false,
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: "Marital Status"
                  .replaceWithTransTempText("الحالة الاجتماعية"),
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: back?.marital,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: TextAlign.right,
              expanded: false,
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: "Religion".replaceWithTransTempText("الديانة"),
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: back?.religion,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: TextAlign.right,
              expanded: false,
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: "Expiration".replaceWithTransTempText("الإنتهاء"),
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: back?.expiration,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: TextAlign.center,
              expanded: false,
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: "Husband".replaceWithTransTempText("الزوج"),
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: back?.husband,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: TextAlign.center,
              expanded: false,
            ),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: "Issue date".replaceWithTransTempText("تاريخ الاصدار"),
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
              labelText: "Sex".replaceWithTransTempText("الجنس"),
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: isRTLLocale() ? TextAlign.right : TextAlign.left,
              expanded: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HedgTextLabel(
              labelText: back?.sex,
              labelStyle: Theme.of(context).textTheme.labelLarge,
              labelAlign: TextAlign.right,
              expanded: false,
            ),
          ),
        ]),
      ],
    );
  }
}
