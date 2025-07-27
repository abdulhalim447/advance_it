import 'package:advance_it_ltd/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: const _OtpForm(),
    );
  }
}

class _OtpForm extends StatelessWidget {
  const _OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(0, 179, 134, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.amber.shade400,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child:Lottie.asset('assets/lottie/otp.json'),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "ওটিপি ভেরিফিকেশন",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "আপনার মোবাইল নাম্বারে পাঠানো ৪ ডিজিটের কোডটি লিখুন।",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Pinput(
              length: 4,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              followingPinTheme: focusedPinTheme,
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              text: 'সামনে এগিয়ে যান',
              color: Colors.amber,
              onPressed: () {
                Navigator.pushNamed(context, '/form-screen');
              },
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "ওটিপি আসেনি? অপেক্ষা করুন",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
