import 'dart:io';

import 'package:dotted_border/dotted_border.dart' as dotted_border;
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hedg/components/custom_texts.dart';
import 'package:hedg/constants/constant_sizes.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/id_confirmation_screen/id_confirmation_cubit.dart';

import '../constants/constant_colors.dart';
import '../models/country_code_model.dart';

Widget DefaultTextButton({
  required BuildContext context,
  required Function()? function,
  required String text,
  double? width,
  Color? color,
  Color? borderColor,
  Color? textColor,
  bool? hasBorder,
  IconData? icon,
  String? subText,
  isSmallButton = false,
}) =>
    SizedBox(
        width: width,
        child: TextButton(
            onPressed: function,
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: color ?? Colors.transparent,
              fixedSize: Size(AppSizes.getScreenWidth(context), 50),
              side: hasBorder != null
                  ? BorderSide(
                      color: borderColor ?? Colors.transparent, width: 2)
                  : null,
            ),
            child: Row(
              mainAxisAlignment: subText == null
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    size: 18,
                    color: KHeadTextColor,
                  ).hP16,
                isSmallButton == false
                    ? BodyMediumText(text,
                        color: textColor ?? Colors.white,
                        weight: FontWeight.bold)
                    : BodyExtraSmallText(text,
                        color: textColor ?? Colors.white,
                        weight: FontWeight.bold),
                if (subText != null)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      BodyExtraSmallText(
                        "EGP",
                        color: textColor ?? Colors.white,
                      ).hP4.bp(1),
                      BodyMediumText(subText,
                          color: textColor ?? Colors.white,
                          weight: FontWeight.bold)
                    ],
                  )
              ],
            ).hP16));

Widget DefaultElevatedButton({
  required Function()? function,
  required String text,
  double? width,
  Color? color,
  Color? borderColor,
  double? borderRadius,
  Color? textColor,
  bool? hasBorder,
  IconData? icon,
}) =>
    ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 20),
          ),
          overlayColor: KHeadTextColor.withOpacity(0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            BodySmallText(
              text,
              color: textColor ?? KHeadTextColor,
              weight: FontWeight.bold,
            ),
            if (icon != null)
              Icon(
                icon,
                size: 18,
                color: textColor ?? KHeadTextColor,
              ).hP4,
          ],
        ));

Widget CountryCodesSheet({
  required context,
  required cubit,
}) {
  return SizedBox(
    height: AppSizes.getScreenHeight(context) / 1.5,
    width: AppSizes.getScreenWidth(context),
    child: SingleChildScrollView(
      child: Column(children: [
        const BodyLargeText(
          "Select your country code",
          weight: FontWeight.bold,
          color: KHeadTextColor,
        ).bP16,
        SizedBox(
          height: AppSizes.getScreenHeight(context),
          child: ListView.builder(
            itemCount: countryCodes.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pop(context);
                cubit.changeCountryCode(code: countryCodes[index].code);
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BodyMediumText(
                      countryCodes[index].name,
                      color: KMainTextColor,
                    ),
                    BodyMediumText(countryCodes[index].code,
                        color: KMainTextColor),
                  ]).hP16.vP8,
            ),
          ),
        )
      ]),
    ),
  );
}

SnackBar AppSnackBar({
  required String content,
  required Color color,
}) =>
    SnackBar(
      elevation: 20,
      duration: const Duration(seconds: 1),
      showCloseIcon: true,
      backgroundColor: color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      content: Text(content),
    );

EasyStep StepItem({
  required title,
  required stepIndex,
  required image,
}) =>
    EasyStep(
      customTitle: BodyExtraSmallText(
        title,
        color: (image ==null || image =="")?KMainTextColor  : KHeadTextColor,
      ),
      customStep: BodyMediumText(
        stepIndex.toString(),
        color: (image ==null || image == "") ? KMainTextColor : Colors.white,
      ),
    );

    EasyStep StepItemConFirmation({
  required title,
  required stepIndex,
  required image,
}) =>
    EasyStep(
      customTitle: BodyExtraSmallText(
        title,
        color: image==false ? KMainTextColor : KHeadTextColor,
      ),
      customStep: BodyMediumText(
        stepIndex.toString(),
        color:image == false ? KMainTextColor : Colors.white,
      ),
    );

Widget AddIdBody({
  required context,
  required String title,
  required subTitle,
  required cubit,
  String? image,
}) =>
    SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: BodyLargeText(
                  title,
                  weight: FontWeight.normal,
                  textAlign: TextAlign.start,
                ),
              ).bP16,
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: BodySmallText(
                  subTitle,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ).bp(30).p(30),
          InkWell(
            onTap: cubit,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: image == null || image == ""
                ? dotted_border.DottedBorder(
                    strokeWidth: 2,
                    borderPadding: const EdgeInsets.all(20),
                    borderType: dotted_border.BorderType.RRect,
                    radius: const Radius.circular(12),
                    dashPattern: const [9, 9, 9, 9],
                    color: const Color(0xffDDE5E9),
                    child: SizedBox(
                      width: AppSizes.getScreenWidth(context),
                      height: 200,
                      child: const Icon(
                        Icons.add,
                        size: 32,
                        color: Color(0xffD1DCE2),
                      ),
                    ),
                  ).bP25
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      fit: BoxFit.fill,
                      File(image),
                      height: 200,
                      width: AppSizes.getScreenWidth(context),
                    )).p(20).bP25,
          )
        ],
      ),
    );

Widget ConfirmationBody({
  required context,
  required String title,
  required subTitle,
  required idFront,
  required idBack,
  required face,
  required faceRight,
  required faceLeft,
}) =>
    SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: BodyLargeText(
                  title,
                  weight: FontWeight.normal,
                  textAlign: TextAlign.start,
                ),
              ).bP16,
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: BodySmallText(
                  subTitle,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ).p(30),
          if (idFront != null)
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      fit: BoxFit.fill,
                      File(idFront),
                      height: 200,
                      width: AppSizes.getScreenWidth(context),
                    )),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffFCDDD5),
                        borderRadius: BorderRadius.circular(5)),
                    child: InkWell(
                      onTap:  () {
                        var cubit =
                            BlocProvider.of<IdConfirmationCubit>(context);
                        cubit.removeImage(0);
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ).p4,
                    ),
                  ),
                )
              ],
            ).p(20),
          if (idBack != null)
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      fit: BoxFit.fill,
                      File(idBack),
                      height: 200,
                      width: AppSizes.getScreenWidth(context),
                    )),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffFCDDD5),
                        borderRadius: BorderRadius.circular(5)),
                    child: InkWell(
                      onTap: () {
                        var cubit =
                            BlocProvider.of<IdConfirmationCubit>(context);
                        cubit.removeImage(1);
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ).p4,
                    ),
                  ),
                )
              ],
            ).p(20),
          if (face != null)
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      fit: BoxFit.fill,
                      File(face),
                      height: 200,
                      width: AppSizes.getScreenWidth(context),
                    )),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffFCDDD5),
                        borderRadius: BorderRadius.circular(5)),
                    child: InkWell(
                      onTap: () {
                        var cubit =
                            BlocProvider.of<IdConfirmationCubit>(context);
                        cubit.removeImage(2);
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ).p4,
                    ),
                  ),
                )
              ],
            ).p(20),
          if (faceRight != null)
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      fit: BoxFit.fill,
                      File(faceRight),
                      height: 200,
                      width: AppSizes.getScreenWidth(context),
                    )),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffFCDDD5),
                        borderRadius: BorderRadius.circular(5)),
                    child: InkWell(
                      onTap: () {
                        var cubit =
                            BlocProvider.of<IdConfirmationCubit>(context);
                        cubit.removeImage(3);
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ).p4,
                    ),
                  ),
                )
              ],
            ).p(20),
          if (faceLeft != null)
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      fit: BoxFit.fill,
                      File(faceLeft),
                      height: 200,
                      width: AppSizes.getScreenWidth(context),
                    )),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffFCDDD5),
                        borderRadius: BorderRadius.circular(5)),
                    child: InkWell(
                      onTap: () {
                        var cubit =
                            BlocProvider.of<IdConfirmationCubit>(context);
                        cubit.removeImage(4);
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ).p4,
                    ),
                  ),
                )
              ],
            ).p(20),
          if (idFront == null &&
              idBack == null &&
              face == null &&
              faceRight == null &&
              faceLeft == null)
            Center(
              child: const BodyMediumText(
                "Please swipe back and enter your informations.",
                maxLines: 2,
                color: Colors.red,
                textAlign: TextAlign.center,
              ).p(20),
            ).tp(50)
        ],
      ),
    );


void showOkAlertDialog({
  required BuildContext context,
  required String title,
  required String message,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

void checkImageAndShowToast({required dynamic image, required message}) {
  if (image == null || image == "") {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  } else {
    // Proceed with your logic for a valid image
  }
}
void errorShowToast({required message}) {
  {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  } 
}
Widget MyPensionsItem(
        {required image,
        required imageBackground,
        required title,
        required holeEntry,
        required subEntry,
        required isLose,
        Function()? onTap}) =>
    Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff098AD3).withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(0, 3),
            ),
          ]),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: imageBackground,
                        borderRadius: BorderRadius.circular(5)),
                    child: Image.asset(
                      image,
                      scale: 2,
                    ).p8),
                BodyMediumText(title).hP8,
              ],
            ),
            Column(
              children: [
                BodyMediumText(holeEntry),
                Container(
                    decoration: BoxDecoration(
                        color: isLose
                            ? Colors.red.withOpacity(0.1)
                            : KHeadTextColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5)),
                    child: BodySmallText(
                      subEntry,
                      color: isLose ? Colors.red : KHeadTextColor,
                    ).p4),
              ],
            ),
          ],
        ).p16,
      ),
    ).bP8;

Widget DefaultTab({
  String? title,
  Color? titleColor,
  Function()? onTap,
  bool? hasShadow = true,
  required Color selectedColor,
}) =>
    AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: selectedColor,
        boxShadow: hasShadow == true
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
        borderRadius: BorderRadius.circular(15),
      ),
      constraints: const BoxConstraints(minHeight: 35, maxHeight: 35),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null)
              BodyExtraSmallText(
                title,
                color: titleColor,
              ).p4.hP4,
          ],
        ),
      ),
    ).hP4;

Widget OrderItem({
  required String title,
  required String subTitle,
  required String date,
  IconData? icon,
  String? status,
}) =>
    Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff098AD3).withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(0, 3),
            ),
          ]),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon ?? Icons.repeat_rounded,
                  size: 20,
                ).tP4,
                Column(
                  children: [
                    BodyMediumText(title, weight: FontWeight.bold).bP8,
                    BodySmallText(
                      date,
                    ),
                  ],
                ).hP16,
              ],
            ),
            Column(
              children: [
                BodyMediumText(subTitle, weight: FontWeight.bold).bP8,
                if (status != null)
                  BodySmallText(
                    status,
                    color: status == "Pending"
                        ? Colors.grey
                        : status == "Fulfilled"
                            ? Colors.green
                            : status == "Cancelled"
                                ? Colors.red
                                : KHeadTextColor,
                    weight: FontWeight.bold,
                  ),
              ],
            ),
          ],
        ).p16,
      ),
    ).bP8.hP8;

Widget TopUpItem({
  required String fees,
  required String title,
  required String image,
  required Function() onTap,
  required String duration,
}) =>
    Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff098AD3).withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(0, 3),
            ),
          ]),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: onTap,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BodySmallText(fees),
              ],
            ).bP16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(image),
                    BodyMediumText(title, weight: FontWeight.bold).hP25,
                  ],
                ),
                const Icon(Icons.arrow_forward_ios_outlined)
              ],
            ).hP8.bP16,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BodyMediumText(duration),
              ],
            ).hP8
          ],
        ).p16,
      ),
    ).bP8;

Widget ExploreItem({
  required BuildContext context,
  required String title,
  String? subTitle,
  required Color color,
  required String image,
  Function()? onTap,
  bool? isBuy = false,
}) =>
    Container(
      width: AppSizes.getScreenWidth(context),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff098AD3).withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(0, 3),
            ),
          ]),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyMediumText(
                  title,
                  weight: FontWeight.bold,
                ).bP4,
                if (isBuy == false && subTitle != null)
                  BodySmallText(
                    subTitle,
                  ),
              ],
            ),
            Image.asset(
              image,
              scale: isBuy == true ? 1.5 : 1,
            ),
          ],
        ).p25,
      ),
    );

Widget ProfileItem({
  required IconData? icon,
  required String? title,
  required Function()? onTap,
}) =>
    InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: KMainTextColor,
                size: 18,
              ),
              BodyMediumText(
                title!,
              ).hP16,
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
            color: KMainTextColor,
          )
        ],
      ),
    );

Widget NotificationItem({
  required String title,
  required String subTitle,
  required String date,
  required Color color,
  String? image,
}) =>
    Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (image != null)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: color,
                      ),
                      child: Image.asset(
                        image,
                        scale: 2,
                      ).p8,
                    ).rP8,
                  BodySmallText(
                    title,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
              BodyExtraSmallText(
                date,
              ).hP8
            ],
          ).bP8,
          BodySmallText(
            subTitle,
            maxLines: 3,
            textAlign: TextAlign.start,
          )
        ],
      ).p16,
    );

Widget TransactionsItem({
  required String date,
  required Widget icon,
  required String amount,
  required String info,
  required String status,
  required bool isIncome,
}) =>
    Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
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
              BodySmallText(date),
              Row(
                children: [
                  BodyMediumText(
                    amount,
                    weight: FontWeight.bold,
                    color: isIncome ? KHeadTextColor : Colors.red,
                  ).hP8,
                  Transform.flip(
                      flipX: isIncome ? false : true,
                      child: Icon(Icons.reply_rounded,
                          color: isIncome ? KHeadTextColor : Colors.red)),
                ],
              ),
            ],
          ).bP8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  icon,
                  BodySmallText(info).hP8,
                ],
              ),
              BodySmallText(status),
            ],
          )
        ],
      ).p16,
    );

Widget SettingsItem({
  required String title,
  bool? isRed,
  required Function()? onTap,
}) =>
    InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.info,
                color: KMainTextColor,
                size: 15,
              ),
              BodySmallText(
                title,
                color: isRed == true ? Colors.red : KMainTextColor,
              ).hP8,
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: KMainTextColor,
            size: 15,
          )
        ],
      ),
    );

Widget AppSwitch({
  required String title,
  required bool value,
  required Function(bool) onChanged,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BodySmallText(
          title,
          weight: FontWeight.bold,
        ),
        SizedBox(
          width: 40,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Switch(
              value: value,
              activeTrackColor: const Color(0xff86DCFF),
              onChanged: onChanged,
              trackOutlineWidth: WidgetStateProperty.all(0),
              activeColor: Colors.white,
            ),
          ),
        ),
      ],
    );

Widget AppExpansionTile({
  required String title,
  required List<Widget> children,
  ExpansionTileController? controller,
}) =>
    ExpansionTile(
      title: const BodySmallText(
        "",
      ),
      controller: controller,
      tilePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      dense: true,
      leading: BodySmallText(
        title,
        weight: FontWeight.bold,
      ),
      childrenPadding: const EdgeInsets.all(12),
      children: children,
    );

Widget FAQExpansionTile({
  required String title,
  required List<Widget> children,
}) =>
    Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffD5E6FF),
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      child: ExpansionTile(
        title: const BodySmallText(
          "",
        ),
        tilePadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        dense: true,
        leading: SizedBox(
          width: 250,
          child: BodyExtraSmallText(
            title,
            maxLines: 3,
            textAlign: TextAlign.start,
            weight: FontWeight.bold,
          ),
        ),
        childrenPadding: const EdgeInsets.all(12),
        children: children,
      ).p16,
    );
