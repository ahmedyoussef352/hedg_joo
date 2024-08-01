// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get/get.dart';
// import 'package:hedg/servies/helpers.dart';
// import 'package:hedg/servies/http_service.dart';



// class FirebaseController extends GetxController {
//   FirebaseController._();

//   factory FirebaseController() => _instance;
//   static final FirebaseController _instance = FirebaseController._();

//   final FirebaseMessaging _fbm = FirebaseMessaging.instance;
//   bool _initialized = false;
//   String? pushToken;

//   @override
//   void onInit() {
//     super.onInit();
//     if (!_initialized) {
//       _fbm.requestPermission();
//       _fbm.setForegroundNotificationPresentationOptions(
//           alert: true, badge: true, sound: true);
//       FirebaseMessaging.onMessage.listen((RemoteMessage msg) {
//         logger(msg.data.toString());
//       });

//       _fbm.getInitialMessage().then((RemoteMessage? msg) {
//         logger(msg.toString());
//       });

//       FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage msg) {
//         logger('onMessageOpenedApp data: ${msg.data.toString()}');
//       });

//       _initialized = true;
//     }
//   }

//   @override
//   void onReady() async {
//     super.onReady();
//     if (await getToken() == null) {
//       ///[has no token]

//       initPushFirebase();
//     } else {
//       ///[has token]
//       pushToken = await getpushToken();
//       if (pushToken == null || pushToken?.isEmpty == true) {
//         initPushFirebase();
//       }
//     }
//   }

//   Future<String?> initPushFirebase() async {
//     logger("calling initPushFirebase");
//     String? token = await _fbm.getToken();
//     pushToken = token;
//     logger('token ===> ' + token!);
//     setPushToken(token);
//     return token;
//   }

//   Future<void> deleteFirebaseToken() async {
//     await _fbm.deleteToken();
//     logger('deleting FCM token  ');
//   }

//   Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//     logger("handling background message ${message.notification?.title}");
//     logger("handling background message ${message.notification?.body}");
//     logger("handling background message ${message.data}");
//   }
// }
