import 'package:flutter/material.dart';

import '../constants/constant_colors.dart';

class FontSizes {
  static double scale = 1;

  static double get h1 => 48 * scale;

  static double get h2 => 40 * scale;

  static double get h3 => 32 * scale;

  static double get h4 => 24 * scale;

  static double get h5 => 20 * scale;

  static double get h6 => 18 * scale;

  static double get b1 => 18 * scale;

  static double get b2 => 16 * scale;

  static double get b3 => 14 * scale;

  static double get b4 => 12 * scale;

  static double get b5 => 10 * scale;
}

class TextWeight {
  static FontWeight get regular => FontWeight.w300;

  static FontWeight get medium => FontWeight.w500;

  static FontWeight get semiBold => FontWeight.w700;

  static FontWeight get bold => FontWeight.w900;
}

class BodyExtraLargeText extends StatelessWidget {
  final String text;

  final int? maxLines;
  final TextAlign? textAlign;
  final bool isUnderlined;
  final FontWeight? weight;
  final Color? color;

  const BodyExtraLargeText(this.text,
      {Key? key,
      this.isUnderlined = false,
      this.textAlign,
      this.maxLines,
      this.weight,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        style: TextStyle(
            decoration: isUnderlined ? TextDecoration.underline : null,
            decorationColor: color,
            fontSize: FontSizes.h3,
            color: color ?? KMainTextColor,
            fontWeight: weight ?? TextWeight.medium,
            overflow: TextOverflow.ellipsis));
  }
}

class BodyLargeText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool isUnderlined;
  final FontWeight? weight;
  final Color? color;
  final TextOverflow? textOverflow;

  const BodyLargeText(this.text,
      {Key? key,
      this.textAlign,
      this.maxLines,
      this.weight,
      this.color,
      this.isUnderlined = false,
      this.textOverflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.left,
        overflow: textOverflow ?? TextOverflow.clip,
        maxLines: maxLines,
        style: TextStyle(
            decoration: isUnderlined ? TextDecoration.underline : null,
            decorationColor: color,
            fontSize: FontSizes.h5,
            color: color ?? KMainTextColor,
            fontWeight: weight ?? TextWeight.semiBold));
  }
}

class BodyMediumText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final Color? color;
  final bool isUnderlined;

  const BodyMediumText(this.text,
      {Key? key,
      this.textAlign,
      this.maxLines,
      this.weight,
      this.color,
      this.isUnderlined = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        style: TextStyle(
            decoration: isUnderlined ? TextDecoration.underline : null,
            decorationColor: color,
            fontSize: FontSizes.b3,
            color: color ?? KMainTextColor,
            fontWeight: weight ?? TextWeight.medium,
            overflow: TextOverflow.ellipsis));
  }
}

class BodySmallText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool isUnderlined;
  final FontWeight? weight;
  final Color? color;

  const BodySmallText(this.text,
      {Key? key,
      this.textAlign,
      this.maxLines,
      this.weight,
      this.color,
      this.isUnderlined = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            decoration: isUnderlined ? TextDecoration.underline : null,
            decorationColor: color,
            fontSize: FontSizes.b4,
            overflow: TextOverflow.ellipsis,
            color: color ?? KMainTextColor,
            fontWeight: weight ?? TextWeight.medium));
  }
}

class BodyExtraSmallText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool isUnderlined;

  final FontWeight? weight;
  final Color? color;

  const BodyExtraSmallText(this.text,
      {Key? key,
      this.isUnderlined = false,
      this.textAlign,
      this.maxLines,
      this.weight,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.center,
        overflow: TextOverflow.clip,
        maxLines: maxLines,
        style: TextStyle(
            decoration: isUnderlined ? TextDecoration.underline : null,
            decorationColor: color,
            fontSize: FontSizes.b5,
            color: color,
            fontWeight: weight ?? TextWeight.medium));
  }
}
