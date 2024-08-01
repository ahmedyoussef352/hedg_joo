import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/screens/id_confirmation_screen/verify_captured_photo.dart';
import 'package:hedg/servies/constants.dart';
import 'package:hedg/servies/helpers.dart';
import 'package:hedg/widget/scan_specific_id_side.dart';

import '../../controller/digified_controller.dart';
import '../../servies/enum.dart';

class VerifyFrontIdentityScreen extends StatelessWidget {
  const VerifyFrontIdentityScreen({Key? key}) : super(key: key);

  static String id = "VerifyFrontIdentityScreen";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Helper.deleteCacheDir();
        Get.find<DigifiedController>().decreaseVerificationStep();
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
              GetBuilder<DigifiedController>(initState: (_) {
                Get.find<DigifiedController>()
                    .initVerificationStep()
                    .then((digiInitVal) => {
                          if (digiInitVal == null || digiInitVal == false)
                            {
                              errorShowToast(
                                  message: AppConstants.DIGIFIED_ERROR_SIDE.tr)
                            }
                        });
              }, builder: (digiController) {
                return Column(
                  children: [
                    ScanSpecificIdSide(
                      digiController: digiController,
                     idSide: NationalId.front_id,
                      onTap: () => digiController
                          .scanNationalId(idFace: NationalId.front_id)
                          .then((scanVal) {
                        if (scanVal.containsKey(true)) {
                          Navigator.of(context).pop();
                        }
                      }),
                    )
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
