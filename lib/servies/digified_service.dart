import 'package:dio/dio.dart';

import 'api.dart';
import 'digified_constants.dart';
import 'http_service.dart';

class DigifiedService {
  DigifiedService._();

  static Future initScanningProcess({
    required String? apiKey,
    int? apiVer = 1,
    String? warnAction = "report",
    required String? userName,
    required String? phone,
    required String? email,
  }) {
    return postFullLink(
      DigifiedApi.init,
      {
        DigifiedConstants.API_KEY: apiKey,
        DigifiedConstants.API_VER: apiVer,
        DigifiedConstants.WARN_ACTION: warnAction,
        DigifiedConstants.USERNAME: userName,
        DigifiedConstants.PHONE: phone,
        DigifiedConstants.EMAIL: email,
      },
    );
  }

  // static Future extractRequest({
  //   required String? token,
  //   String? document = "egyID",
  //   String? format = "multipart",
  //   required MultipartFile? front,
  //   required MultipartFile? back,
  // }) {
  //   return post(
  //     DigifiedApi.extract,
  //     {
  //       DigifiedConstants.FORMAT: format,
  //       DigifiedConstants.FRONT: front,
  //       DigifiedConstants.BACK: back,
  //       DigifiedConstants.DOCUMENT: document,
  //       DigifiedConstants.TOKEN: token,
  //     },
  //     hasBaseUrl: false,
  //     hasCustomHeaderToken: true,
  //     customToken: ""

  //   );

  static Future extractRequest(
      {required FormData extractFormData, onRecieveProgress, onSendProgress}) {
    return postFullLink(
      DigifiedApi.extract,
      extractFormData,
      onRecieveProgress: onRecieveProgress,
      onSendProgress: onSendProgress,
    );
  }

  static Future verifyMyFace(
      {required FormData faceFormData, onRecieveProgress, onSendProgress}) {
    return postFullLink(
      DigifiedApi.verifyFace,
      faceFormData,
      onRecieveProgress: onRecieveProgress,
      onSendProgress: onSendProgress,
    );
  }

  static Future getResults({required String token}) {
    return get(
      DigifiedApi.results+"?token=$token",
      hasBaseUrl: false
    
    );
  }
}
