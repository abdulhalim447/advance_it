import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar_widget.dart';

class AdvancePointScreen extends StatelessWidget {
  const AdvancePointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: const CustomAppBarWidget(),
      drawer: const NavigationDrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                //_buildTopActionButtons(context),
                const SizedBox(height: 10),
                _buildPointsCard(),
                const SizedBox(height: 16),
                _buildMenuItems(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPointsCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Money bag icon
            Image.asset(
              'assets/icons/wallet.png',
              width: 60,
              height: 60,
              color: Colors.amber,
              errorBuilder: (context, error, stackTrace) {
                return _buildMoneyBagIcon();
              },
            ),
            const SizedBox(height: 10),
            //Points text
            const Text(
              'অ্যাডভান্স পয়েন্টস',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            //const SizedBox(height: 5),
            // Points amount
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '৳',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF21A427),
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  '100.55',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF21A427),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoneyBagIcon() {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF800080), // Deep purple color
      ),
      child: const Center(
        child: Icon(
          Icons.account_balance_wallet,
          color: Colors.white,
          size: 45,
        ),
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    // Define menu items with their respective icons and actions
    final List<MenuItemData> menuItems = [
      MenuItemData(
        assetIcon: 'assets/icons/advance_point_add.png',
        iconColor: const Color(0xFFEFB302),
        title: 'অ্যাডভান্স পয়েন্ট ক্রয় করুন',
        onTap: () {
          // Navigate to withdrawal history
        },
      ),
      MenuItemData(
        assetIcon: 'assets/icons/history.png',
        iconColor: const Color(0xFFEFB302),
        title: 'অ্যাডভান্স পয়েন্ট ক্রয়ের হিস্ট্রি',
        onTap: () {
          // Navigate to transfer points
        },
      ),
      MenuItemData(
        assetIcon: 'assets/icons/transper.png',
        iconColor: const Color(0xFFEFB302),
        title: 'অ্যাডভান্স পয়েন্ট উত্তোলন করুন',
        onTap: () {
          // Navigate to withdraw points
        },
      ),
      MenuItemData(
        assetIcon: 'assets/icons/history.png',
        iconColor: const Color(0xFFEFB302),
        title: 'অ্যাডভান্স পয়েন্ট উত্তোলনের হিস্ট্রি',
        onTap: () {
          // Navigate to earnings history
        },
      ),
      MenuItemData(
        assetIcon: 'assets/icons/history.png',
        iconColor: const Color(0xFFEFB302),
        title: 'অ্যাডভান্স পয়েন্ট ট্রাঞ্জাকশন হিস্ট্রি',
        onTap: () {
          // Navigate to earnings history
        },
      ),
    ];

    return Column(
      children: menuItems.map((item) => _buildMenuItem(item)).toList(),
    );
  }

  Widget _buildMenuItem(MenuItemData item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 12,
          ),
          leading: Container(
            padding: const EdgeInsets.all(3),
            width: 40,
            height: 40,
            child: Image.asset(
              item.assetIcon,
              width: 35,
              height: 35,
              color: item.iconColor,
              errorBuilder: (context, error, stackTrace) {
                // Determine which fallback icon to use based on the menu item title
                IconData fallbackIcon = Icons.history;

                if (item.title.contains('ক্রয় করুন')) {
                  fallbackIcon = Icons.add_task_rounded;
                } else if (item.title.contains('উত্তোলন করুন')) {
                  fallbackIcon = Icons.sync_alt;
                } else if (item.title.contains('হিস্ট্রি')) {
                  fallbackIcon = Icons.history;
                }

                return Icon(fallbackIcon, color: item.iconColor, size: 35);
              },
            ),
          ),
          title: Text(
            item.title,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF997300), // Arrow color
            size: 20,
          ),
          onTap: item.onTap,
        ),
      ),
    );
  }
}

class MenuItemData {
  final String assetIcon;
  final Color iconColor;
  final String title;
  final VoidCallback onTap;

  MenuItemData({
    required this.assetIcon,
    required this.iconColor,
    required this.title,
    required this.onTap,
  });
}
