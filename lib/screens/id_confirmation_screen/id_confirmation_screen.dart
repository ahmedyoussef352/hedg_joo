// ignore_for_file: sort_child_properties_last

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/components/custom_texts.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/constants/constant_sizes.dart';
import 'package:hedg/controller/digified_controller.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/home_screen/home_screen.dart';
import 'package:hedg/screens/id_confirmation_screen/id_confirmation_cubit.dart';
import 'package:hedg/screens/id_confirmation_screen/verify_back_identity.dart';
import 'package:hedg/screens/id_confirmation_screen/verify_captured_photo.dart';
import 'package:hedg/screens/id_confirmation_screen/verify_front_identity.dart';
import '../../servies/enum.dart';

class IdConfirmationScreen extends StatefulWidget {
  const IdConfirmationScreen({super.key});

  static String id = "IdConfirmationScreen";

  @override
  State<IdConfirmationScreen> createState() => _IdConfirmationScreenState();
}

class _IdConfirmationScreenState extends State<IdConfirmationScreen> {
  DigifiedController digifiedController = DigifiedController();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<IdConfirmationCubit>(context);
    return WillPopScope(
      onWillPop: () {
        print("888888888888888888888888");
        print(cubit.activeStep);
        Get.find<DigifiedController>().decreaseVerificationStep();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          title: Center(
              child: Image.asset(
            "assets/images/darkLogo.png",
            scale: 1.5,
          )),
        ),
        body: SingleChildScrollView(
          child: GetBuilder<DigifiedController>(
              initState: cubit.activeStep == 0
                  ? null
                  : (_) {
                      Get.find<DigifiedController>()
                          .initVerificationStep()
                          .then((digiInitVal) => {
                                if (digiInitVal == null || digiInitVal == false)
                                  {
                                    // showOkAlertDialog(
                                    //     context: context,
                                    //     title: AppConstants.UNKNOWN_ERROR.tr,
                                    //      message: AppConstants
                                    //         .DIGIFIED_ERROR_SIDE.tr)

                                    //     .then((value) => Navigator.of(context)
                                    //         .popUntil((route) => route.isFirst))
                                  }
                              });
                    },
              builder: (digifiedController) {
                return Column(
                  children: [
                    EasyStepper(
                        activeStep: cubit.activeStep,
                        onStepReached: (index) {
                          cubit.changeActiveStep(index);
                        },
                        showStepBorder: true,
                        stepAnimationCurve: Curves.easeInOut,
                        stepAnimationDuration:
                            const Duration(milliseconds: 300),
                        unreachedStepTextColor: Colors.red,
                        activeStepTextColor: Colors.white,
                        activeStepBackgroundColor: KHeadTextColor,
                        finishedStepBackgroundColor: KHeadTextColor,
                        unreachedStepBackgroundColor: Colors.white,
                        lineStyle: LineStyle(
                          lineThickness: 5,
                          defaultLineColor: KUnselectedColor,
                          progress: cubit.linePercent,
                          progressColor: KHeadTextColor,
                          finishedLineColor: KHeadTextColor,
                          lineType: LineType.normal,
                          lineLength: 30,
                        ),
                        stepRadius: 20,
                        activeStepBorderColor: Colors.transparent,
                        unreachedStepBorderColor: KUnselectedColor,
                        finishedStepBorderColor: Colors.transparent,
                        borderThickness: 2,
                        showLoadingAnimation: false,
                        activeStepBorderType: BorderType.normal,
                        unreachedStepBorderType: BorderType.normal,
                        finishedStepBorderType: BorderType.normal,
                        steps: [
                          StepItem(
                              title: "ID Front",
                              image: digifiedController.frontNatIdCard?.path,
                              stepIndex: 1),
                          StepItem(
                              title: "ID Back",
                              image: digifiedController.backNatIdCard?.path,
                              stepIndex: 2),
                          StepItem(
                              title: "Face",
                              image: digifiedController.myFaceImage?.path,
                              stepIndex: 3),
                          StepItem(
                              title: "Face Right",
                              image: digifiedController.myFaceImageRight?.path,
                              stepIndex: 4),
                          StepItem(
                              title: "Face Left",
                              image: digifiedController.myFaceImageLeft?.path,
                              stepIndex: 5),
                          StepItemConFirmation(
                              title: "Confirmation",
                              image: digifiedController.frontNatIdCard?.path !=
                                      "" &&
                                  digifiedController.backNatIdCard?.path !=
                                      "" &&
                                  digifiedController.myFaceImage?.path != "" &&
                                  digifiedController.myFaceImageRight?.path !=
                                      "" &&
                                  digifiedController.myFaceImageLeft?.path !=
                                      "",
                              stepIndex: 6),
                        ]),
                    const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: BodyMediumText(
                        "Add Your Personal Details",
                        weight: FontWeight.bold,
                      ),
                    ).hP16.bP16,
                    Container(
                      height: AppSizes.getScreenHeight(context) * 0.55,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: const Offset(0, 1),
                            ),
                          ]),
                      child: PageView(
                        controller: cubit.pageController,
                        onPageChanged: (value) {
                          cubit.changePage(value);
                        },
                        children: [
                          AddIdBody(
                              image: digifiedController.frontNatIdCard?.path,
                              context: context,
                              title: "ID Card (Front)",
                              subTitle:
                                  "Please take a photo to your ID Front, Make sure it’s clear",
                              cubit: () {
                                digifiedController
                                    .scanNationalId(idFace: NationalId.front_id)
                                    .then((scanVal) {
                                  if (scanVal.containsKey(true)) {
                                    // Navigator.pushNamed(
                                    //     context, VerifyFrontIdentityScreen.id);
                                    cubit
                                        .changeActiveStep(cubit.activeStep + 1);
                                  }
                                });
                              }),
                          AddIdBody(
                              image: digifiedController.backNatIdCard?.path,
                              context: context,
                              title: "ID Card (Back)",
                              subTitle:
                                  "Please take a photo to your ID Back, Make sure it’s clear",
                              cubit: () {
                                digifiedController
                                    .scanNationalId(idFace: NationalId.back_id)
                                    .then((scanVal) => {
                                          if (scanVal.containsKey(true))
                                            {
                                              // Navigator.pushNamed(context,
                                              //     VerifyBackIdentityScreen.id),
                                              cubit.changeActiveStep(
                                                  cubit.activeStep + 1)
                                            }
                                        });
                              }),
                          AddIdBody(
                              image: digifiedController.myFaceImage?.path,
                              context: context,
                              title: "Take a Selfie of your face",
                              subTitle:
                                  "Please make sure you have a clear background.",
                              cubit: () {
                                digifiedController
                                    .scanMyFace()
                                    .then((faceVal) => {
                                          if (faceVal)
                                            {
                                              setState(() {
                                                print("***************************");
                                                digifiedController
                                                    .scanNationalId(
                                                        idFace:
                                                            NationalId.back_id)
                                                    .then((scanVal) => {
                                                          // if (scanVal
                                                          //     .containsKey(
                                                          //         true))
                                                          //   {
                                                              // print("999999999999999999999"),
                                                              // Navigator.push(
                                                              //   context,
                                                              //   MaterialPageRoute(
                                                              //       builder:
                                                              //           (context) =>
                                                              //               VerifyCapturedPhotoScreen(
                                                              //                 idSide: scanVal[true] ?? NationalId.undefined,
                                                              //               )),
                                                              // )
                                                           // }
                                                        });
                                              }),
                                              setState(() {
                                                cubit.changeActiveStep(
                                                    cubit.activeStep + 1);
                                              }),
                                            }
                                          // else if (faceVal.containsKey(true))
                                          //   {
                                          //     Navigator.push(
                                          //         context,
                                          //         MaterialPageRoute(
                                          //             builder: (context) =>
                                          //                 VerifyCapturedPhotoScreen(
                                          //                     idSide: faceVal[
                                          //                             true] ??
                                          //                         NationalId
                                          //                             .undefined))),
                                          //   }
                                          else
                                            {}
                                        });
                              }),
                          AddIdBody(
                              context: context,
                              title: "Take a photo of your face right",
                              subTitle:
                                  "Please make sure you have a clear background.",
                              image: digifiedController.myFaceImageRight?.path,
                              cubit: () {
                                digifiedController
                                    .scanMyFaceRight()
                                    .then((faceVal) => {
                                          if (faceVal)
                                            {
                                              cubit.changeActiveStep(
                                                  cubit.activeStep + 1)
                                            }
                                        });
                              }),
                          AddIdBody(
                              context: context,
                              title: "Take a photo of your face left",
                              subTitle:
                                  "Please make sure you have a clear background.",
                              image: digifiedController.myFaceImageLeft?.path ??
                                  "",
                              cubit: () {
                                digifiedController
                                    .scanMyFaceLeft()
                                    .then((faceVal) => {
                                          if (faceVal)
                                            {
                                              cubit.changeActiveStep(
                                                  cubit.activeStep + 1)
                                            }
                                        });
                              }),
                          ConfirmationBody(
                            context: context,
                            title: "Confirmation",
                            subTitle:
                                "Please make sure you have entered the correct information",
                            idFront: digifiedController.frontNatIdCard?.path,
                            idBack: digifiedController.backNatIdCard?.path,
                            face: digifiedController.myFaceImage?.path,
                            faceRight:
                                digifiedController.myFaceImageRight?.path,
                            faceLeft: digifiedController.myFaceImageLeft?.path,
                          ),
                        ],
                      ),
                    ).hP25,
                    const BodyExtraSmallText(
                            "If you are facing any difficulties, please get in touch")
                        .vP8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const BodyExtraSmallText("with us on "),
                        InkWell(
                          onTap: () {},
                          child: const BodyExtraSmallText(
                            "Whatsapp",
                            weight: FontWeight.bold,
                          ),
                        )
                      ],
                    ).bP8,
                    DefaultTextButton(
                            context: context,
                            function: () {
                              setState(() {
                                if (digifiedController.frontNatIdCard?.path ==
                                        null ||
                                    digifiedController.frontNatIdCard?.path ==
                                        "") {
                                  checkImageAndShowToast(
                                      image: digifiedController
                                          .frontNatIdCard?.path,
                                      message:
                                          "please enter your front Nat Id Card");
                                } else if (digifiedController
                                            .frontNatIdCard?.path ==
                                        null ||
                                    digifiedController.frontNatIdCard?.path ==
                                        "") {
                                  checkImageAndShowToast(
                                      image: digifiedController
                                          .frontNatIdCard?.path,
                                      message:
                                          "Please Enter Your Front Nat Id Card");
                                } else if (digifiedController
                                            .backNatIdCard?.path ==
                                        null ||
                                    digifiedController.backNatIdCard?.path ==
                                        "") {
                                  checkImageAndShowToast(
                                      image: digifiedController
                                          .backNatIdCard?.path,
                                      message:
                                          "Please Enter Your Back Nat Id Card");
                                } else if (digifiedController
                                            .myFaceImage?.path ==
                                        null ||
                                    digifiedController.myFaceImage?.path ==
                                        "") {
                                  checkImageAndShowToast(
                                      image:
                                          digifiedController.myFaceImage?.path,
                                      message: "Please Enter Your Face Image");
                                } else if (digifiedController
                                            .myFaceImageRight?.path ==
                                        null ||
                                    digifiedController.myFaceImageRight?.path ==
                                        "") {
                                  checkImageAndShowToast(
                                      image: digifiedController
                                          .myFaceImageRight?.path,
                                      message:
                                          "Please Enter Your Face Image Right");
                                } else if (digifiedController
                                            .myFaceImageLeft?.path ==
                                        null ||
                                    digifiedController.myFaceImageLeft?.path ==
                                        "") {
                                  checkImageAndShowToast(
                                      image: digifiedController
                                          .myFaceImageLeft?.path,
                                      message:
                                          "Please Enter Your Face Image Left");
                                } else {
                                  AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.success,
                                      animType: AnimType.rightSlide,
                                      onDismissCallback: (DismissType type) {
                                        Navigator.pushNamed(
                                            context, HomeScreen.id);
                                      },
                                      body: Column(
                                        children: [
                                          const BodyLargeText(
                                            "Done",
                                            weight: FontWeight.normal,
                                            color: KHeadTextColor,
                                          ).bp(50),
                                          const BodyMediumText(
                                            "We will review your account and get back to you very shortly",
                                            weight: FontWeight.normal,
                                            color: KMainTextColor,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          ).bp(50),
                                        ],
                                      )).show();
                                }
                              });
                            },
                            text: "Save",
                            color: KMainTextColor)
                        .p8
                  ],
                ).tP16.hP8;
              }),
        ),
      ),
    );
  }
}
