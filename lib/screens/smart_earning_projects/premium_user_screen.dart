import 'package:advance_it_ltd/core/theme/app_theme.dart';
import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PremiumUserScreen extends StatelessWidget {
  const PremiumUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBarWidget(),
      drawer: const NavigationDrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 5),
            Container(
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(
                "assets/images/s_banner3.svg",
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            _SmartEarningCard(),
            const SizedBox(height: 24),
            _SmartSubscriptionCard(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceGrid() {
    // Data model for grid items based on the screenshot
    final List<Map<String, dynamic>> serviceItems = [
      {
        'icon': 'assets/icon/1.png',
        'label': 'স্মার্ট আর্নিং',
        'color': Colors.black,
        'route': '/premium_user',
      },
      {
        'icon': 'assets/icon/2.png',
        'label': 'ড্রাইভ প্যাক',
        'color': Colors.black,
        'route': '/drive-pack',
      },
      {
        'icon': 'assets/icon/3.png',
        'label': 'রিসেলার শপ',
        'color': Colors.black,
        'route': '/reseller-shop',
      },
      {
        'icon': 'assets/icon/4.png',
        'label': 'অ্যাডভান্স উদ্যোক্তা',
        'color': Colors.black,
        'route': '/uddokta',
      },
      {
        'icon': 'assets/icon/5.png',
        'label': 'মোবাইল রিচার্জ',
        'color': Colors.black,
        'route': '/mobile-recharge',
      },
      {
        'icon': 'assets/icon/6.png',
        'label': 'ফ্রাইডে মার্ট',
        'color': Colors.black,
        'route': '/friday-mart',
      },

      {
        'icon': 'assets/icon/7.png',
        'label': 'লাইভ মিডিয়া',
        'color': Colors.black,
        'route': '/live-channel',
      },
      {
        'icon': 'assets/icon/8.png',
        'label': 'নিউজ হাব',
        'color': Colors.black,
        'route': '/news-hub',
      },
      {
        'icon': 'assets/icon/9.png',
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

                  Navigator.pushNamed(context, item['route']);
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
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: CircleAvatar(
                          radius: 28,
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
}

class _SmartEarningCard extends StatelessWidget {
  const _SmartEarningCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.smartEarningCourseGradientStart.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.smartEarningCourseGradientStart,
                    AppTheme.smartEarningCourseGradientEnd,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Column(
                children: [
                  Text(
                    'স্মার্ট আর্নিং কোর্স',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  ..._smartEarningBenefits
                      .map(
                        (benefit) => _BenefitItem(
                          text: benefit,
                          color: AppTheme.smartEarningCourseGradientStart,
                        ),
                      )
                      .toList(),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _GradientButton(
                          text: 'কোর্স লিডারশিপ',
                          fontSize: 14,
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: MediaQuery.of(context).size.width < 400
                                ? 8
                                : 16,
                          ),
                          gradient: LinearGradient(
                            colors: [
                              AppTheme.smartEarningCourseGradientStart,
                              AppTheme.smartEarningCourseGradientEnd,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _GradientButton(
                          text: 'কোর্সে প্রবেশ করুন',
                          fontSize: 14,
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: MediaQuery.of(context).size.width < 400
                                ? 8
                                : 16,
                          ),
                          gradient: LinearGradient(
                            colors: [
                              AppTheme.smartEarningCourseGradientStart,
                              AppTheme.smartEarningCourseGradientEnd,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SmartSubscriptionCard extends StatelessWidget {
  const _SmartSubscriptionCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.smartSubscriptionGradientStart.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.smartSubscriptionGradientStart,
                    AppTheme.smartSubscriptionGradientEnd,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Column(
                children: [
                  Text(
                    'স্মার্ট সাবস্ক্রিপশন',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  ..._smartSubscriptionBenefits
                      .map(
                        (benefit) => _BenefitItem(
                          text: benefit,
                          color: AppTheme.smartSubscriptionButtonGradientEnd,
                        ),
                      )
                      .toList(),
                  const SizedBox(height: 24),
                  _GradientButton(
                    text: 'প্রবেশ করুন',
                    gradient: const LinearGradient(
                      colors: [
                        AppTheme.smartSubscriptionButtonGradientStart,
                        AppTheme.smartSubscriptionButtonGradientEnd,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BenefitItem extends StatelessWidget {
  const _BenefitItem({required this.text, this.color = Colors.white});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: TextStyle(color: color, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}

class _GradientButton extends StatelessWidget {
  const _GradientButton({
    required this.text,
    required this.gradient,
    required this.onPressed,
    this.fontSize = 16,
    this.padding,
  });

  final String text;
  final Gradient gradient;
  final VoidCallback onPressed;
  final double fontSize;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Container(
          padding:
              padding ??
              EdgeInsets.symmetric(
                vertical: 12,
                horizontal: MediaQuery.of(context).size.width < 400 ? 16 : 24,
              ),
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const List<String> _smartEarningBenefits = [
  '৩০০ টাকার স্মার্ট সাবস্ক্রিপশন',
  '১০ টি স্কিল ডেভেলপমেন্ট কোর্স',
  '৩০+ লাইভ ট্রেনিং',
  '৩০+ রেকর্ড ভিডিও',
  '১০ দিন ওয়েলকাম বোনাস',
  'সকল আর্নিং প্রজেক্ট থেকে ইনকামের সুযোগ',
  'মাসিক ২ লক্ষ + লিডারশিপ সেলারি',
  'প্রয়োজনীয় চাওয়া পূরণের লিডারশিপ রিওয়ার্ড',
  'প্রতিটি লিডারশীপে ইনস্ট্যান্ট ইনকাম',
  'লিডারশিপ ই-বুক',
];

const List<String> _smartSubscriptionBenefits = [
  'একটি অ্যাডভান্স একাউন্ট',
  'আনলিমিটেড রিসেলিং এর সুযোগ',
  'স্মার্ট প্রমোটার এচিভের সুযোগ',
  '১০ জেনারেশন পর্যন্ত এফিলিয়েট বোনাস',
  'প্রতি এচিভমেন্টে ৫০ দিন স্মার্ট প্রমোটার বোনাস',
  '২২ টি প্রজেক্ট থেকে একটিভ ইনকামের সুযোগ',
  '২০ টি প্রজেক্ট থেকে প্যাসিভ ইনকামের সুযোগ',
  'স্মার্ট আর্নিং কোর্স নিয়ে নেতৃত্ব গড়ে তোলা ও স্বপ্ন ছুঁয়ে দেখার বাস্তব সুযোগ',
];
