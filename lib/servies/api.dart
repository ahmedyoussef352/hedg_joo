class Api {
  Api._();
  static const signInSocialMedia = "user/signInSocialMedia";
  static const signInEmail = "user/login";
  static const registerEmail = "user/register";
  static const getProfile = "user/getProfile";
  static const clientLogout = "user/logout";
  static const updateProfile = "user/updateProfile";
}



class DigifiedApi{
  DigifiedApi._();
  static const init = "https://ekyc2.digified.io/init";
  static const extract = "https://ekyc2.digified.io/extract";
  static const verifyFace = "https://ekyc2.digified.io/match";
  static const results = "https://ekyc2.digified.io/results";
  
}