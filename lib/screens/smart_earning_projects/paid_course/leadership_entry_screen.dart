import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';

class _LeadershipInfo {
  const _LeadershipInfo({
    required this.awardTitle,
    required this.awardSubtitle,
    required this.currentPosition,
    required this.fundDetails,
    required this.gradientColors,
    required this.shadowColor,
    required this.iconColor,
    required this.buttonColor,
    this.textColor,
  });

  final String awardTitle;
  final String awardSubtitle;
  final String currentPosition;
  final String fundDetails;
  final List<Color> gradientColors;
  final Color shadowColor;
  final Color iconColor;
  final Color buttonColor;
  final Color? textColor;
}

class LeadershipEntryScreen extends StatelessWidget {
  const LeadershipEntryScreen({super.key});

  static final _leadershipData = [
    _LeadershipInfo(
      awardTitle: 'অ্যাডভান্স লিডারশিপ',
      awardSubtitle: '',
      currentPosition: 'অ্যাডভান্স লিডারশিপ ৩য়',
      fundDetails: 'ইন্সট্যান্ট ৫০০ টাকা, প্রতি মাসে স্যালারী ৫০০ টাকা',
      gradientColors: [Colors.orange, Colors.amber.shade500, Colors.yellow],
      shadowColor: Colors.orange.withOpacity(0.4),
      iconColor: Colors.black,
      buttonColor: Colors.amber,
    ),
    _LeadershipInfo(
      awardTitle: 'সিনিয়র অ্যাডভান্স লিডারশিপ',
      awardSubtitle: 'লিডারশীপ এওয়ার্ড',
      currentPosition: 'সিনিয়র অ্যাডভান্স লিডারশিপ ১ম',
      fundDetails: 'ইন্সট্যান্ট ১,০০০ টাকা, প্রতি মাসে স্যালারী ১,০০০ টাকা',
      gradientColors: [Colors.orange, Colors.amber.shade500, Colors.yellow],
      shadowColor: Colors.orange.withOpacity(0.4),
      iconColor: Colors.black,
      buttonColor: Colors.amber,
    ),
    _LeadershipInfo(
      awardTitle: 'কো অর্ডিনেটর লিডারশিপ',
      awardSubtitle: 'লিডারশীপ এওয়ার্ড',
      currentPosition: 'এই লিডারশীপ টি এচিভ হয়নি',
      fundDetails: 'ইন্সট্যান্ট ৩,০০০ টাকা, প্রতি মাসে স্যালারী ৩,০০০ টাকা',
      gradientColors: [Colors.green, Colors.green.shade500, Colors.green],
      shadowColor: Colors.green.withOpacity(0.4),
      iconColor: Colors.white,
      textColor: Colors.white,
      buttonColor: Colors.green,
    ),
    _LeadershipInfo(
      awardTitle: 'সিনিয়র \nকো অর্ডিনেটর লিডারশিপ',
      awardSubtitle: 'লিডারশীপ এওয়ার্ড',
      currentPosition: 'এই লিডারশীপ টি এচিভ হয়নি',
      fundDetails:
          'ইন্সট্যান্ট ৫,০০০ টাকা, প্রতি মাসে স্যালারী ৫,০০০ টাকা + কক্সবাজার ট্যুর',
      gradientColors: [Colors.green, Colors.green.shade500, Colors.green],
      shadowColor: Colors.green.withOpacity(0.4),
      buttonColor: Colors.green,
      iconColor: Colors.white,
      textColor: Colors.white,
    ),
    _LeadershipInfo(
      awardTitle: 'স্পেশালিস্ট লিডারশিপ',
      awardSubtitle: 'লিডারশীপ এওয়ার্ড',
      currentPosition: 'এই লিডারশীপ টি এচিভ হয়নি',
      fundDetails:
          'ইন্সট্যান্ট ১০,০০০ টাকা, প্রতি মাসে স্যালারী ১০,০০০ টাকা + মালদ্বীপ ট্যুর',
      gradientColors: [Color(0xFFff3131), Color(0xFFff3131), Color(0xFFff3131)],
      shadowColor: Color(0xFFff3131).withOpacity(0.4),
      iconColor: Colors.white,
      textColor: Colors.white,
      buttonColor: Color(0xFFff3131),
    ),
    _LeadershipInfo(
      awardTitle: 'সিনিয়র স্পেশালিস্ট লিডারশিপ',
      awardSubtitle: 'লিডারশীপ এওয়ার্ড',
      currentPosition: 'এই লিডারশীপ টি এচিভ হয়নি',
      fundDetails:
          'ইন্সট্যান্ট ২০,০০০ টাকা, প্রতি মাসে স্যালারী ২০,০০০ টাকা + থাইল্যান্ড ট্যুর',
      gradientColors: [Color(0xFFff3131), Color(0xFFff3131), Color(0xFFff3131)],
      shadowColor: Color(0xFFff3131).withOpacity(0.4),
      iconColor: Colors.white,
      textColor: Colors.white,
      buttonColor: Color(0xFFff3131),
    ),
    _LeadershipInfo(
      awardTitle: 'লিড কনসালটেন্ট',
      awardSubtitle: 'লিডারশীপ এওয়ার্ড',
      currentPosition: 'এই লিডারশীপ টি এচিভ হয়নি',
      fundDetails:
          'ইন্সট্যান্ট ৫০,০০০ টাকা, প্রতি মাসে স্যালারী ৫০,০০০ টাকা + সুজুকি জিক্সার বাইক',
      gradientColors: [Color(0xFFcb6ce6), Color(0xFFcb6ce6), Color(0xFFcb6ce6)],
      shadowColor: Color(0xFFcb6ce6).withOpacity(0.4),
      iconColor: Colors.white,
      textColor: Colors.white,
      buttonColor: Color(0xFFcb6ce6),
    ),
    _LeadershipInfo(
      awardTitle: 'সিনিয়র লিড কনসালটেন্ট',
      awardSubtitle: 'লিডারশীপ এওয়ার্ড',
      currentPosition: 'এই লিডারশীপ টি এচিভ হয়নি',
      fundDetails:
          'ইন্সট্যান্ট ১,০০,০০০ টাকা, প্রতি মাসে স্যালারী ১,০০,০০০ টাকা + বড় হজ্জ',
      gradientColors: [Color(0xFFcb6ce6), Color(0xFFcb6ce6), Color(0xFFcb6ce6)],
      shadowColor: Color(0xFFcb6ce6).withOpacity(0.4),
      iconColor: Colors.white,
      textColor: Colors.white,
      buttonColor: Color(0xFFcb6ce6),
    ),
    _LeadershipInfo(
      awardTitle: 'ব্র্যান্ড অ্যাম্বাসেডর',
      awardSubtitle: 'লিডারশীপ এওয়ার্ড',
      currentPosition: 'এই লিডারশীপ টি এচিভ হয়নি',
      fundDetails:
          'ইন্সট্যান্ট ৫ লক্ষ টাকা, প্রতি মাসে স্যালারী ২ লক্ষ টাকা + একটি লাক্সারী গাড়ী ও একটি  অফিস সেটআপ',
      gradientColors: [Color(0xFF9B3CFC), Color(0xFF31BDFB)],
      shadowColor: Color(0xFF5271ff).withOpacity(0.4),
      iconColor: Colors.white,
      buttonColor: Color(0xFF5271ff),
      textColor: Colors.white,
    ),
    _LeadershipInfo(
      awardTitle: 'সিনিয়র ব্র্যান্ড অ্যাম্বাসেডর',
      awardSubtitle: 'লিডারশীপ এওয়ার্ড',
      currentPosition: 'এই লিডারশীপ টি এচিভ হয়নি',
      fundDetails:
          'ইন্সট্যান্ট ১ কোটি টাকা,মাসিক স্যালারী ২,৫০,০০০ টাকা + নমিনী ফান্ড ১০ লক্ষ টাকা ও একটি লাক্সারী বাড়ী',
      gradientColors: [Color(0xFF9B3CFC), Color(0xFF31BDFB)],
      shadowColor: Color(0xFF5271ff).withOpacity(0.4),
      iconColor: Colors.white,
      textColor: Colors.white,
      buttonColor: Color(0xFF5271ff),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(),
      drawer: NavigationDrawerWidget(),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _leadershipData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: _LeadershipCard(info: _leadershipData[index]),
          );
        },
      ),
    );
  }
}

class _LeadershipCard extends StatelessWidget {
  const _LeadershipCard({required this.info});

  final _LeadershipInfo info;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,

      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            height: 170,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: info.shadowColor,
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 100,
                top: 16,
                right: 16,
                bottom: 16,
              ),
              child: _RightInfoPanel(info: info),
            ),
          ),
          Positioned(left: 0, child: _LeftAwardBox(info: info)),
          Positioned(
            top: 8,
            right: 0,
            child: Transform.rotate(
              angle: 30 * pi / 180, // ডান দিকে 15 ডিগ্রি কাত করার জন্য
              alignment: Alignment
                  .centerRight, // এই অ্যালাইনমেন্ট পয়েন্টের ভিত্তিতে ঘোরানো হবে
              child: Image.asset(
                'assets/icon/badge.png',
                fit: BoxFit.cover,
                width: 28,
                height: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LeftAwardBox extends StatelessWidget {
  const _LeftAwardBox({required this.info});

  final _LeadershipInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 150,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: info.gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon/awards.png',
            fit: BoxFit.cover,
            width: 50,
            height: 50,
            color: info.iconColor,
          ),
          const SizedBox(height: 8),
          Text(
            info.awardTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: info.textColor ?? Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _RightInfoPanel extends StatelessWidget {
  const _RightInfoPanel({required this.info});

  final _LeadershipInfo info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'আপনার বর্তমান অবস্থান',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          info.currentPosition,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          info.fundDetails,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/leadership-dtails_screen');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: info.buttonColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 4,
                shadowColor: info.shadowColor,
              ),
              child: Text(
                'এচিভমেন্ট',
                style: TextStyle(
                  color: info.textColor ?? Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/leadership-dtails_screen');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: info.buttonColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 4,
                shadowColor: info.shadowColor,
              ),
              child: Text(
                'রিওয়ার্ড',
                style: TextStyle(
                  color: info.textColor ?? Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
