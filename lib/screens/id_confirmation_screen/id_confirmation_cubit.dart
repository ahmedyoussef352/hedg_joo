import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'id_confirmation_state.dart';

class IdConfirmationCubit extends Cubit<IdConfirmationState> {
  IdConfirmationCubit() : super(IdConfirmationInitial());

  PageController pageController = PageController();
  double linePercent = 0.0;

  Timer? _timer;

  int activeStep = 0;
  File? iDFront;
  File? iDBack;
  File? face;
  File? faceRight;
  File? faceLeft;
  File? selectedImage;

  void removeImage(imageToRemove) {
    switch (imageToRemove) {
      case 0:
        iDFront = null;
        break;
      case 1:
        iDBack = null;
        break;
      case 2:
        face = null;
        break;
      case 3:
        faceRight = null;
        break;
      case 4:
        faceLeft = null;
        break;
    }
    emit(RemoveImage());
  }

  void changeActiveStep(int index) async {
    activeStep = index;
    pageController.jumpToPage(
      activeStep,
    );
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }

    linePercent = 0.0;
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (linePercent < 1.0) {
        linePercent += 0.3;
        if (linePercent > 1.0) {
          linePercent = 1.0;
        }
        emit(LinePercent());
      } else {
        timer.cancel();
      }
    });

    emit((ChangeActiveStep()));
  }

  void changePage(int index) {
    activeStep = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    emit(ChangePage());
  }

  Future<void> pickImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    selectedImage = File(image!.path);
    switch (activeStep) {
      case 0:
        iDFront = selectedImage;
        break;
      case 1:
        iDBack = selectedImage;
        break;
      case 2:
        face = selectedImage;
        break;
      case 3:
        faceRight = selectedImage;
        break;
      case 4:
        faceLeft = selectedImage;
        break;
    }
    emit(PickedImageState());
  }
}
