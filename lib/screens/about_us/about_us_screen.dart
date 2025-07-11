import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/navigation_drawer_widget.dart';
import 'dart:math' as math;

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen>
    with SingleTickerProviderStateMixin {
  bool _isEnglish = false; // Start with Bengali text by default
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _fadeAnimation;

  final String _englishText =
      """Advance IT Platform is one of the most smart and comprehensive digital platforms in Bangladesh, operated under Advance Inspire Technology Limited. The company is a government-approved private limited company (Registration No.: C-200726/2025, TIN: 816356242828), registered in 2025 under the Companies Act of 1994.

Our core mission is to enhance the quality of life and create sustainable employment opportunities for millions by integrating learning, earning, freelancing, and essential digital services under one unified platform.

Advance IT Platform is an all-in-one Super App that empowers users to learn, work, earn, and manage their businesses digitally — all from a single platform.""";

  final String _banglaText =
      """অ্যাডভান্স আইটি প্ল্যাটফর্ম হলো বাংলাদেশের অন্যতম স্মার্ট এবং পূর্ণাঙ্গ ডিজিটাল প্ল্যাটফর্ম, যা পরিচালিত হচ্ছে Advance Inspire Technology Limited এর অধীনে। এটি একটি বাংলাদেশ সরকার অনুমোদিত প্রাইভেট লিমিটেড কোম্পানি (রেজি. নম্বর: C-200726/2025,TIN: 816356242828), যা কোম্পানি আইন ১৯৯৪-এর অধীনে ২০২৫ সালে নিবন্ধিত হয়।

আমাদের লক্ষ্য হলো — লার্নিং, আর্নিং, ফ্রিল্যান্সিং এবং দৈনন্দিন ডিজিটাল সেবা এক প্ল্যাটফর্মের আওতায় এনে কোটি মানুষের জীবনমান উন্নয়ন এবং টেকসই কর্মসংস্থানের পথ তৈরি করা।

Advance IT Platform একটি অল-ইন-ওয়ান সুপার অ্যাপ যা ব্যবহারকারীদের শেখা, কাজ করা, আয় করা এবং নিজেদের ব্যবসাকে ডিজিটালভাবে পরিচালনার সব সুযোগ একত্রে দেয়।""";

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: math.pi).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleLanguage() {
    if (_animationController.isAnimating) {
      return; // Prevent multiple clicks during animation
    }

    _animationController.forward().then((_) {
      setState(() {
        _isEnglish = !_isEnglish;
      });
      _animationController.reset();
    });
  }

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
              _buildAboutContent(),
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
              'assets/images/about_us_banner.jpg',
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

  Widget _buildAboutContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'আমাদের সম্পর্কে',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              _buildLanguageToggle(),
            ],
          ),
          const SizedBox(height: 16),
          _buildAboutCard(),
        ],
      ),
    );
  }

  Widget _buildLanguageToggle() {
    return InkWell(
      onTap: _toggleLanguage,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _isEnglish ? 'বাংলা' : 'English',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF997300),
              ),
            ),
            const SizedBox(width: 4),
            AnimatedBuilder(
              animation: _rotationAnimation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _isEnglish ? _rotationAnimation.value : 0,
                  child: child,
                );
              },
              child: const Icon(
                Icons.translate,
                size: 18,
                color: Color(0xFF997300),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutCard() {
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
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Text(
          _isEnglish ? _englishText : _banglaText,
          key: ValueKey<bool>(_isEnglish),
          style: const TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Color(0xFF333333),
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
