import 'package:advance_it_ltd/core/theme/app_theme.dart';
import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';
import 'package:advance_it_ltd/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SmartSubGreeting extends StatelessWidget {
  const SmartSubGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(),
      drawer: NavigationDrawerWidget(),
      body: Stack(
        // Use Stack to overlay confetti
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Lottie.asset(
                  'assets/lottie/success.json',
                  height: 300,
                  width: 300,
                ),
                const SizedBox(height: 10),
                const Text(
                  'অভিনন্দন!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'আপনার স্মার্ট সাবস্ক্রিপশন অর্ডার সফল হয়েছে।',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.amber),
                ),
                const Text(
                  'প্রত্যেকটি প্রজেক্ট এখন আপনার ইনকাম প্ল্যাটফর্ম।\nসময়, দক্ষতা ও প্রচেষ্টা দিয়েই সম্ভব সাফল্যের চূড়ায় পৌঁছানো।বেকারত্ব নয়, এখন আপনার পরিচয় হোক একজন স্মার্ট ইনকামার হিসেবে।',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.amber),
                ),

                const SizedBox(height: 30),
                PrimaryButton(
                  text: 'হোমে ফিরে যান',
                  onPressed: () {
                    Navigator.pushNamed(context, '/dashboard');
                  },
                  color: Colors.amber,
                  textColor: Colors.black,
                ),
              ],
            ),
          ),
          // Confetti animation on top
          Positioned.fill(
            child: IgnorePointer(
              // To allow interaction with the dialog below
              child: Lottie.asset(
                'assets/lottie/confettie.json',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
