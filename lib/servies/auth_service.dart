import 'package:hedg/servies/api.dart';

import 'constants.dart';
import 'http_service.dart';

class AuthService {
  AuthService._();

  static Future registerWithSocialMedia(
      {String? name,
      String? providerId,
      String? providerName,
      String? pushToken,
      String? profileUrl}) {
    return post(Api.signInSocialMedia, {
      AppConstants.NAME: name,
      AppConstants.PROVIDER_ID: providerId,
      AppConstants.PROVIDER_NAME: providerName,
      AppConstants.PUSH_TOKEN: pushToken,
      AppConstants.PROFILE_IMAGE: profileUrl
    });
  }

  static Future loginWithEmail({
    String? email,
    String? password,
    String? pushToken,
  }) {
    return post(Api.signInEmail, {
      AppConstants.EMAIL: email,
      AppConstants.PASSWORD: password,
      AppConstants.PUSH_TOKEN: pushToken,
    });
  }


static Future registerWithEmail({
  String? name,
    String? email,
    String? password,
    String? phone,
    String? pushToken,
  }) {
    return post(Api.registerEmail, {
      AppConstants.NAME: name,
      AppConstants.EMAIL: email,
      AppConstants.PASSWORD: password,
      AppConstants.PHONE: phone,
      AppConstants.PUSH_TOKEN: pushToken,
    });
  }


  static Future getUserProfile() {
    return get(Api.getProfile, );
  }

  static Future logout() {
  return get(
    Api.clientLogout,
  );
}

  static updateProfile({String? name, String? email,String? phone}) {
      return post(Api.updateProfile, {
      AppConstants.NAME: name,
      AppConstants.EMAIL: email,
      AppConstants.PHONE: phone,
    });

  }

  static Future updateSocialProfile(
    {String? name,
    String? email,
    String? phone,
    
    required String? token}) {
  return postWithVolatileToken(
      Api.updateProfile,
      {
        AppConstants.NAME: name,
        AppConstants.EMAIL: email,
        AppConstants.PHONE: phone,
        
      },
      volatileToken: token);
}

}
