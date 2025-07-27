import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFFFFC107); // Yellow primary color
  static const Color accentColor = Color(0xFF2962FF); // Bright blue accent
  static const Color backgroundColor = Colors.white;
  static const Color errorColor = Colors.red;
  static const Color textColor = Colors.black87;
  static const Color secondaryTextColor = Colors.black54;
  static const Color tabBarTextColor = Colors.white;
  static const Color tabBarUnselectedTextColor = Colors.black87;
  static const Color iconBlue = Color(0xFF0D47A1); // Darker blue for icons
  static const Color cardShadowColor = Color(
    0x332962FF,
  ); // Soft blue shadow for cards

  // Green colors for auth screens
  static const Color greenPrimary = Color(0xFF4CAF50); // Main green color
  static const Color greenDark = Color(
    0xFF2E7D32,
  ); // Darker green for gradients

  // System UI
  static SystemUiOverlayStyle get systemUiStyle => const SystemUiOverlayStyle(
    statusBarColor: primaryColor,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: primaryColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        primary: primaryColor,
        secondary: accentColor,
        background: backgroundColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: iconBlue,
        iconTheme: IconThemeData(color: iconBlue),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: iconBlue,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      tabBarTheme: const TabBarThemeData(
        labelColor: tabBarTextColor,
        unselectedLabelColor: tabBarUnselectedTextColor,
        indicatorColor: tabBarTextColor,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: iconBlue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: textColor),
        bodyMedium: TextStyle(color: secondaryTextColor),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        selectedItemColor: iconBlue,
        unselectedItemColor: Colors.black54,
      ),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
        primary: primaryColor,
        secondary: accentColor,
      ),
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: iconBlue,
        iconTheme: IconThemeData(color: iconBlue),
        centerTitle: true,
      ),
      tabBarTheme: const TabBarThemeData(
        labelColor: tabBarTextColor,
        unselectedLabelColor: tabBarUnselectedTextColor,
        indicatorColor: tabBarTextColor,
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: iconBlue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(color: Colors.white70),
        bodyMedium: TextStyle(color: Colors.white60),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        selectedItemColor: iconBlue,
        unselectedItemColor: Colors.grey[400],
      ),
    );
  }
}
