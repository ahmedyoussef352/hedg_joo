// import 'package:dio/dio.dart';

// import 'constants.dart';

// Future<void> initScanningProcess({
//   String? warnAction = "report",
//   required String? userName,
//   required String? phone,
//   required String? email,
// }) async {
//   Dio dio = Dio();
//   try {
//     final response = await dio.post(
//       init,
//       data: {
//         'apiKey': API_KEY,
//         'apiVer': API_VER,
//         'warnAction': warnAction,
//         'userName': userName,
//         'phone': phone,
//         'email': email,
//       },
//     );
//     print(response.data);
//   } catch (e) {
//     print(e);
//   }
// }

// Future<void> extractRequest({
//   required FormData extractFormData,
//   ProgressCallback? onReceiveProgress,
//   ProgressCallback? onSendProgress,
// }) async {
//   Dio dio = Dio();
//   try {
//     final response = await dio.post(
//       extract,
//       data: extractFormData,
//       onReceiveProgress: onReceiveProgress,
//       onSendProgress: onSendProgress,
//     );
//     print(response.data);
//   } catch (e) {
//     print(e);
//   }
// }

// Future<void> verifyMyFace({
//   required FormData faceFormData,
//   ProgressCallback? onReceiveProgress,
//   ProgressCallback? onSendProgress,
// }) async {
//   Dio dio = Dio();
//   try {
//     final response = await dio.post(
//       verifyFace,
//       data: faceFormData,
//       onReceiveProgress: onReceiveProgress,
//       onSendProgress: onSendProgress,
//     );
//     print(response.data);
//   } catch (e) {
//     print(e);
//   }
// }

// Future<void> getResults({required String token}) async {
//   Dio dio = Dio();
//   try {
//     final response = await dio.get('$results/?token=$token');
//     print(response.data);
//   } catch (e) {
//     print(e);
//   }
// }
