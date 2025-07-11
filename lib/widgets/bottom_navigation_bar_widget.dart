import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

/// Custom Bottom Navigation Bar Widget
class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    this.currentIndex = 0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppConstants.primaryColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'হোম'),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/uddokta_icon.png',
            width: 24,
            height: 24,
          ),
          activeIcon: Image.asset(
            'assets/icons/uddokta_icon.png',
            width: 24,
            height: 24,
          ),
          label: 'উদ্দ্যোক্তা',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'প্রোফাইল'),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/support.png', width: 24, height: 24),
          activeIcon: Image.asset(
            'assets/icons/support.png',
            width: 24,
            height: 24,
          ),
          label: 'সাপোর্ট',
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
