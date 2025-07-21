import 'package:advance_it_ltd/screens/e-commerce/ecom_screen/product_list_screen.dart';
import 'package:advance_it_ltd/screens/see_more_projects/see_more_projects_screen.dart';
import 'package:advance_it_ltd/widgets/banner_slider.dart';
import 'package:advance_it_ltd/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/custom_app_bar_widget.dart';
import '../widgets/navigation_drawer_widget.dart';
import '../widgets/bottom_navigation_bar_widget.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const CustomAppBarWidget(),
      drawer: const NavigationDrawerWidget(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  /// Builds the main content of the home screen.
  Widget _buildBody() {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          //_buildTopActionButtons(),
          const SizedBox(height: 5),
          _buildPromoBanner(),
          _buildSocialAndActionIcons(),
          _buildServiceTabs(),
          //const SizedBox(height: 10),
          _buildSliderBanner(),
          const SizedBox(height: 10),
          const BannerSlider(),
          const SizedBox(height: 10),
          const ProductListScreen(),
        ],
      ),
    );
  }

  /// Builds the two main action buttons: "সেবা নিন" and "আয় করুন".

  /// Builds the promotional banner section.
  Widget _buildPromoBanner() {
    return Container(
      height: 200,
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Image.asset(
        'assets/images/app_banner.jpg',
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 150,
            color: AppConstants.primaryColor,
            alignment: Alignment.center,
            child: const Text(
              'Banner Image',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
        },
      ),
    );
  }

  /// Builds the promotional banner section.
  Widget _buildSliderBanner() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //width: 250,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.yellow.shade600,

                  Colors.amber.shade500,
                  Colors.orange.shade400,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              //borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.emoji_events, color: Colors.black, size: 24),
                const SizedBox(width: 10),
                Text(
                  "লিডারশীপ অ্যাচিভার",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          const CustomSlider(),
        ],
      ),
    );
  }

  /// Builds the horizontal list of social media and other action icons.
  Widget _buildSocialAndActionIcons() {
    // Data model for the icons
    final List<Map<String, dynamic>> socialIcons = [
      {
        'icon': Icons.facebook,
        'label': 'ফেইসবুক',
        'color': Colors.blue.shade800,
        'isAsset': false,
      },
      {
        'icon': Icons.group,
        'label': 'গ্রুপ',
        'color': Colors.blue.shade800,
        'isAsset': false,
      },
      {
        'icon': "assets/icons/whatsapp.png",
        'label': 'হোয়াটসঅ্যাপ',
        'color': Colors.green,
        'isAsset': true,
      },
      {
        'icon': Icons.telegram,
        'label': 'টেলিগ্রাম',
        'color': Colors.blue.shade800,
        'isAsset': false,
      },
      {
        'icon': "assets/icons/youtube.png",
        'label': 'ইউটিউব',
        'color': Colors.red,
        'isAsset': true,
      },
    ];

    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate the optimal item width based on available space
          final double availableWidth = constraints.maxWidth;
          final int itemCount = socialIcons.length;
          final double itemWidth = availableWidth / itemCount;

          // Adjust icon size based on available width
          final double iconRadius = itemWidth < 70 ? 18 : 22;
          final double iconSize = itemWidth < 70 ? 20 : 24;
          final double fontSize = itemWidth < 70 ? 10 : 12;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: socialIcons.map((item) {
              return Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: item['color'], width: 1.5),
                      ),
                      child: CircleAvatar(
                        radius: iconRadius,
                        backgroundColor: item['color'].withOpacity(0.15),
                        child: item['isAsset']
                            ? Image.asset(
                                item['icon'],
                                width: iconSize,
                                height: iconSize,
                                fit: BoxFit.contain,
                              )
                            : Icon(
                                item['icon'],
                                color: item['color'],
                                size: iconSize,
                              ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['label'],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: fontSize),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  /// Builds the tabbed section for various services.
  Widget _buildServiceTabs() {
    return Container(
      color: AppConstants.primaryColor,
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "আপনার জন্য নির্বাচিত প্রোজেক্ট সমূহ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                //fontFamily: 'SolaimanLipi',
                color: Colors.black,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            // Remove fixed height to allow dynamic sizing
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            margin: const EdgeInsets.only(top: 0),
            child: _buildServiceGrid(),
          ),
        ],
      ),
    );
  }

  /// Builds the grid of service icons.
  Widget _buildServiceGrid() {
    // Data model for grid items based on the screenshot
    final List<Map<String, dynamic>> serviceItems = [
      {
        'icon': 'assets/icons/1.png',
        'label': 'স্মার্ট আর্নিং',
        'color': Colors.black,
        'route': '/smart-earning',
      },
      {
        'icon': 'assets/icons/3.png',
        'label': 'ড্রাইভ প্যাক',
        'color': Colors.black,
        'route': '/drive-pack',
      },
      {
        'icon': 'assets/icons/4.png',
        'label': 'রিসেলার শপ',
        'color': Colors.black,
        'route': '/reseller-shop',
      },
      {
        'icon': 'assets/icons/uddokta.png',
        'label': 'অ্যাডভান্স উদ্যোক্তা',
        'color': Colors.black,
        'route': '/uddokta',
      },
      {
        'icon': 'assets/icons/2.png',
        'label': 'মোবাইল রিচার্জ',
        'color': Colors.black,
        'route': '/mobile-recharge',
      },
      {
        'icon': 'assets/icons/32.png',
        'label': 'ডিজি সাব',
        'color': Colors.black,
        'route': '/digi-sub',
      },

      {
        'icon': 'assets/icons/35.png',
        'label': 'লাইভ চ্যানেল',
        'color': Colors.black,
        'route': '/live-channel',
      },
      {
        'icon': 'assets/icons/36.png',
        'label': 'নিউজ হাব',
        'color': Colors.black,
        'route': '/news-hub',
      },
      {
        'icon': 'assets/icons/37.png',
        'label': 'আরো দেখুন',
        'color': Colors.black,
        'route': '/see-more-projects',
      },
    ];

    // Empty list as we're using all items in the main list
    final List<Map<String, dynamic>> moreServiceItems = [];

    final allItems = [...serviceItems, ...moreServiceItems];

    // Return a container with white background to separate from tabs
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
      // Use LayoutBuilder to make the grid responsive
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate number of columns based on available width
          int crossAxisCount = 4; // Default for large screens

          // Width thresholds for different screen sizes
          if (constraints.maxWidth < 300) {
            crossAxisCount = 2; // Very small screens - 2 items per row
          } else if (constraints.maxWidth < 400) {
            crossAxisCount = 3; // Medium small screens - 3 items per row
          }
          // else keep 4 columns for larger screens

          return GridView.builder(
            physics:
                const NeverScrollableScrollPhysics(), // Disable scrolling on the grid
            shrinkWrap: true, // Allow grid to take only needed space
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
            ),
            itemCount: allItems.length,
            itemBuilder: (context, index) {
              final item = allItems[index];
              return InkWell(
                onTap: () {
                  // Use custom transition for "See More Projects" screen
                  if (item['route'] == '/see-more-projects') {
                    Navigator.of(context).push(
                      SlideRightToLeftTransition(
                        page: const SeeMoreProjectsScreen(),
                        parentContext: context,
                      ),
                    );
                  } else {
                    Navigator.pushNamed(context, item['route']);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 0.0,
                  ), // Removed bottom padding
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppConstants.primaryColor,
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 24,
                          // backgroundColor: AppConstants.primaryColor,
                          child: Image.asset(
                            item['icon'],
                            fit: BoxFit.cover,
                            //color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4), // Reduced from 6 to 4
                      Flexible(
                        child: Text(
                          item['label'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  /// Builds the Bottom Navigation Bar.
  Widget _buildBottomNavBar() {
    return CustomBottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {
        _handleBottomNavigation(index);
      },
    );
  }

  /// Handles bottom navigation bar taps
  void _handleBottomNavigation(int index) {
    switch (index) {
      case 0:
        // Home - Already on home screen, show feedback
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('আপনি ইতিমধ্যে হোম পেজে আছেন'),
            backgroundColor: Colors.orange.shade600,
            duration: const Duration(seconds: 1),
          ),
        );
        break;
      case 1:
        // Navigate to Uddokta screen
        Navigator.pushNamed(context, '/uddokta');
        break;
      case 2:
        // Profile - Add profile navigation when ready
        Navigator.pushNamed(context, '/profile');
        break;
      case 3:
        // Support - Navigate to support screen
        Navigator.pushNamed(context, '/support');
        break;
      default:
        break;
    }
  }
}
