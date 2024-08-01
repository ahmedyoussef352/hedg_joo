import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../repositories/submit_instapay_receipt_repo.dart';
import 'confirm_deposit_state.dart';

class ConfirmDepositCubit extends Cubit<ConfirmDepositState> {
  final InstapayTopUpRepository repository = InstapayTopUpRepository();

  ConfirmDepositCubit() : super(ConfirmDepositInitial());

  File? receiptImage;

  void removeImage() {
    receiptImage = null;
    emit(RemoveImageState());
  }

  Future<void> pickImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      receiptImage = File(image.path);
      emit(PickedImageState());
    }
  }

  Future<void> createTopUpTransaction({required double amount, required String receiptPath}) async {
    emit(ConfirmDepositLoading());
    try {
      await repository.createTopUpTransaction(amount: amount, receiptPath: receiptPath);
      emit(ConfirmDepositSuccess());
    } catch (e) {
      emit(ConfirmDepositFailure(e.toString()));
    }
  }
}
