import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/add_acc_screen/add_acc_screen.dart';
import 'package:hedg/screens/bank_info_screen/bank_info_state.dart';
import '../../components/custom_texts.dart';
import 'bank_info_cubit.dart';

class BankInfoScreen extends StatelessWidget {
  const BankInfoScreen({super.key});

  static String id = "BankInfoScreen";

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<BankInfoCubit>(context);
    return BlocBuilder<BankInfoCubit, BankInfoState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
          title: const BodyMediumText(
            "Bank Information",
            weight: FontWeight.bold,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BodyMediumText(
                "Bank Accounts",
                weight: FontWeight.bold,
              ).bP16,
              cubit.accounts.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.not_interested_rounded,
                            size: 50,
                            color: KMainTextColor.withOpacity(0.5),
                          ),
                          const BodyMediumText("You Don't Have Bank Account"),
                          const BodyMediumText("Please Add Your Bank Account"),
                        ],
                      ),
                    ).tp(100)
                  : Column(
                      children: cubit.accounts,
                    ),
              DefaultTextButton(
                      context: context,
                      function: () {
                        Navigator.pushNamed(context, AddAccScreen.id);
                      },
                      text: "Add Bank Account",
                      color: KMainTextColor)
                  .p16
            ],
          ).p16,
        ),
      ),
    );
  }
}
