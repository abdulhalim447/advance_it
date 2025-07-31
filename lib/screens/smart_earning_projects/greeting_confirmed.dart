import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';
import 'package:advance_it_ltd/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GreetingConfirmScreen extends StatelessWidget {
  const GreetingConfirmScreen({super.key});

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
                  'assets/lottie/greeting.json',
                  height: 300,
                  width: 300,
                ),
                const SizedBox(height: 10),
                const Text(
                  'অভিনন্দন!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0d13e9),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'আপনার স্মার্ট আর্নিং কোর্স অর্ডার \nসফলভাবে সম্পন্ন হয়েছে।',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Color(0xFF0d13e9)),
                ),
                const Text(
                  'এটি হতে যাচ্ছে আপনার জীবনের এক নতুন অধ্যায়, যেখানে রয়েছে দক্ষতার বিকাশ, আয়ের পথ, আর সম্ভাবনার দরজা।\n\nনতুন দক্ষতা অর্জন করুন এবং অ্যাডভান্স এর সাথে \nস্মার্ট আয়ের নতুন দিগন্ত উন্মোচন করুন!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Color(0xFF0d13e9)),
                ),

                const SizedBox(height: 30),
                PrimaryButton(
                  text: 'কোর্সে প্রবেশ করুন',
                  onPressed: () {
                    Navigator.pushNamed(context, '/dashboard');
                  },
                  color: Color(0xFF0d13e9),
                  textColor: Colors.white,
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
