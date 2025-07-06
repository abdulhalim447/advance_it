import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/mobile_layout.dart';
import 'screens/smart_earning_section/leadership_screen.dart';

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
        fontFamily: 'SolaimanLipi',
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
      ),
      home: MobileLayout(),
      routes: {'/smart-earning': (context) => const LeadershipScreen()},
    );
  }
}
