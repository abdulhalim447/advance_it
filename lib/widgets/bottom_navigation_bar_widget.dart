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
      unselectedItemColor: Colors.grey[600],
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'হোম'),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'উদ্দ্যোক্তা',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'ওয়ালেট'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'লাইভ চ্যাট'),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
