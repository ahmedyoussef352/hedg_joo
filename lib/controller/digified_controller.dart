import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hedg/controller/profile_controller.dart';
import 'package:hedg/models/failure.dart';
import 'package:hedg/servies/digified_constants.dart';
import 'package:hedg/servies/digified_service.dart';
import 'package:hedg/servies/enum.dart';
import 'package:hedg/servies/extensions.dart';
import 'package:hedg/servies/helpers.dart';
import 'package:hedg/servies/http_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import '../models/verified_national_id.dart';
import 'package:dio/dio.dart';


class DigifiedController extends GetxController {
  ///[Loader]
  final ValueNotifier _loading = ValueNotifier(false);
  ValueNotifier get loading => _loading;

  final ValueNotifier _verificationDone = ValueNotifier(false);
  ValueNotifier get verificationDone => _verificationDone;

  ///[Loader]

  dio.Response<dynamic>? backendError;

  ///[images]
  XFile? _frontNatIdCard;
  XFile? get frontNatIdCard => _frontNatIdCard;
  XFile? _backNatIdCard;
  XFile? get backNatIdCard => _backNatIdCard;

  XFile? _myFaceImage;
  XFile? get myFaceImage => _myFaceImage;

  XFile? _myFaceImageRight;
  XFile? get myFaceImageRight => _myFaceImageRight;

  XFile? _myFaceImageLeft;
  XFile? get myFaceImageLeft => _myFaceImageLeft;

  ///[images]

  String? digifiedScanToken;
  double _uploading = 0.0;

  double get progrssVal => _uploading;
  String? get displayedProgressVal => progrssVal == 1
      ? "Please wait"
      : "${(progrssVal * 100).toStringAsFixed(2)}%";

  late final ImagePicker _picker = ImagePicker();

  final List<Map<String, dynamic>> _verificationTypes = [
    {
      "id": "egyID",
      "name": "National ID".replaceWithTransTempText("بطاقة الرقم القومي"),
      "icon": const Icon(Icons.chrome_reader_mode_rounded)
    },
    {
      "id": "commercialID",
      "name": "Commercial Registry",
      "icon": const Icon(Icons.description)
    },
    {
      "id": "drivingID",
      "name": "Driving license",
      "icon": const Icon(Icons.directions_car)
    },
    {"id": "passport", "name": "Passport", "icon": const Icon(Icons.flight)},
    {
      "id": "taxID",
      "name": "Tax Card",
      "icon": const Icon(Icons.request_quote)
    },
    {
      "id": "syndicateID",
      "name": "Syndicate Card",
      "icon": const Icon(Icons.business_center)
    },
    {
      "id": "clubID",
      "name": "Club ID",
      "icon": const Icon(Icons.fitness_center)
    },
  ];
  List<Map<String, dynamic>> get verificationTypes => _verificationTypes;

  final List<VerificationStep> _verificationStates = VerificationStep.values;
  List<VerificationStep> get verificationStates => _verificationStates;

  VerificationStep _selectedVerification = VerificationStep.scan_front_id;
  VerificationStep get selectedVerification => _selectedVerification;

  ///[Extracted Data]
  VerifiedNationalId? verifiedNationalId;
  String? _faceMsg;

  ///[Extracted Data]

  Future<Map<bool, NationalId>> scanNationalId(
      {NationalId idFace = NationalId.undefined}) async {
    var pickedSide = await _picker.pickImage(
      source: ImageSource.camera,
      // maxWidth: 600,
      // maxHeight: 600,
      // imageQuality: 10
    );
    //Guard clause
    if (pickedSide == null) return {false: NationalId.undefined};

    switch (idFace) {
      case NationalId.front_id:
        _frontNatIdCard = pickedSide;
        setVerificationStep(VerificationStep.verify_front_id);
        return {true: NationalId.front_id};

      case NationalId.back_id:
        setVerificationStep(VerificationStep.verify_back_id);
        _backNatIdCard = pickedSide;
        return {true: NationalId.back_id};
      case NationalId.undefined:
        return {false: NationalId.undefined};
    }
  }
//scanMyFace
  Future<bool> scanMyFace() async {
    var scannedFace = await _picker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front
        // maxWidth: 600,
        // maxHeight: 600,
        // imageQuality: 10
        );
    //Guard clause
    if (scannedFace == null) return false;
    setVerificationStep(VerificationStep.capture_face_picture);

    _myFaceImage = scannedFace;
    return true;
  }
//scanMyFaceRight
  Future<bool> scanMyFaceRight() async {
    var scannedFace = await _picker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front
        // maxWidth: 600,
        // maxHeight: 600,
        // imageQuality: 10
        );
    //Guard clause
    if (scannedFace == null) return false;
    setVerificationStep(VerificationStep.capture_face_Right_picture);

    _myFaceImageRight = scannedFace;
    return true;
  }
 //scanMyFaceLeft
  Future<bool> scanMyFaceLeft() async {
    var scannedFace = await _picker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front
        // maxWidth: 600,
        // maxHeight: 600,
        // imageQuality: 10
        );
    //Guard clause
    if (scannedFace == null) return false;
    setVerificationStep(VerificationStep.capture_face_Left_picture);

    _myFaceImageLeft = scannedFace;
    return true;
  }

  void setVerificationStep(VerificationStep step) {
    _selectedVerification = step;
    update();
  }

  Future<bool?> initVerificationStep() async {
    _selectedVerification = VerificationStep.scan_front_id;
    update();
    return await prepareDigified();
  }

  void increaseVerificationStep() {
    int currentStepIndex = _verificationStates.indexOf(_selectedVerification);
    int nextStepIndex = currentStepIndex + 1;
    // print("current step index is $currentStepIndex");
    // print("nextStepIndex step index is $nextStepIndex");
    if (nextStepIndex < _verificationStates.length) {
      _selectedVerification = _verificationStates[nextStepIndex];
    }
    // print(_selectedVerification);
    update();
  }

  void decreaseVerificationStep() {
    int currentStepIndex = _verificationStates.indexOf(_selectedVerification);
    int prevStepIndex = currentStepIndex - 1;
    // print("current step index is $currentStepIndex");
    // print("nextStepIndex step index is $prevStepIndex");
    if (prevStepIndex > -1) {
      _selectedVerification = _verificationStates[prevStepIndex];
      printInfo(
          info:
              "next step is ${_selectedVerification.progress}:$_selectedVerification");
    }

    update();
  }

  void dismissScanId() {
    _frontNatIdCard = null;
    _backNatIdCard = null;
    decreaseVerificationStep();
    if (_loading.value == true) {
      cancelExtractionRequest();
    }
    update();
  }

  Future<bool> canRecallDigifiedAfterInterval(
      {Duration interval = const Duration(hours: 2)}) async {
    if (await getDigifiedToken() == null) return true;
    String lastTimeCall = await getDigifiedLastTime();
    var lastTimeDateTime = DateTime.parse(lastTimeCall);
    print(DateTime.now().difference(lastTimeDateTime));

    if (DateTime.now().difference(lastTimeDateTime) > interval) {
      printInfo(info: "We can call api");
      return true;
    }
    return false;
  }

  Future<bool?> prepareDigified() async {
    // if (await canRecallDigifiedAfterInterval() == false) return true;
    try {
      var response = await DigifiedService.initScanningProcess(
        apiKey: "G8G95HYKNUNEMRRDD78FRJ415R6F5TDCQR9YZ2H2ZVMUZIYAIH3NECY7K832",
        // apiKey: "G8G95HYKNUNE",
        email: Get.find<ProfileController>().userData?.email,
        phone: Get.find<ProfileController>().userData?.phone,
        userName: Get.find<ProfileController>().userData?.name,
        apiVer: 1,
      );
      if (response != null) {
        if (response["next"] == "extract") {
          printInfo(info: response["token"]);
          digifiedScanToken = response["token"];
          setDigifiedToken(digifiedScanToken);
          setDigifiedLastTime(DateTime.now());
          return true;
        }
      }
      return null;
    } on DioError catch (e) {
      print("error ");
      print(e.message);
      print(e.response?.statusCode);
      return false;
    }
  }

  cancelExtractionRequest() {
    cancelToken.cancel();
    _loading.value = false;
    _uploading = 0.0;
    update();
  }

  Future<Map<bool, dynamic>> extractRequest() async {
    if (cancelToken.isCancelled) {
      cancelToken = CancelToken();
    }
    _loading.value = true;
    File frontFileName = File(_frontNatIdCard?.path ?? "");
    File backFileName = File(_backNatIdCard?.path ?? "");
    digifiedScanToken ??= await getDigifiedToken();
    // print(backFileName.path);
    // return;

    try {
      dio.FormData nationalIDFormData = dio.FormData.fromMap({
        DigifiedConstants.FORMAT: "multipart",
        DigifiedConstants.DOCUMENT: "egyID",
        DigifiedConstants.TOKEN: digifiedScanToken,
        DigifiedConstants.FRONT: dio.MultipartFile.fromFileSync(
            frontFileName.path,
            filename: _frontNatIdCard?.name),
        DigifiedConstants.BACK: dio.MultipartFile.fromFileSync(
            backFileName.path,
            filename: _backNatIdCard?.name),
      });

      var response = await DigifiedService.extractRequest(
          extractFormData: nationalIDFormData,
          onRecieveProgress: progressFn,
          onSendProgress: progressFn);
      _loading.value = false;
      print("gooo:$response");
      if (response["next"] == "match") {
        verifiedNationalId = VerifiedNationalId.fromJson(response);
        setVerificationStep(VerificationStep.analysis_national_id);
        return {true: "success"};
      } else {
        return {false: Failure.fromJson(response)};
      }
    } on DioError catch (e) {
      print(e.message);
      print(">>>>>>>>>>>>error response${e.response}");
      print(">>>>>>>>>>>>${e.type}");
      print(e.response?.statusCode.toString());
      _loading.value = false;
      var error = e.response?.data;
      error ??= Failure.exampleError;

      return {false: Failure.fromJson(error as Map<String, dynamic>)};
    } finally {
      update();
    }
  }


  Future<Map<bool, dynamic>> getVerificationResults() async {
    _loading.value = true;

    try {
      var token = await getDigifiedToken();
      var response = await DigifiedService.getResults(token: token);
      _loading.value = false;
      print("gooo:$response");

      setVerificationStep(VerificationStep.view_results);
      setUserVerification(true);
      Get.find<ProfileController>().setUserVerification();
      return {true: response};
    } on DioError catch (e) {
      print(e.message);
      print(">>>>>>>>>>>>error response${e.response}");
      print(">>>>>>>>>>>>${e.type}");
      print(e.response?.statusCode.toString());
      _loading.value = false;
      var error = e.response?.data;
      error ??= Failure.exampleError;

      return {false: Failure.fromJson(error as Map<String, dynamic>)};
    } finally {
      update();
    }
  }

  void progressFn(int rec, int total) {
    _uploading = (rec / total);
    debugPrint(_uploading.toString());
    update();
  }

  // void prepareExtractedNationalId() {
  //   // extractedData.toString().printInfo();
  //   // try {
  //     VerifiedNationalId nationalId =
  //         VerifiedNationalId.fromJson(extractedData);
  //     print(nationalId.front?.address);

  //   // }
  //   //  catch (e) {
  //   //   print("error while doing");
  //   // }

  // }

 

    Future<Map<bool, dynamic>> verifyMyFace() async {
    if (cancelToken.isCancelled) {
      cancelToken = CancelToken();
    }
    _loading.value = true;

    File myFaceName = File(_myFaceImage?.path ?? "");
    File myFaceNameLeft = File(_myFaceImageLeft?.path ?? "");
    File myFaceNameRight = File(_myFaceImageRight?.path ?? "");
    digifiedScanToken ??= await getDigifiedToken();
    // print(backFileName.path);
    // return;

    try {
       var file1 = dio.MultipartFile.fromFileSync(myFaceName.path,
          filename: _frontNatIdCard?.name);
      var file2 = dio.MultipartFile.fromFileSync(myFaceNameRight.path,
          filename: _frontNatIdCard?.name);
      var file3 = dio.MultipartFile.fromFileSync(myFaceNameLeft.path,
          filename: _frontNatIdCard?.name);

      dio.FormData faceFormData = dio.FormData.fromMap({
        DigifiedConstants.FORMAT: "multipart",
        DigifiedConstants.TOKEN: digifiedScanToken,
        DigifiedConstants.SELFIE: [file1,file2,file3]
      });

      var response = await DigifiedService.verifyMyFace(
          faceFormData: faceFormData,
          onRecieveProgress: progressFn,
          onSendProgress: progressFn);
      _loading.value = false;
      print("gooo:$response");
      _faceMsg = response['msg'];

      setVerificationStep(VerificationStep.verify_captured_face);
      _verificationDone.value = true;
      return {true: response};
    } on DioError catch (e) {
      print(e.message);
      print(">>>>>>>>>>>>error response${e.response}");
      print(">>>>>>>>>>>>${e.type}");
      print(e.response?.statusCode.toString());
      _loading.value = false;
      var error = e.response?.data;
      error ??= Failure.exampleError;

      return {false: Failure.fromJson(error as Map<String, dynamic>)};
    } finally {
      update();
    }
  }
}
