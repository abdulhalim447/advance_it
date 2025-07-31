import 'package:advance_it_ltd/core/theme/app_theme.dart';
import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NormalCustomerScreen extends StatelessWidget {
  const NormalCustomerScreen({super.key});

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
                  Text(
                    'মাত্র ১৯৫০ টাকা',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    '১৯৫০ টাকার স্মার্ট আর্নিং কোর্স নিলেই পাচ্ছেন',
                    style: TextStyle(
                      color: AppTheme.smartEarningCourseGradientStart,
                      fontSize: 16,
                    ),
                  ),
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
                  _GradientButton(
                    text: 'এগিয়ে চলুন',
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.smartEarningCourseGradientStart,
                        AppTheme.smartEarningCourseGradientEnd,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/course-overview');
                    },
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
                  Text(
                    'মাত্র ৩৫০ টাকায়',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    '৩৫০ টাকার স্মার্ট সাবস্ক্রিপশন করলেই পাচ্ছেন',
                    style: TextStyle(
                      color: AppTheme.smartSubscriptionButtonGradientEnd,
                      fontSize: 16,
                    ),
                  ),
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
                    text: 'এখনই শুরু করুন',
                    gradient: const LinearGradient(
                      colors: [
                        AppTheme.smartSubscriptionButtonGradientStart,
                        AppTheme.smartSubscriptionButtonGradientEnd,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/smart-subscription');
                    },
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
          Image.asset(
            'assets/icon/ceckbox.png',
            color: color,
            height: 26,
            width: 26,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: TextStyle(color: color, fontSize: 17)),
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
  });

  final String text;
  final Gradient gradient;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.3),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 60),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
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
  '৬০+ রেকর্ড ভিডিও',
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
  'স্মার্ট আর্নিং কোর্স নিয়ে নেতৃত্ব গড়ে তোলা ও স্বপ্ন ছুঁয়ে দেখার বাস্তব সুযোগ',
];
