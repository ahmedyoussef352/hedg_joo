import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hedg/screens/id_confirmation_screen/verify_captured_photo.dart';
import 'package:hedg/servies/constants.dart';
import 'package:hedg/widget/scan_specific_id_side.dart';

import '../../controller/digified_controller.dart';
import '../../servies/enum.dart';

class VerifyBackIdentityScreen extends StatelessWidget {
  const VerifyBackIdentityScreen({Key? key}) : super(key: key);

  static String id = "VerifyBackIdentityScreen";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.find<DigifiedController>().decreaseVerificationStep();
        return Future.value(true);
      },
      child: Scaffold(
        ///appBar: HedgBar(text: AppConstants.VERIFY_ACCOUNT.tr),
        body: Padding(
          padding: AppConstants.hedgScreenPadding,
          child:
              // TODO:step 1 of selection
              SingleChildScrollView(
            child: GetBuilder<DigifiedController>(builder: (digiController) {
              return Column(
                children: [
                  ScanSpecificIdSide(
                      digiController: digiController,
                     idSide: NationalId.back_id,
                      onTap: () {
                        digiController
                            .scanNationalId(idFace: NationalId.back_id)
                            .then((scanVal) => {
                                  if (scanVal.containsKey(true))
                                    {Navigator.of(context).pop()}
                                });
                      })
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
