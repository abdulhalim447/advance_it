import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/navigation_drawer_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Course Overview Screen for Smart Earning Projects
class CourseOverviewScreen extends StatelessWidget {
  const CourseOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const CustomAppBarWidget(
        showLogo: true,
        automaticallyImplyLeading: true,
      ),
      drawer: const NavigationDrawerWidget(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 80,
              ), // Add padding for the button
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  _CourseHeaderSection(),
                  SizedBox(height: 10),
                  _CourseDescriptionSection(),
                  SizedBox(height: 10),
                  _courcebuletPointSection(),
                  SizedBox(height: 10),
                  _CourseDetailsSection(),
                  SizedBox(height: 5),
                  _discountCourseHeaderSection(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: _CourseActionSection(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Course header section with title
class _CourseHeaderSection extends StatelessWidget {
  const _CourseHeaderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      child: SvgPicture.asset(
        "assets/images/smart-earning-banner.svg",

        fit: BoxFit.cover,
      ),
    );
  }
}

/// Course header section with title
class _discountCourseHeaderSection extends StatelessWidget {
  const _discountCourseHeaderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // Remove fixed height, let SVG define its own height, or use aspect ratio
      child: AspectRatio(
        aspectRatio: 4, // Adjust as needed for your banner's width:height ratio
        child: SvgPicture.asset(
          "assets/images/discount-banner.svg",
          fit: BoxFit.cover, // Use contain to avoid cropping
        ),
      ),
    );
  }
}

/// Course description section
class _CourseDescriptionSection extends StatelessWidget {
  const _CourseDescriptionSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'কোর্স সম্পর্কে বিস্তারিত',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.6,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.justify,
          ),

          Column(
            children: _desccourseBenefits
                .map(
                  (benefit) => _descBenefitItem(
                    text: benefit,
                    color: AppTheme.smartEarningCourseGradientStart,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

/// Course description section
class _courcebuletPointSection extends StatelessWidget {
  const _courcebuletPointSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'কোর্সটি করে যা যা শিখবেন',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.6,
              fontWeight: FontWeight.bold,
            ),
          ),

          Column(
            children: _courseBenefits
                .map(
                  (benefit) => _BenefitItem(
                    text: benefit,
                    color: AppTheme.smartEarningCourseGradientStart,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

/// Course details section with additional information
class _CourseDetailsSection extends StatelessWidget {
  const _CourseDetailsSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'কোর্সটি যাদের জন্য',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: _desctwocourseBenefits
                .map(
                  (benefit) => _descBenefitItem(
                    text: benefit,
                    color: AppTheme.smartEarningCourseGradientStart,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

/// Course action section with enrollment button
class _CourseActionSection extends StatelessWidget {
  const _CourseActionSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _GradientButton(
            text: 'কোর্সটি অর্ডার করুন',
            gradient: const LinearGradient(
              colors: [
                AppTheme.smartEarningCourseGradientStart,
                AppTheme.smartEarningCourseGradientEnd,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            onPressed: () {
              // Handle course enrollment
              Navigator.pushNamed(context, '/payment_screen');
            },
          ),
        ),
      ],
    );
  }
}

/// Reusable benefit item widget with check icon
class _BenefitItem extends StatelessWidget {
  const _BenefitItem({required this.text, this.color = Colors.black87});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Icon(Icons.check_circle, color: Colors.black, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Reusable benefit item widget with check icon
class _descBenefitItem extends StatelessWidget {
  const _descBenefitItem({required this.text, this.color = Colors.black87});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Icon(Icons.circle, color: Colors.black, size: 10),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Reusable gradient button widget
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
      width: double.infinity,
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
              const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          alignment: Alignment.center,
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
    );
  }
}

/// Course benefits data
const List<String> _courseBenefits = [
  'এফিলিয়েট মার্কেটিং',
  'ডিজিটাল মার্কেটিং',
  'এক্টিভ ইনকাম ট্রেনিং',
  'প্যাসিভ ইনকাম ট্রেনিং',
  'লিডারশীপ ট্রেনিং',
  'মাইন্ডসেট, গোলসেট ট্রেনিং',
  'বেসিক Ai ট্রেনিং',
  'বেসিক ডিজাইনিং',
  'বেসিক ভিডিও এডিটিং',
  'বেসিক ইউটিউবিং',
];

const List<String> _desccourseBenefits = [
  'স্মার্ট আর্নিং কোর্স যা ডিজাইন করা হয়েছে মানুষের জীবনে স্থায়ী পরিবর্তন ও আত্মনির্ভরতা আনতে।',
  'এখানে আপনি পাবেন শুধুমাত্র একটি কোর্স নয়, বরং ইনকামের সুযোগ, সম্মান ও নেতৃত্ব গঠনের মাধ্যম, এবং নিজের একটি স্বপ্নের ভবিষ্যৎ গড়ার সুযোগ।',
  'প্রতিদিনের সহজ ও কার্যকরী কাজের মাধ্যমে আপনি নিশ্চিত ইনকাম করতে পারবেন।',
  'নির্দিষ্ট সাফল্য অর্জনে রয়েছে কোম্পানির পক্ষ থেকে আকর্ষণীয় রিওয়ার্ড, সম্মানজনক সেলারি এবং আজীবনের জন্য প্যাসিভ ইনকামের সুযোগ।',
  'স্মার্ট আর্নিং কোর্স এটি একটি জীবন পরিবর্তনের গাইডলাইন, একটি আত্মনির্ভরতার যাত্রা, একটি স্বপ্ন বাস্তবের গল্প।',
];

const List<String> _desctwocourseBenefits = [
  'যারা স্কুল, কলেজ, মাদ্রাসা বা বিশ্ববিদ্যালয়ে অধ্যয়নরত এবং অবসর সময়ে আয় করতে আগ্রহী।',
  'যারা ঘরে বসে একটি স্থায়ী ও নির্ভরযোগ্য অনলাইন ইনকামের পথ খুঁজছেন।',
  'যারা চাকরি বা ব্যবসার পাশাপাশি নিজের স্কিল ও অতিরিক্ত ইনকাম বাড়াতে চান।',
  'যারা একেবারে শুরু থেকে সঠিক দিকনির্দেশনায় নিজের ক্যারিয়ার গড়তে চান।',
  'যারা আত্মনির্ভরশীল হতে চান, ভবিষ্যৎ নিয়ে স্বপ্ন দেখেন এবং সম্মানের সাথে এগিয়ে যেতে চান।',
  'ছাত্র/ছাত্রী, তরুণ/তরুণী, গৃহিণী, প্রবাসীসহ সকল বয়সের আগ্রহী ব্যক্তিদের জন্য সমানভাবে উপযোগী।',
];
