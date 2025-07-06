import 'package:flutter/material.dart';

class AppConstants {
  // App colors
  static const Color primaryColor = Colors.amber;

  // App text styles
  static const TextStyle titleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'SolaimanLipi',
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'SolaimanLipi',
  );

  // Screen size breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;
}
