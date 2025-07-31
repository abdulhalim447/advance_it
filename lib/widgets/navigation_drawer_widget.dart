import 'package:flutter/material.dart';

/// Data model for drawer menu items
class DrawerMenuItem {
  final IconData? icon;
  final String? assetImage;
  final String title;
  final VoidCallback? onTap;
  final bool hasArrow;
  final List<DrawerSubMenuItem>? subItems;
  final Color? iconColor;
  final double? iconSize;
  final double? imageSize;

  DrawerMenuItem({
    this.icon,
    this.assetImage,
    required this.title,
    this.onTap,
    this.hasArrow = false,
    this.subItems,
    this.iconColor,
    this.iconSize = 28,
    this.imageSize = 24,
  }) : assert(
         icon != null || assetImage != null,
         'Either icon or assetImage must be provided',
       );
}

/// Data model for drawer sub-menu items
class DrawerSubMenuItem {
  final String title;
  final VoidCallback onTap;

  DrawerSubMenuItem({required this.title, required this.onTap});
}

/// Custom Navigation Drawer Widget
class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({super.key});

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final Set<int> _expandedItems = <int>{};
  bool _showFullPhoneNumber = false;

  // Full and masked phone numbers
  final String _maskedPhoneNumber = '014*****084';
  final String _fullPhoneNumber = '01412345084';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildDrawerHeader(context),
          Expanded(child: _buildDrawerMenuItems(context)),
        ],
      ),
    );
  }

  /// Builds the drawer header with enhanced UI/UX
  Widget _buildDrawerHeader(BuildContext context) {
    // Get screen height and calculate responsive header height
    final screenHeight = MediaQuery.of(context).size.height;
    final headerHeight = (screenHeight * 0.37);

    return Container(
      height: headerHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.amber.shade500, Colors.yellow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            children: [
              // _buildHeaderTop(context),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              Expanded(child: _buildSimpleProfile(context)),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the simple profile section
  Widget _buildSimpleProfile(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive sizes
    final avatarRadius = (screenHeight * 0.06).clamp(40.0, 55.0);
    final titleFontSize = (screenWidth * 0.05).clamp(18.0, 22.0);
    final subtitleFontSize = (screenWidth * 0.04).clamp(14.0, 18.0);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.red, Colors.amber],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundColor: Colors.black,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: avatarRadius * 1.6,
                  height: avatarRadius * 1.6,
                  color: Color(0xFFFED700),
                  //fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: screenHeight * 0.012),
        Text(
          'ADVANCE IT',
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: screenHeight * 0.008),
        //_buildSimplePhoneNumber(),
        // const SizedBox(height: 2),
        // Gold Member badge
        Text(
          'Advance Leader',
          style: TextStyle(
            fontSize: subtitleFontSize,
            //fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: screenHeight * 0.005),
        Text(
          'Advance Affiliate ID: 123612',
          style: TextStyle(
            fontSize: subtitleFontSize,
            color: Colors.black,
            //fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  /// Builds simple phone number with toggle
  Widget _buildSimplePhoneNumber() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _showFullPhoneNumber ? _fullPhoneNumber : _maskedPhoneNumber,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
            //fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        Transform.scale(
          scale: 0.7, // Reduce the size of the switch
          child: SizedBox(
            width: 40,
            height: 20,
            child: Switch(
              value: _showFullPhoneNumber,
              onChanged: (value) {
                setState(() {
                  _showFullPhoneNumber = value;
                });
              },
              activeColor: Colors.amber.shade400,
              activeTrackColor: Colors.amber.shade200,
              inactiveThumbColor: Colors.grey.shade400,
              inactiveTrackColor: Colors.grey.shade300,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
      ],
    );
  }

  //drawer header is end here=--------------------------------------------------

  /// Builds the drawer menu items
  Widget _buildDrawerMenuItems(BuildContext context) {
    final List<DrawerMenuItem> menuItems = [
      DrawerMenuItem(
        assetImage: 'assets/icons/home.png',
        title: 'হোম',
        onTap: () => _navigateToPage(context, '/dashboard'),
        iconColor: Colors.amber,
        imageSize: 35, // বড় আইকন সাইজ
      ),
      DrawerMenuItem(
        assetImage: 'assets/icons/wallet.png',
        title: 'ইনকাম পয়েন্ট',
        onTap: () => _navigateToPage(context, '/income-point'),
        iconColor: Colors.green.shade900,
        imageSize: 32, // কাস্টম ইমেজ সাইজ
      ),
      DrawerMenuItem(
        assetImage: 'assets/icons/wallet.png',
        title: 'অ্যাডভান্স পয়েন্টস',
        iconColor: Colors.green.shade900,
        onTap: () => _navigateToPage(context, '/advance-point'),
        imageSize: 32,
      ),
      DrawerMenuItem(
        assetImage: 'assets/icons/wallet.png',
        title: 'পেমেন্ট মেথড',
        iconColor: Colors.green.shade900,
        onTap: () => _navigateToPage(context, '/add-payment-method'),
        imageSize: 32,
      ),
      DrawerMenuItem(
        assetImage: 'assets/icons/aboutme.png',
        title: 'আমাদের সম্পর্কে',
        onTap: () => _navigateToPage(context, '/about'),
        imageSize: 33,
        iconColor: Colors.amber,
      ),
      DrawerMenuItem(
        assetImage: 'assets/icons/jogajog.png',
        title: 'যোগাযোগ ',
        onTap: () => _navigateToPage(context, '/support'),
        iconColor: Colors.amber,
        imageSize: 39, // ছোট ইমেজ সাইজ
      ),

      DrawerMenuItem(
        assetImage: 'assets/icons/incomesummarry.png',
        title: 'ইনকাম সামারি',
        iconColor: Colors.purple.shade800,
        onTap: () => _navigateToPage(context, '/income-summary'),
        imageSize: 40,
      ),
      DrawerMenuItem(
        assetImage: 'assets/icon/income_report.png',
        title: 'ইনকাম রিপোর্ট',
        iconColor: Colors.purple.shade800,
        onTap: () => _navigateToPage(context, '/income-report'),
        imageSize: 38,
      ),
      DrawerMenuItem(
        assetImage: 'assets/icon/affiliate_channel.png',
        title: 'এফিলিয়েট চ্যানেল',
        iconColor: Colors.purple.shade800,
        onTap: () => _navigateToPage(context, '/affiliate-channel'),
        imageSize: 40,
      ),
      DrawerMenuItem(
        assetImage: 'assets/icons/policy.png',
        title: 'গোপনীয়তা নীতি',
        onTap: () => _navigateToPage(context, '/privacypolicy'),
        imageSize: 33,
        iconColor: Colors.blueAccent.shade700,
      ),

      DrawerMenuItem(
        assetImage: 'assets/icons/sofotnama.png',
        title: 'শপথনামা  ',
        iconColor: Colors.blueAccent.shade700,
        onTap: () => _navigateToPage(context, '/sofotnama'),
        imageSize: 35,
      ),
      DrawerMenuItem(
        assetImage: 'assets/icons/privacy.png',
        title: 'অ্যাডভান্স নীতিমালা',
        onTap: () => _navigateToPage(context, '/nitimala'),
        imageSize: 35,
        iconColor: Colors.blueAccent.shade700,
      ),

      DrawerMenuItem(
        icon: Icons.settings,
        title: 'সেটিং',
        onTap: () => _navigateToPage(context, '/settings'),
        imageSize: 35,
        iconColor: Colors.lime.shade900,
      ),
      DrawerMenuItem(
        icon: Icons.logout,
        title: 'লগ আউট',
        onTap: () => _handleLogout(context),
        iconColor: Colors.lime.shade900,
        iconSize: 30,
        // ডিফল্ট সাইজ
      ),
    ];

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: menuItems.length,
      separatorBuilder: (context, index) {
        return Divider(height: 1, color: Colors.yellow.withOpacity(0.3));
      },
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return _buildDrawerListTile(item, index);
      },
    );
  }

  /// Builds individual drawer list tile with expansion support
  Widget _buildDrawerListTile(DrawerMenuItem item, int index) {
    final bool isExpanded = _expandedItems.contains(index);

    if (item.hasArrow && item.subItems != null) {
      return Column(
        children: [
          ListTile(
            leading: _buildLeadingIcon(item),
            title: Text(
              item.title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: AnimatedRotation(
              turns: isExpanded ? 0.25 : 0,
              duration: const Duration(milliseconds: 200),
              child: const Icon(
                Icons.keyboard_arrow_down,
                size: 28,
                color: Colors.black87,
              ),
            ),
            onTap: () => _toggleExpansion(index),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 0,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: isExpanded ? (item.subItems!.length * 56.0) : 0,
            child: SingleChildScrollView(
              child: Column(
                children: item.subItems!.map((subItem) {
                  return Container(
                    color: Colors.grey[100],
                    child: ListTile(
                      leading: const SizedBox(width: 24), // Space for alignment
                      title: Row(
                        children: [
                          const Icon(
                            Icons.radio_button_unchecked,
                            size: 16,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            subItem.title,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      onTap: subItem.onTap,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 0,
                      ),
                      dense: true,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      );
    } else {
      return ListTile(
        leading: _buildLeadingIcon(item),
        title: Text(
          item.title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: item.onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      );
    }
  }

  /// Toggles the expansion state of a menu item
  void _toggleExpansion(int index) {
    setState(() {
      if (_expandedItems.contains(index)) {
        _expandedItems.remove(index);
      } else {
        _expandedItems.add(index);
      }
    });
  }

  /// Handles navigation to different pages
  void _navigateToPage(BuildContext context, String route) {
    Navigator.pop(context); // Close the drawer

    // Use named routes for navigation
    try {
      Navigator.pushNamed(context, route);
    } catch (e) {
      // Fallback for routes that are not registered
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Route $route not implemented yet')),
      );
    }
  }

  /// Builds the leading icon or image for a drawer menu item
  Widget _buildLeadingIcon(DrawerMenuItem item) {
    if (item.assetImage != null) {
      return Container(
        width: item.imageSize,
        height: item.imageSize,
        padding: const EdgeInsets.all(2),
        child: Image.asset(
          item.assetImage!,
          width: item.imageSize,
          height: item.imageSize,
          color: item.iconColor,
          fit: BoxFit.contain,
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(2),
        child: Icon(
          item.icon,
          color: item.iconColor ?? Colors.black.withOpacity(0.7),
          size: item.iconSize,
        ),
      );
    }
  }

  /// Handles logout functionality
  void _handleLogout(BuildContext context) {
    Navigator.pop(context); // Close the drawer

    // Show logout confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 8,
          backgroundColor: Colors.white,
          title: const Text(
            'লগ আউট',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade50,
            ),
            padding: const EdgeInsets.all(10),
            child: const Text(
              'আপনি কি নিশ্চিত যে আপনি লগ আউট করতে চান?',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
              ),
              child: const Text(
                'বাতিল',
                style: TextStyle(color: Colors.black87),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Handle actual logout logic here
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('লগ আউট হয়েছে')));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
              ),
              child: const Text(
                'লগ আউট',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
