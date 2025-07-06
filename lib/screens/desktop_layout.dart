import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: null, // No bottom nav on desktop
    );
  }

  /// Builds the AppBar for the desktop screen.
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppConstants.primaryColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black, size: 30),
        onPressed: () {
          // Handle menu button press
        },
      ),
      title: Image.asset(
        'assets/images/logo.png',
        height: 40,
        errorBuilder: (context, error, stackTrace) {
          return const Text(
            'AIT',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          );
        },
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications_none,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            // Handle notification button press
          },
        ),
      ],
    );
  }

  /// Builds the main content of the desktop screen.
  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildPromoBanner(),
          _buildSocialAndActionIcons(),
          _buildTabButtons(),
          _buildServiceGrid(),
        ],
      ),
    );
  }

  /// Builds the promotional banner section based on screenshot.
  Widget _buildPromoBanner() {
    return Container(
      width: double.infinity,
      color: AppConstants.primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/banner.png',
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 150,
                color: AppConstants.primaryColor,
                alignment: Alignment.center,
              );
            },
          ),
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'মাত্র',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'আর্নিং কোর্স',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildBannerItem('Ai টুলসের ব্যবহার'),
                      _buildBannerItem('বেসিক ইউটিউভিং'),
                      _buildBannerItem('লিডারশিপ ক্যারিয়ার'),
                      _buildBannerItem('ডিজিটাল মার্কেটিং'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          const Icon(Icons.play_arrow, color: Colors.black),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the horizontal list of social media icons based on screenshot.
  Widget _buildSocialAndActionIcons() {
    // Data model for the icons
    final List<Map<String, dynamic>> socialIcons = [
      {
        'icon': Icons.facebook,
        'label': 'ফেইসবুক',
        'color': Colors.blue.shade800,
      },
      {'icon': Icons.group, 'label': 'গ্রুপ', 'color': Colors.blue.shade800},
      {
        'icon': Icons.chat_bubble,
        'label': 'ওয়াটসঅ্যাপ',
        'color': Colors.green,
      },
      {
        'icon': Icons.telegram,
        'label': 'টেলিগ্রাম',
        'color': Colors.blue.shade800,
      },
      {'icon': Icons.play_circle_fill, 'label': 'ইউটিউব', 'color': Colors.red},
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: socialIcons.map((item) {
          return Column(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey[100],
                child: Icon(item['icon'], color: item['color'], size: 30),
              ),
              const SizedBox(height: 8),
              Text(item['label'], style: const TextStyle(fontSize: 12)),
            ],
          );
        }).toList(),
      ),
    );
  }

  /// Builds tab buttons based on screenshot
  Widget _buildTabButtons() {
    return Container(
      color: AppConstants.primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabButton('বিজনেস ফান্ড', isSelected: true),
          _buildTabButton('অন ডিমান্ড'),
          _buildTabButton('বাই-সেল'),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, {bool isSelected = false}) {
    return TextButton(
      onPressed: () {},
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 14,
        ),
      ),
    );
  }

  /// Builds the grid of service icons based on screenshot.
  Widget _buildServiceGrid() {
    // Service items from the screenshot
    final List<Map<String, dynamic>> serviceItems = [
      {'icon': Icons.home, 'label': 'আর্ন করুন', 'color': Colors.black},
      {
        'icon': Icons.business,
        'label': 'ড্রাফ্ট ব্যাংক',
        'color': Colors.black,
      },
      {
        'icon': Icons.shopping_cart,
        'label': 'রিসেলার শপ',
        'color': Colors.black,
      },
      {
        'icon': Icons.phone_android,
        'label': 'মোবাইল রিচার্জ',
        'color': Colors.black,
      },
      {'icon': Icons.school, 'label': 'এডভাস একাডেমি', 'color': Colors.black},
      {
        'icon': Icons.verified_user,
        'label': 'মনিটাইজড সলিউশন',
        'color': Colors.black,
      },
    ];

    // Second row items
    final List<Map<String, dynamic>> secondRowItems = [
      {'icon': Icons.flight, 'label': 'ফ্লাইট টিকেট', 'color': Colors.black},
      {'icon': Icons.flag, 'label': 'টুরিস্ট গাইড', 'color': Colors.black},
      {'icon': Icons.home, 'label': 'হোটেল বুকিং', 'color': Colors.black},
      {'icon': Icons.store, 'label': 'মার্কেটপ্লেস', 'color': Colors.black},
      {'icon': Icons.computer, 'label': 'এড ওয়ার্ক', 'color': Colors.black},
      {'icon': Icons.work, 'label': 'জব সলিউশন', 'color': Colors.black},
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // First row
          _buildServiceRow(serviceItems),
          const SizedBox(height: 30),
          // Second row
          _buildServiceRow(secondRowItems),
        ],
      ),
    );
  }

  Widget _buildServiceRow(List<Map<String, dynamic>> items) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items.map((item) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppConstants.primaryColor, width: 2),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: AppConstants.primaryColor,
                child: Icon(item['icon'], color: Colors.black, size: 30),
              ),
            ),
            const SizedBox(height: 8),
            Text(item['label'], style: const TextStyle(fontSize: 12)),
          ],
        );
      }).toList(),
    );
  }
}
