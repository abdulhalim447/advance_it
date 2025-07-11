import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/navigation_drawer_widget.dart';

class SofotnamaScreen extends StatefulWidget {
  const SofotnamaScreen({super.key});

  @override
  State<SofotnamaScreen> createState() => _SofotnamaScreenState();
}

class _SofotnamaScreenState extends State<SofotnamaScreen> {
  final String _pledgeText =
      """আমি এই মর্মে শপথ করছি যে, Advance Inspire Technology Limited-এর একজন স্বতন্ত্র প্রতিনিধি ও অংশীদার হিসেবে আমি সততা, নিষ্ঠা ও দায়িত্ববোধের সঙ্গে কাজ করবো এবং কোম্পানির সকল নীতি ও নিয়ম-কানুন মেনে চলবো।

আমি নীতি-নৈতিকতার সাথে নিজেকে পরিচালিত করবো, নিজের ও টিমের উন্নতির জন্য নিরলস পরিশ্রম করবো এবং সকল সদস্য, গ্রাহক ও সংশ্লিষ্ট ব্যক্তিদের প্রতি আন্তরিক সহযোগিতার মনোভাব বজায় রাখবো।

আমি কখনোই অতিরঞ্জিত বা বিভ্রান্তিকর তথ্য প্রচার করবো না। আমি সময়ের সঠিক ব্যবহার করবো, নিজের দক্ষতা উন্নয়নের জন্য প্রশিক্ষণ গ্রহণ করবো এবং অন্যদের শেখার জন্য অনুপ্রাণিত করবো। আমি গঠনমূলক চিন্তাকে অগ্রাধিকার দেবো, নেতিবাচক সমালোচনা বা অর্থহীন বিতর্কে সময় নষ্ট করবো না।

আমি অসহায় মানুষের পাশে দাঁড়াবো, ক্ষুধার্তদের জন্য খাবারের ব্যবস্থা করবো এবং স্বেচ্ছাসেবী হিসেবে সমাজের কল্যাণে ভূমিকা রাখবো। আমি সৎ পথে উপার্জন করবো এবং জীবনের প্রতিটি ক্ষেত্রে ন্যায় ও মানবিকতার চর্চা করবো।

আমি Advance Inspire Technology Limited-এর লক্ষ্য ও উদ্দেশ্য বাস্তবায়নে সর্বদা নিবেদিত থাকবো এবং একটি উন্নত ভবিষ্যৎ গড়তে অবিচল থাকবো।

সত্য, ন্যায়, ও কল্যাণের পথে আল্লাহ আমাদের পরিচালিত করুন, আমাদের কাজকে বরকতময় করুন এবং আমাদের মাধ্যমে সমাজে ইতিবাচক পরিবর্তন আনুন। আমীন।""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: const CustomAppBarWidget(),
      drawer: const NavigationDrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              _buildBanner(),
              _buildPledgeContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/sofotnama_banner.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPledgeContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Advance It platform -এর শপথনামা',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          _buildPledgeCard(),
        ],
      ),
    );
  }

  Widget _buildPledgeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        _pledgeText,
        style: const TextStyle(
          fontSize: 16,
          height: 1.6,
          color: Color(0xFF333333),
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
