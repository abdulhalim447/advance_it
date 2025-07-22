import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/navigation_drawer_widget.dart';

class UddoktaScreen extends StatelessWidget {
  const UddoktaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const CustomAppBarWidget(),
      drawer: const NavigationDrawerWidget(),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildHeader(),
            const SizedBox(height: 15),
            _buildUddoktaGrid(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// Builds the header section
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      // margin: const EdgeInsets.symmetric(horizontal: 16),
      //padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xE63969E7), Color(0xFF7D2AE7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(
        'assets/images/uddonta_banners.jpg',
        width: double.infinity,
      ),
    );
  }

  /// Builds the uddokta grid with all partnership options
  Widget _buildUddoktaGrid(BuildContext context) {
    final List<UddoktaOption> uddoktaOptions = [
      UddoktaOption(
        assetIcon: 'assets/icons/u4.png',
        title: 'ই-কমার্স ভেন্ডর',
        description: 'পণ্য বিক্রয় করুন',
        subtitle: 'বাংলাদেশের প্রতিটি থানা পর্যায়ে একটি',
        route: '/ecommerce-vendor',
        gradientColors: [Colors.blue.shade400, Colors.blue.shade600],
      ),
      UddoktaOption(
        assetIcon: 'assets/icons/u3.png',
        title: 'ড্রাইভ এজেন্ট',
        description: 'অফার বিক্রয় করুন',
        subtitle: 'বাংলাদেশের প্রতিটি ইউনিয়ন / ওয়ার্ড',
        route: '/drive-agent',
        gradientColors: [Colors.green.shade400, Colors.green.shade600],
      ),
      UddoktaOption(
        assetIcon: 'assets/icons/u27.png',
        title: 'ডিজিসাব ভেন্ডর',
        description: 'ডিজিটাল প্রোডাক্ট বিক্রয় করুন',
        subtitle: 'বাংলাদেশের প্রতিটি ইউনিয়ন / ওয়ার্ড',
        route: '/digisub-vendor',
        gradientColors: [Colors.purple.shade400, Colors.purple.shade600],
      ),
      UddoktaOption(
        assetIcon: 'assets/icons/u7.png',
        title: 'ট্যুরিস্ট এজেন্ট',
        description: 'ট্যুর প্যাকেজ বিক্রয় করুন',
        subtitle: 'নিজের পণ্য বিক্রয় করুন',
        route: '/tourist-agent',
        gradientColors: [Colors.teal.shade400, Colors.teal.shade600],
      ),
      UddoktaOption(
        assetIcon: 'assets/icons/u20.png',
        title: 'ফ্লাই পার্টনার',
        description: 'ফ্লাইট টিকিট বিক্রয় করুন',
        subtitle: 'বিমান টিকিট বুকিং সেবা',
        route: '/flight-partner',
        gradientColors: [Colors.indigo.shade400, Colors.indigo.shade600],
      ),
      UddoktaOption(
        assetIcon: 'assets/icons/u8.png',
        title: 'হজ্জ ওমরাহ এজেন্সি',
        description: 'পবিত্র সফরের সেবা দিন',
        subtitle: 'ধর্মীয় ভ্রমণ সেবা প্রদান',
        route: '/hajj-umrah-agency',
        gradientColors: [Colors.green.shade800, Colors.green.shade800],
      ),
      UddoktaOption(
        assetIcon: 'assets/icons/u6.png',
        title: 'হেলি এজেন্সি',
        description: 'হেলিকাপ্টার সার্ভিস দিন',
        subtitle: 'আকাশ পথে ভ্রমণ সেবা',
        route: '/heli-agency',
        gradientColors: [Colors.red.shade400, Colors.red.shade600],
      ),
      UddoktaOption(
        assetIcon: 'assets/icons/u13.png',
        title: 'ইন্টেরিয়র পার্টনার',
        description: 'ইন্টেরিয়র সেবা দিন',
        subtitle: 'ঘর সাজানোর সেবা প্রদান',
        route: '/interior-partner',
        gradientColors: [Colors.amber, Colors.amber],
      ),
      UddoktaOption(
        assetIcon: 'assets/icons/u14.png',
        title: 'ইভেন্ট পার্টনার',
        description: 'ইভেন্ট আয়োজন সেবা দিন',
        subtitle: 'অনুষ্ঠান আয়োজন সেবা',
        route: '/event-partner',
        gradientColors: [Colors.pink.shade400, Colors.pink.shade600],
      ),
      UddoktaOption(
        assetIcon: 'assets/icons/u9.png',
        title: 'হোটেল এজেন্ট',
        description: 'আপনার হোটেল যুক্ত করুন',
        subtitle: 'হোটেল বুকিং সেবা প্রদান',
        route: '/hotel-agent',
        gradientColors: [Colors.cyan.shade400, Colors.cyan.shade600],
      ),
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.85, // Adjust card height
        ),
        itemCount: uddoktaOptions.length,
        itemBuilder: (context, index) {
          return _buildUddoktaCard(uddoktaOptions[index], context);
        },
      ),
    );
  }

  /// Builds individual uddokta card
  Widget _buildUddoktaCard(UddoktaOption option, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: option.gradientColors.first.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon with gradient background
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: option.gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: option.gradientColors.first.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(option.assetIcon!, width: 40, height: 40),
              ),
            ),

            const SizedBox(height: 6),

            // Title
            Text(
              option.title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 3),

            // Description
            Text(
              option.description,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 4),

            // Subtitle
            // Text(
            //   option.subtitle,
            //   style: TextStyle(fontSize: 10, color: Colors.grey[500]),
            //   textAlign: TextAlign.center,
            //   maxLines: 2,
            //   overflow: TextOverflow.ellipsis,
            // ),
            const Spacer(),

            // Visit button
            SizedBox(
              width: double.infinity,
              height: 35,
              child: ElevatedButton(
                onPressed: () {
                  // Handle navigation
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${option.title} সেবা শীঘ্রই আসছে...'),
                      backgroundColor: option.gradientColors.first,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: option.gradientColors.first,
                  foregroundColor: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: const Text(
                  'প্রবেশ করুন',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Data model for uddokta options
class UddoktaOption {
  final String? assetIcon;
  final String title;
  final String description;
  final String subtitle;
  final String route;
  final List<Color> gradientColors;

  UddoktaOption({
    this.assetIcon,
    required this.title,
    required this.description,
    required this.subtitle,
    required this.route,
    required this.gradientColors,
  });
}
