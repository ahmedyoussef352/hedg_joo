import 'package:flutter/material.dart';
import 'package:hedg/extention/extetion.dart';
import '../../components/custom_texts.dart';
import '../../constants/constant_colors.dart';

class BankAccountWidget extends StatefulWidget {
  const BankAccountWidget(
      {Key? key,
      required this.name,
      required this.bankName,
      required this.IBAN,
      required this.accNumber})
      : super(key: key);
  final String name;

  final String bankName;

  final String IBAN;

  final String accNumber;

  @override
  _BankAccountWidgetState createState() => _BankAccountWidgetState();
}

class _BankAccountWidgetState extends State<BankAccountWidget> {
  bool isOptionsVisible = false;

  void changeOptionsVisibility() {
    setState(() {
      isOptionsVisible = !isOptionsVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BodyExtraSmallText("Account Details").bP16,
                  BodySmallText(
                    widget.name,
                    weight: FontWeight.bold,
                  ).bP8,
                  const BodyExtraSmallText("Bank Name").bP8,
                  BodySmallText(
                    widget.bankName,
                    weight: FontWeight.bold,
                  ).bP8,
                  const BodyExtraSmallText("Account Number").bP8,
                  BodySmallText(
                    widget.accNumber,
                    weight: FontWeight.bold,
                  ).bP8,
                  const BodyExtraSmallText("IBAN").bP8,
                  BodySmallText(
                    widget.IBAN,
                    weight: FontWeight.bold,
                  ).bP8,
                ],
              ),
              IconButton(
                onPressed: changeOptionsVisibility,
                icon: const Icon(Icons.more_vert_rounded),
              ),
            ],
          ).p16,
        ),
        if (isOptionsVisible)
          PositionedDirectional(
            end: 55,
            top: 55,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                border: Border.all(color: KUnselectedColor),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.edit,
                          size: 18,
                          color: KMainTextColor,
                        ),
                        const BodySmallText("Edit").hP8,
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                    child: Divider(
                      color: KUnselectedColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.delete,
                          size: 18,
                          color: KMainTextColor,
                        ),
                        const BodySmallText("Delete").hP8,
                      ],
                    ),
                  ),
                ],
              ).vP8,
            ),
          ),
      ],
    ).bP16;
  }
}
