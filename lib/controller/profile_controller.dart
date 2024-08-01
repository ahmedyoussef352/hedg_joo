import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hedg/models/user.dart';
import 'package:hedg/servies/http_service.dart';

import '../servies/helpers.dart';

class ProfileController extends GetxController {
  ///[social media]

  ///[User Data]
  UserProfileData? _userData = UserProfileData();
  UserProfileData? get userData => _userData;

  ///[User Data]

  ///[Apple Data]

  @override
  onInit() async {
    super.onInit();
    if (await getToken() != null && await getUserData() != null) {
      var localUserData = await getUserData();
      _userData = UserProfileData.fromJson(localUserData);
      var verification = await getUserVerification() ?? false;
      _userData?.hasVerifiedHisAccount = verification;
    }
  }

  void deleteLocalCred() {
    box.remove("token");
    box.remove("push_token");
    box.remove("user_data");
    box.remove("apple_user_data");
    box.remove("social_type");
    box.erase();
    setlang(Get.locale?.languageCode.toString());
  }

  setUserVerification() {
    _userData?.hasVerifiedHisAccount = true;
    update();
  }
}
