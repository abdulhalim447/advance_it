import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget desktopLayout;

  const ResponsiveLayout({
    super.key,
    required this.mobileLayout,
    required this.desktopLayout,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < AppConstants.tabletBreakpoint) {
          // Mobile layout
          return mobileLayout;
        } else {
          // Desktop layout
          return desktopLayout;
        }
      },
    );
  }

  // Helper method to check if current device is mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < AppConstants.tabletBreakpoint;
  }

  // Helper method to check if current device is desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppConstants.tabletBreakpoint;
  }
}
