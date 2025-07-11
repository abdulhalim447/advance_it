import 'package:advance_it_ltd/screens/advance_nitimala/advamce_nitimala.dart';
import 'package:advance_it_ltd/screens/income_point_scection/advance_point.dart';
import 'package:advance_it_ltd/screens/income_summary/income_summary.dart';
import 'package:advance_it_ltd/screens/privacy_policy/privacy_policy.dart';
import 'package:advance_it_ltd/screens/settings/settings_screen.dart';
import 'package:advance_it_ltd/screens/shofotnama/sofotnama_screen.dart';
import 'package:advance_it_ltd/screens/support_section/support_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/mobile_layout.dart';
import 'screens/smart_earning_section/leadership_screen.dart';
import 'screens/income_point_scection/income_point_screen.dart';
import 'screens/about_us/about_us_screen.dart';
import 'screens/paymen_method_section/add_payment_method.dart';
import 'screens/paymen_method_section/payment_methods_screen.dart';

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

  runApp(const SelfAppClone());

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
    return MaterialApp(
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
      home: MobileLayout(),
      routes: {
        '/dashboard': (context) => const MobileLayout(),
        '/smart-earning': (context) => const LeadershipScreen(),
        '/income-point': (context) => const IncomePointScreen(),
        '/advance-point': (context) => const AdvancePointScreen(),
        '/about': (context) => const AboutUsScreen(),
        '/add-payment-method': (context) => const AddPaymentMethod(),
        '/payment-methods': (context) => const PaymentMethodsScreen(),
        '/sofotnama': (context) => const SofotnamaScreen(),
        '/support': (context) => const SupportScreen(),
        '/nitimala': (context) => const AdvanceNitimalaScreen(),
        '/privacy-policy': (context) => const PrivacyPolicy(),
        '/income-summary': (context) => const IncomeSummary(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
