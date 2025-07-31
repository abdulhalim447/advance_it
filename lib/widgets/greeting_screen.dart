import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';
import 'package:advance_it_ltd/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({super.key});

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
                const SizedBox(height: 40),
                const Text(
                  'অভিনন্দন!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'আপনার রেজিস্ট্রেশন সম্পন্ন হয়েছে। \nএটি আত্মউন্নয়ন, আয়, ও আধুনিক ডিজিটাল সেবার এক নতুন যাত্রা। এখন শুরু হোক আপনার অ্যাডভান্স ক্যারিয়ার ও স্বপ্নপূরণের পথচলা।',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),

                const SizedBox(height: 30),
                PrimaryButton(
                  text: 'ড্যাশবোর্ডে যান..',
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
