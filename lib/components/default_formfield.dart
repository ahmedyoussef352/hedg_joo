import 'package:flutter/material.dart';
import 'package:hedg/extention/extetion.dart';

import '../constants/constant_colors.dart';

/// default form field

class DefaultFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType type;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final bool isPassword;
  final bool readOnly;
  final String? Function(String?)? validate;
  final String? label;
  final Widget? prefix;
  final Widget? suffix;
  final Function()? prefixPressed;
  final Function()? onTap;
  final bool isClickable;
  final bool? isCenter;
  final String? hint;

  const DefaultFormField({
    Key? key,
    required this.controller,
    required this.type,
    this.onSubmit,
    this.onChange,
    this.isPassword = false,
    this.readOnly = false,
    required this.validate,
    this.label,
    this.hint,
    this.prefix,
    this.suffix,
    this.prefixPressed,
    this.onTap,
    this.isCenter = false,
    this.isClickable = true,
  }) : super(key: key);

  @override
  _DefaultFormFieldState createState() => _DefaultFormFieldState();
}

class _DefaultFormFieldState extends State<DefaultFormField> {
  late TextDirection _textDirection = TextDirection.ltr;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      controller: widget.controller,
      keyboardType: widget.type,
      obscureText: widget.isPassword,
      onFieldSubmitted: widget.onSubmit,
      textAlign: widget.isCenter == true ? TextAlign.center : TextAlign.start,
      style: TextStyle(
          color: KMainTextColor.withOpacity(0.5),
          fontWeight: FontWeight.bold,
          fontSize: 12),
      onChanged: (value) {
        setState(() {
          _textDirection = _getTextDirection(value);
        });
      },
      onTap: widget.onTap,
      enabled: widget.isClickable,
      validator: widget.validate,
      textDirection: _textDirection,
      decoration: InputDecoration(
        floatingLabelBehavior: widget.isCenter == false
            ? FloatingLabelBehavior.auto
            : FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        labelText: widget.label,
        hintText: widget.hint,
        labelStyle: TextStyle(
            color: KMainTextColor.withOpacity(0.5),
            fontWeight: FontWeight.bold,
            fontSize: 12),
        prefixIcon: widget.prefix != null
            ? IconButton(
                onPressed: widget.prefixPressed,
                icon: widget.prefix!,
              )
            : null,
        suffixIcon: widget.suffix,
        errorStyle: const TextStyle(fontSize: 10),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1, color: Colors.black12)),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1, color: Colors.red)),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1, color: Colors.black12)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 2, color: KHeadTextColor)),
      ),
    );
  }

  TextDirection _getTextDirection(String text) {
    bool hasArabicCharacters = RegExp(
            r'[\u0600-\u06FF\u0750-\u077F\u0590-\u05FF\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]')
        .hasMatch(text);
    return hasArabicCharacters ? TextDirection.rtl : TextDirection.ltr;
  }
}

/// main text form field

class MianTextFormField extends StatelessWidget {
  const MianTextFormField({
    super.key,
    this.animalNameController,
    required this.labelText,
    this.textInputType,
    this.height,
    this.validation,
    this.isReadOnly,
  });

  final TextEditingController? animalNameController;
  final String labelText;
  final TextInputType? textInputType;
  final double? height;
  final String? Function(String?)? validation;
  final bool? isReadOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: const BorderDirectional(
          bottom: BorderSide(color: KHeadTextColor, width: 1),
          start: BorderSide(color: KHeadTextColor, width: 0.5),
        ),
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 3,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        readOnly: isReadOnly ?? false,
        controller: animalNameController,
        keyboardType: textInputType,
        obscureText: false,
        onFieldSubmitted: (value) {},
        onChanged: (value) {},
        validator: validation,
        decoration: InputDecoration(
          labelText: labelText,
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
          floatingLabelStyle: const TextStyle(color: KMainTextColor),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelStyle: const TextStyle(
              color: KMainTextColor, fontWeight: FontWeight.bold, fontSize: 12),
          enabledBorder: const OutlineInputBorder(
              gapPadding: 20,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(width: 2, color: Colors.transparent)),
          focusedBorder: const OutlineInputBorder(
              gapPadding: 50,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(width: 3, color: Colors.transparent)),
        ),
      ),
    ).hP16.tP16;
  }
}

/// main drop down form field

class MianDropDownFormField extends StatelessWidget {
  const MianDropDownFormField(
      {Key? key,
      required this.animalTypeController,
      required this.labelText,
      required this.items,
      this.validation})
      : super(key: key);

  final TextEditingController animalTypeController;
  final String labelText;
  final List<String> items;
  final String? Function(String?)? validation;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: const BorderDirectional(
          bottom: BorderSide(color: KHeadTextColor, width: 1),
          start: BorderSide(color: KHeadTextColor, width: 0.5),
        ),
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 3,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        style: const TextStyle(
          color: KMainTextColor,
        ),
        borderRadius: BorderRadius.circular(30),
        validator: validation,
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelStyle: const TextStyle(color: KMainTextColor),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelStyle: const TextStyle(
              color: KMainTextColor, fontWeight: FontWeight.bold, fontSize: 12),
          enabledBorder: OutlineInputBorder(
              gapPadding: 20,
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  const BorderSide(width: 2, color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              gapPadding: 50,
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  const BorderSide(width: 3, color: Colors.transparent)),
        ),
        isExpanded: true,
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            animalTypeController.text = value;
          }
        },
      ),
    ).hP16.tP16;
  }
}
