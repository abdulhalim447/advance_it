import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SmartPromoterScreen extends StatelessWidget {
  const SmartPromoterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(),
      drawer: NavigationDrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            _buildBanner(),
            _buildContent(),
          ],
        ),
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.amber, Colors.yellow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Lottie.asset('assets/lottie/smartpromoter.json', height: 150),
      ),
    );
  }
}

Widget _buildBanner() => _Banner();

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'গ্লোবাল পারফরমেন্স ইনকাম ১২তম',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'প্রতি ৩ টি কোর্স বিক্রয় করলেই প্রতিদিন একবার করে অটো গ্লোবাল ইনকাম (৪ মাস পর্যন্ত)',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 24),
          _buildPerformanceButton(),
          const SizedBox(height: 24),
          _PerformanceCard(shadowColor: Colors.amber.withOpacity(0.3)),
        ],
      ),
    );
  }
}

Widget _buildContent() => _Content();

class _PerformanceButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.amber),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.symmetric(vertical: 12.0),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'আপনার অর্জিত পারফর্মেন্স সমূহ',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 8),
          Icon(Icons.thumb_up_alt_outlined, color: Colors.black),
        ],
      ),
    );
  }
}

Widget _buildPerformanceButton() => _PerformanceButton();

class _PerformanceCard extends StatelessWidget {
  const _PerformanceCard({required this.shadowColor});

  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.military_tech, color: Colors.red),
              const SizedBox(width: 8),
              const Text(
                'গ্লোবাল পারফর্মেন্স (১ম)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward, color: Colors.red),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _DashedBorderContainer(text: 'ইনকাম পাবেন : 120 দিন'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _DashedBorderContainer(
                  text: 'টার্গেট ৩ টি',
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _DashedBorderContainer(text: 'ইনকাম পেয়েছেন : 120 দিন'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _DashedBorderContainer(
                  text: 'সেলস ৩ টি',
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '( অর্জনের তারিখ : 2023-02-22 )',
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class _DashedBorderContainer extends StatelessWidget {
  const _DashedBorderContainer({required this.text, this.color = Colors.black});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
