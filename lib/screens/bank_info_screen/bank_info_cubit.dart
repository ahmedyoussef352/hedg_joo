import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/components/bank_acc_item.dart';

import 'bank_info_state.dart';

class BankInfoCubit extends Cubit<BankInfoState> {
  BankInfoCubit() : super(BankInfoInitial());
  bool isOptionsVisible = false;
  List<Widget> accounts = [];
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final bankNameController = TextEditingController();
  final IBANController = TextEditingController();
  final accNumberController = TextEditingController();

  void addAccount() {
    accounts.add(
      BankAccountWidget(
        name: nameController.text,
        bankName: bankNameController.text,
        accNumber: accNumberController.text,
        IBAN: IBANController.text,
      ),
    );
    nameController.clear();
    bankNameController.clear();
    accNumberController.clear();
    IBANController.clear();
    emit(BankInfoAddAccountState());
  }
}
