import 'package:flutter/material.dart';

/// Data model for drawer menu items
class DrawerMenuItem {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final bool hasArrow;
  final List<DrawerSubMenuItem>? subItems;

  DrawerMenuItem({
    required this.icon,
    required this.title,
    this.onTap,
    this.hasArrow = false,
    this.subItems,
  });
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
    return Container(
      height: 300,
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
              const SizedBox(height: 25),
              _buildSimpleProfile(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the simple header top section
  /* Widget _buildHeaderTop(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 28,
          errorBuilder: (context, error, stackTrace) {
            return const Text(
              'ADVANCE',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            );
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.close_rounded,
            color: Colors.black87,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
*/
  /// Builds the simple profile section
  Widget _buildSimpleProfile(BuildContext context) {
    return Column(
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
              radius: 50,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/abdul.png',
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),
        const Text(
          'JALAL NUR',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 5),
        //_buildSimplePhoneNumber(),
        // const SizedBox(height: 2),
        // Gold Member badge
        const Text(
          'Advance Leader',
          style: TextStyle(
            fontSize: 16,
            //fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Advance Affiliate ID: 123612',
          style: TextStyle(
            fontSize: 16,
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
        icon: Icons.dashboard,
        title: 'ড্যাশবোর্ড',
        onTap: () => _navigateToPage(context, '/dashboard'),
      ),
      DrawerMenuItem(
        icon: Icons.monetization_on,
        title: 'ইনকাম পয়েন্ট',
        onTap: () => _navigateToPage(context, '/income-point'),
      ),
      DrawerMenuItem(
        icon: Icons.star,
        title: 'অ্যাডভান্স পয়েন্টস',
        onTap: () => _navigateToPage(context, '/advance-point'),
      ),
      DrawerMenuItem(
        icon: Icons.payment,
        title: 'পেমেন্ট মেথড',
        onTap: () => _navigateToPage(context, '/add-payment-method'),
      ),
      DrawerMenuItem(
        icon: Icons.summarize,
        title: 'ইনকাম  সামারি',
        onTap: () => _navigateToPage(context, '/drive-order-history'),
      ),
      DrawerMenuItem(
        icon: Icons.gavel,
        title: 'শপথনামা  ',
        onTap: () => _navigateToPage(context, '/product-order-history'),
      ),
      DrawerMenuItem(
        icon: Icons.info,
        title: 'আমাদের সম্পর্কে',
        onTap: () => _navigateToPage(context, '/about'),
      ),
      DrawerMenuItem(
        icon: Icons.policy,
        title: 'নীতিমালা',
        onTap: () => _navigateToPage(context, '/policy'),
      ),
      DrawerMenuItem(
        icon: Icons.privacy_tip,
        title: 'গোপনীয়তা নীতি',
        onTap: () => _navigateToPage(context, '/activity'),
      ),
      DrawerMenuItem(
        icon: Icons.contact_phone,
        title: 'যোগাযোগ ',
        onTap: () => _navigateToPage(context, '/reseller-vendor'),
      ),
      DrawerMenuItem(
        icon: Icons.settings,
        title: 'সেটিং',
        onTap: () => _navigateToPage(context, '/settings'),
      ),
      DrawerMenuItem(
        icon: Icons.logout,
        title: 'লগ আউট',
        onTap: () => _handleLogout(context),
      ),
    ];

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: menuItems.length,
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
            leading: Icon(item.icon, color: Colors.black87, size: 24),
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
                size: 20,
                color: Colors.black87,
              ),
            ),
            onTap: () => _toggleExpansion(index),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 4,
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
                        vertical: 4,
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
        leading: Icon(
          item.icon,
          color: Colors.black.withOpacity(0.7),
          size: 24,
        ),
        title: Text(
          item.title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: item.onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
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
    // Navigate to the specified route
    // Navigator.pushNamed(context, route);

    // For now, just show a snackbar
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Navigating to $route')));
  }

  /// Handles logout functionality
  void _handleLogout(BuildContext context) {
    Navigator.pop(context); // Close the drawer

    // Show logout confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('লগ আউট'),
          content: const Text('আপনি কি নিশ্চিত যে আপনি লগ আউট করতে চান?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('বাতিল'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Handle actual logout logic here
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('লগ আউট হয়েছে')));
              },
              child: const Text('লগ আউট'),
            ),
          ],
        );
      },
    );
  }
}
