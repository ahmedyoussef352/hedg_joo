import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hedg/controller/digified_controller.dart';
import 'package:hedg/controller/firebase_controller.dart';
import 'package:hedg/controller/profile_controller.dart';
import 'package:hedg/repositories/phone_otp_repository.dart';
import 'package:hedg/repositories/signup_repository.dart';
import 'package:hedg/screens/orders_history/Orders_cubit.dart';
import 'package:hedg/servies/env.dart';
import 'package:hedg/shared_prefs/shared_prefs.dart';
import 'package:hedg/screens/screens.dart';
import 'package:hedg/screens/cubits.dart';
import 'package:firebase_core/firebase_core.dart';


import 'app_routes.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  
  bool? showLogin;
  try {
    showLogin = CacheHelper.getBoolean(key: "ShowLogin");
  } on Exception {
    showLogin = false;
  }
  // Check if access_token exists in SharedPreferences
  String? accessToken = await TokenService().getToken();

  // Determine the initial route based on the existence of access_token
  String initialRoute = accessToken != null ? HomeScreen.id : OnboardingScreen.id;

    Env.init();
    await GetStorage.init();

    Get.put(ProfileController());
    Get.put(DigifiedController());
    runApp(MyApp(initialRoute: initialRoute));

}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingCubit(),

        ),
        BlocProvider(
          create: (context) => ForgetPassCubit(),
        ),
        BlocProvider(create: (context) => NewPassCubit()),
        BlocProvider(
          create: (context) => SignupCubit(SignupRepository()),
        ),
        BlocProvider(
          create: (context) => VerifyCubit(VerifyRepository()),
        ),
        BlocProvider(
          create: (context) => IdConfirmationCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => PerformanceCubit(),
        ),
        BlocProvider(
          create: (context) => OrdersCubit(),
        ),
        BlocProvider(
          create: (context) => ConfirmDepositCubit(),
        ),
        BlocProvider(create: (context) => CalculatorCubit()),
        BlocProvider(create: (context) => GuidanceCubit()),
        BlocProvider(create: (context) => BankInfoCubit()),
        BlocProvider(
          create: (context) => NotificationsSettingsCubit(),
        ),
        BlocProvider(create: (context) => ChangeQuestionCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: "Poppins"),
        routes: getAppRoutes(),
        initialRoute: initialRoute,
      ),
    );
  }
}
