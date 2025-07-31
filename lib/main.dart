import 'package:advance_it_ltd/screens/advance_nitimala/advamce_nitimala.dart';
import 'package:advance_it_ltd/screens/auth/form_screen.dart';
import 'package:advance_it_ltd/screens/auth/login_screen.dart';
import 'package:advance_it_ltd/screens/auth/otp_screen.dart';
import 'package:advance_it_ltd/screens/auth/signup_screen.dart';
import 'package:advance_it_ltd/screens/income_report_section/income_report_screen.dart';
import 'package:advance_it_ltd/screens/mediahub/live_tv_screen.dart';
import 'package:advance_it_ltd/screens/newshub/news_gridScren.dart';
import 'package:advance_it_ltd/screens/profile_section/additional_info.dart';
import 'package:advance_it_ltd/screens/profile_section/adrees_screen.dart';
import 'package:advance_it_ltd/screens/income_point_scection/advance_point.dart';
import 'package:advance_it_ltd/screens/income_summary/income_summary.dart';
import 'package:advance_it_ltd/screens/privacy_policy/privacy_policy.dart';
import 'package:advance_it_ltd/screens/profile_section/documents_upload.dart';
import 'package:advance_it_ltd/screens/profile_section/dream_section/dream_screen.dart';
import 'package:advance_it_ltd/screens/profile_section/nominee_screen.dart';
import 'package:advance_it_ltd/screens/profile_section/personal_info.dart';
import 'package:advance_it_ltd/screens/profile_section/profile-screen.dart';
import 'package:advance_it_ltd/screens/see_more_projects/see_more_projects_screen.dart';
import 'package:advance_it_ltd/screens/settings/settings_screen.dart';
import 'package:advance_it_ltd/screens/shofotnama/sofotnama_screen.dart';
import 'package:advance_it_ltd/screens/smart_earning_projects/greeting_confirmed.dart';
import 'package:advance_it_ltd/screens/smart_earning_projects/normal_customer_screen.dart';
import 'package:advance_it_ltd/screens/smart_earning_projects/payment_screen.dart';
import 'package:advance_it_ltd/screens/smart_earning_projects/premium_user_screen.dart';
import 'package:advance_it_ltd/screens/smart_earning_projects/course_overview.dart';
import 'package:advance_it_ltd/screens/smart_earning_projects/smart_sub_greeting.dart';
import 'package:advance_it_ltd/screens/smart_earning_projects/smart_subcription_overview.dart';
import 'package:advance_it_ltd/screens/support_section/support_screen.dart';
import 'package:advance_it_ltd/screens/uddokta_section/uddokta_screen.dart';
import 'package:advance_it_ltd/providers/animation_providers.dart';
import 'package:advance_it_ltd/providers/address_provider.dart';
import 'package:advance_it_ltd/providers/payment_provider.dart';
import 'package:advance_it_ltd/widgets/greeting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'screens/mobile_layout.dart';
import 'screens/income_point_scection/income_point_screen.dart';
import 'screens/about_us/about_us_screen.dart';
import 'screens/paymen_method_section/add_payment_method.dart';
import 'screens/paymen_method_section/payment_methods_screen.dart';
import 'screens/profile_section/basic_info_screen.dart';
import 'screens/profile_section/dream_section/add_dream_screen.dart';
import 'screens/auth/auth_welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set system UI overlay style with white status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
        // Add other providers here if you have any
      ],
      child: const SelfAppClone(),
    ),
  );

  // Apply again after app starts to ensure it overrides any theme-based changes
  Future.delayed(const Duration(milliseconds: 100), () {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  });
}

class SelfAppClone extends StatelessWidget {
  const SelfAppClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GridAnimationProvider()),
        ChangeNotifierProvider(create: (_) => PageTransitionProvider()),
        ChangeNotifierProvider(create: (_) => AnimationSettingsProvider()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Advance IT LTD',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          //fontFamily: 'SolaimanLipi',
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
        home: AuthWelcomeScreen(),
        routes: {
          '/dashboard': (context) => const MobileLayout(),
          '/normal_user': (context) => const NormalCustomerScreen(),
          '/premium_user': (context) => const PremiumUserScreen(),
          '/course-overview': (context) => const CourseOverviewScreen(),
          '/payment_screen': (context) => const PaymentScreen(),
          '/greeting-confirm': (context) => const GreetingConfirmScreen(),
          '/smart-sub-greeting': (context) => const SmartSubGreeting(),
          '/smart-subscription': (context) => const SmartSubcriptionOverview(),
          '/see-more-projects': (context) => const SeeMoreProjectsScreen(),

          //navigation drawer section ===============================================
          '/income-point': (context) => const IncomePointScreen(),
          '/advance-point': (context) => const AdvancePointScreen(),
          '/about': (context) => const AboutUsScreen(),
          '/add-payment-method': (context) => const AddPaymentMethod(),
          '/payment-methods': (context) => const PaymentMethodsScreen(),
          '/sofotnama': (context) => const SofotnamaScreen(),
          '/support': (context) => const SupportScreen(),
          '/nitimala': (context) => const AdvanceNitimalaScreen(),
          '/privacypolicy': (context) => const PrivacyPolicy(),
          '/income-summary': (context) => const IncomeSummary(),
          '/settings': (context) => const SettingsScreen(),
          '/income-report': (context) => IncomeReportScreen(),

          //============================================================================
          '/uddokta': (context) => const UddoktaScreen(),
          '/profile': (context) => const ProfileScreenWidget(),
          '/basic-info': (context) => const BasicInfoScreen(),
          '/personal-info': (context) => const PersonalInfoScreen(),
          '/documents': (context) => const DocumentsUploadScreen(),
          '/address': (context) => const AddressScreen(),
          '/nominee': (context) => const NomineeScreen(),
          '/additional-info': (context) => const AdditionalInfoScreen(),
          '/dream-info': (context) => const DreamScreen(),
          '/add-dream': (context) => const AddDreamScreen(),
          '/auth-welcome': (context) => const AuthWelcomeScreen(),
          '/news-hub': (context) => const NewsGridScreen(),
          '/live-channel': (context) => const LiveTvScreen(),
          '/sign-up': (context) => const SignUpScreen(),
          '/sign-in': (context) => const LoginScreen(),
          '/otp_screen': (context) => const OtpScreen(),
          '/form-screen': (context) => const FormScreen(),
          '/greeting': (context) => const GreetingScreen(),
        },
      ),
    );
  }
}
