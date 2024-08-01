
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HedgTextLabel extends StatelessWidget {
  const HedgTextLabel({
    Key? key,
    required this.labelText,
    this.labelSize = 16,
    this.labelWeight = FontWeight.w600,
    this.labelAlign,
    this.labelColor = Colors.blue,
    this.expanded = false,
    this.labelStyle,
    this.width,
    this.height,
    this.overFlow,
    this.textDecoration,
    this.maxLines,
    this.softWrap = true,
    this.textScaleFactor = 1,
    this.isRtl = false,
    this.opacity = 1,
    this.customFont,
  }) : super(key: key);
  final String? labelText;
  final double? labelSize;
  final FontWeight labelWeight;
  final TextAlign? labelAlign;
  final Color labelColor;
  final bool expanded;
  final TextDecoration? textDecoration;
  final TextStyle? labelStyle;
  final double? width;
  final double? height;
  final TextOverflow? overFlow;
  final int? maxLines;
  final bool? softWrap;
  final double? textScaleFactor;
  final bool isRtl;
  final double? opacity;
  final String? customFont;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? Get.width : width,
      height: height,
      child: Text(labelText ??"---",
          softWrap: softWrap,
          textAlign: labelAlign,
          textScaleFactor: textScaleFactor,
          textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
          overflow: overFlow,
          maxLines: maxLines,
          style: labelStyle ??
              TextStyle(
                fontSize: labelSize,
                color: labelColor.withOpacity(opacity ?? 1),
                decoration: textDecoration,
                fontWeight: labelWeight,
              )),
    );
  }
}
