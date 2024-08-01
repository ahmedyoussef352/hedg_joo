import 'package:flutter/material.dart';
import 'package:hedg/screens/id_confirmation_screen/capture_face_photo.dart';
import 'package:hedg/screens/id_confirmation_screen/review_national_id.dart';
import 'package:hedg/screens/id_confirmation_screen/verify_back_identity.dart';
import 'package:hedg/screens/id_confirmation_screen/verify_captured_photo.dart';
import 'package:hedg/screens/id_confirmation_screen/verify_front_identity.dart';
import 'package:hedg/screens/screens.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return {
    OnboardingScreen.id: (context) => const OnboardingScreen(),
    LoginScreen.id: (context) => IdConfirmationScreen(),
    ForgetPassScreen.id: (context) => ForgetPassScreen(),
    EnterCodeScreen.id: (context) => EnterCodeScreen(),
    NewPassScreen.id: (context) => NewPassScreen(),
    SignupScreen.id: (context) => SignupScreen(),
    VerifyScreen.id: (context) => VerifyScreen(),
    IdConfirmationScreen.id: (context) => const IdConfirmationScreen(),
    HomeScreen.id: (context) => const HomeScreen(),
    PreformanceScreen.id: (context) => const PreformanceScreen(),
    OrdersScreen.id: (context) => const OrdersScreen(),
    TopUpScreen.id: (context) => const TopUpScreen(),
    DebitCardScreen.id: (context) => DebitCardScreen(),
    InstaPayScreen.id: (context) => InstaPayScreen(),
    ConfirmDepositScreen.id: (context) => ConfirmDepositScreen(),
    VodafoneCashScreen.id: (context) => const VodafoneCashScreen(),
    VodafoneCashPayment.id: (context) => VodafoneCashPayment(),
    BankTransferScreen.id: (context) => const BankTransferScreen(),
    CashDepositScreen.id: (context) => CashDepositScreen(),
    WireTransferScreen.id: (context) => WireTransferScreen(),
    ConfirmTransferScreen.id: (context) => ConfirmTransferScreen(),
    ConservativeExploreScreen.id: (context) => const ConservativeExploreScreen(),
    AggressiveExploreScreen.id: (context) => const AggressiveExploreScreen(),
    CalculatorScreen.id: (context) => const CalculatorScreen(),
    CustomPlanScreen.id: (context) => CustomPlanScreen(),
    GuidanceScreen.id: (context) => GuidanceScreen(),
    BuyScreen.id: (context) => BuyScreen(),
    MyAccountScreen.id: (context) => MyAccountScreen(),
    BankInfoScreen.id: (context) => const BankInfoScreen(),
    AddAccScreen.id: (context) => const AddAccScreen(),
    AboutUsScreen.id: (context) => const AboutUsScreen(),
    TermsConditionsScreen.id: (context) => const TermsConditionsScreen(),
    TransactionHistoryScreen.id: (context) => const TransactionHistoryScreen(),
    SettingsScreen.id: (context) => const SettingsScreen(),
    NotificationsSettingsScreen.id: (context) => const NotificationsSettingsScreen(),
    SecurityScreen.id: (context) => const SecurityScreen(),
    ChangePassScreen.id: (context) => ChangePassScreen(),
    ChangeQuestionScreen.id: (context) => ChangeQuestionScreen(),
    
    FaqScreen.id: (context) => const FaqScreen(),
      VerifyBackIdentityScreen.id :(context) => const VerifyBackIdentityScreen(),
    VerifyFrontIdentityScreen.id : (context) => const VerifyFrontIdentityScreen(),
    ReviewNationalIdScreen.id : (context) => const ReviewNationalIdScreen(),
    CaptureFaceImageScreen.id: (context) => const CaptureFaceImageScreen()

  
    
  };
}
