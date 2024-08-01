import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

class Helper {
  static Future<bool> checkInternetConnectivity() async {
    //! final ConnectivityResult connectivityResult =
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      debugPrint('No Internet  Connection from Helper file');
      return false;
    } else {
      return false;
    }
  }

  static Future<void> deleteCacheDir() async {
    var tempDir = await getTemporaryDirectory();
    try {
      if (tempDir.existsSync()) {
        tempDir.deleteSync(recursive: true);
        debugPrint("delete cache called");
      }
    } catch (e) {
      debugPrint("deleteCacheDir() error ");
    }
  }

  static Future<void> deleteAppDir() async {
    var appDocDir = await getApplicationDocumentsDirectory();
    try {
      if (appDocDir.existsSync()) {
        appDocDir.deleteSync(recursive: true);
      }
    } catch (e) {
      debugPrint("deleteAppDir() error ");
      debugPrint("$e");
    }
  }
}

GetStorage box = GetStorage();

void softUpdateLocale() {
  Get.updateLocale(
    Get.locale!.languageCode == "en" ? const Locale("ar") : const Locale("en"),
  );

  logger("now app locale is ${Get.locale}");
}

String? getCurrentLocale() {
  return Get.locale?.languageCode;
}

Future<String> getLang() async {
  ////TODO: [for now return en]
  String code = box.read('lang') == 'ar' ? 'ar' : 'en';
  return code;
  // return "ar";
}

setlang(code) async {
  Get.updateLocale(Locale(code));
  box.write('lang', code);
}

void logger(String message, {String title = ""}) {
  if (kDebugMode) {
    log(message, time: DateTime.now(), name: title);
  }
}

bool isRTLLocale() {
  return Get.locale?.languageCode == "ar" ? true : false;
}

Future getDigifiedToken() async {
  return box.read(
    'digified_token',
  );
}

Future<String> getDigifiedLastTime() async {
  return box.read(
        'digified_time',
      ) ??
      DateTime.now().toIso8601String();
}

Future<void> setUserVerification(data) async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  box.write('user_verified', data);
}

Future<void> setDigifiedToken(dgToken) async {
  box.write('digified_token', dgToken);
}

Future<void> setDigifiedLastTime(DateTime lastTime) async {
  return await box.write('digified_time', lastTime.toIso8601String());
}

Future<void> setUserData(data) async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  box.write('user_data', data);
}

Future<void> setToken(token) async {
  return box.write('token', token);
}

Future<void> setPushToken(token) async {
  box.write('push_token', token);
}

Future getUserVerification() async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // if (prefs.getString('user') != null) {
  //   return prefs.getString('user');
  // } else
  //   return null;
  return box.read(
    'user_verified',
  );
}

Future getpushToken() async {
  return box.read(
    'push_token',
  );
}

Future getUserData() async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // if (prefs.getString('user') != null) {
  //   return prefs.getString('user');
  // } else
  //   return null;
  return box.read(
    'user_data',
  );
}
bool isSmallPhone() {
  if (Get.height <= 592) {
    return true;
  } else {
    return false;
  }
}

bool isMediumPhone() {
  ///[was changed to 760 to include ]
  if (Get.height >= 592 && Get.height <= 760) {
    return true;
  } else {
    return false;
  }
}

bool isBigPhone() {
  if (Get.height >= 761 && Get.height <= 930) {
    return true;
  } else {
    return false;
  }
}
