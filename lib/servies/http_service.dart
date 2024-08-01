import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';
import 'env.dart';
import 'helpers.dart';

String? url = Env.baseUrl ?? "";

Dio dio = Dio();

CancelToken cancelToken = CancelToken();

Future<dynamic> post(link, data,
    {Function? onSendProgress,
    Function? onRecieveProgress,
    bool hasBaseUrl = true,
    bool hasCustomHeaderToken = false,
    String? customToken}) async {
  if (await Helper.checkInternetConnectivity()) {
    String token = await getToken() ?? '';
    String lang = await getLang();
    logger(data.toString());
    logger(lang.toString());
    var finalLink = hasBaseUrl ? "$url/$link" : link;
    logger("final post url inside Api.dart = $finalLink \nand lang is $lang");
    return dio
        .post(
      finalLink,
      options: Options(sendTimeout: 10000
      //!10000
      .seconds, receiveTimeout:
       //!10000
       10000.seconds, headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader:
            hasCustomHeaderToken ? customToken : 'Bearer $token',
        'lang': lang,
      }),
      data: data,
      onReceiveProgress: onRecieveProgress as void Function(int, int)?,
      onSendProgress: onSendProgress as void Function(int, int)?,
    )
        .then((response) {
      // dio.close();
      logger(response.toString());

      return response.data;
    });
  }
}

Future<dynamic> get(
  String link, {
  bool hasBaseUrl = true,
}) async {
  if (await Helper.checkInternetConnectivity()) {
    String? token = await getToken() ?? "";

    String langcode = await getLang();

    logger("language = $langcode");
    var finalLink = hasBaseUrl ? "$url/$link" : link;
    logger("final get url inside Api.dart = $finalLink");
    return dio
        .get(finalLink,
            options: Options(headers: {
              HttpHeaders.acceptHeader: "application/json",
              HttpHeaders.authorizationHeader:
                  token == null ? null : "Bearer $token",
              "lang": langcode
            }))
        .then((response) {
      return response.data;
    });
  } else {
    Get.snackbar("error".tr, AppConstants.INVALID_CONNECTION.tr,
        snackPosition: SnackPosition.BOTTOM);
  }
}

Future<dynamic> delete(link) async {
  String token = await getToken() ?? '';

  logger("final Delete url inside Api.dart = $url/$link");

  return dio
      .delete('$url/$link',
          options: Options(headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          }))
      .then((response) {
    return response.data;
  });
}

Future<dynamic> postFullLink(fullLink, data,
    {onRecieveProgress, onSendProgress}) async {
      debugPrint(data.toString());
  return dio
      .post('$fullLink',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
          }),
          data: data,
          onReceiveProgress: onRecieveProgress,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress)
      .then((response) {
    return response.data;
  });
}

Future<dynamic> postWithVolatileToken(link, data,
    {required String? volatileToken,
    Function? onSendProgress,
    Function? onRecieveProgress}) async {
  logger(data.toString());
  String? langcode = await getLang();
  logger(
      "final post url without token inside Api.dart = $url/$link \n volatile token = $volatileToken");
  return dio
      .post(
    '$url/$link',
    options: Options(headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $volatileToken',
      'lang': langcode
    }),
    data: data,
    onReceiveProgress: onRecieveProgress as void Function(int, int)?,
    onSendProgress: onSendProgress as void Function(int, int)?,
  )
      .then((response) {
    logger(response.toString());
    return response.data;
  });
}
Future getToken() async {
  return await box.read(
    'token',
  );
}
