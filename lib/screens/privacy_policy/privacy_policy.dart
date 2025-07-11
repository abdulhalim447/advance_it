import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/navigation_drawer_widget.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final String _pledgeText =
      """ADVANCE (Advance IT Platform) provides this Privacy Policy to explain how we collect, use, and protect your personal information. When you use the Advance IT website, application, features, courses, subscriptions, or other services, this policy applies.
Your privacy is extremely important to us. This policy informs you about how we handle data collection, use, your rights, and your choices. By accessing or using our platform, you agree to this Privacy Policy.
1. Information We Collect
Personal Information:
Name, mobile number, email, address, date of birth, etc.
Payment details: bKash, Rocket, bank account, card information.
Identity verification: national ID, photo, or other official documents.
Non-Personal Information:
IP address, device info, browser type, location data.
Page visits, duration, clicks, and general user behavior.
2. Use of Information
We use your data to: Operate and enhance our four main services: Learning, Earning, Freelancing, and Services. Manage subscriptions, course access, live classes, service requests. Process income tracking, commissions, and referral systems.
Ensure security, verify identity, and prevent fraud.
Improve user experience and provide personalized support.
3. Smart Feature Data Collection
Live Class & Conversation Recordings: Live classes, meetings, or group chats may be recorded to improve training quality.
AI Analytics: We use automated analytics and AI tools to assess course progress, learning pace, and engagement for platform improvement.
Income & Referral Tracking: Referral and income data are tracked only within the system to ensure accurate records and rewards
4. Complaints & Support Records
If you submit a complaint or feedback via our Help Center, we may store this information to improve our support services.
5. Data Sharing & Third Parties
We do not sell your personal data to third parties. However, for legal, security, or service-related purposes, we may share information with trusted third parties under strict confidentiality.
6. Data Security
Data is secured using SSL and TLS encryption protocols.
All transmissions are encrypted and stored on secure servers.
While we strive for maximum security, no method is 100% guaranteed.
7. External Links
Advance IT may contain links to third-party websites. We are not responsible for their privacy policies or practices. You are encouraged to read their policies separately.
8. Policy Updates
We may update this policy periodically. Any major changes will be communicated via the app or email.
Limitation of Liability
By using the Advance IT Platform, you acknowledge that:
You are using the platform at your own responsibility.
Advance IT is not liable for any third-party misuse or legal issues.
Any illegal or inappropriate behavior may result in account suspension.
Advance IT Platform is committed to providing you with secure, transparent, and advanced digital services.""";

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
          Padding(
            padding: const EdgeInsets.only(right: 3.0),
            child: Positioned.fill(
              child: Image.asset(
                'assets/images/privacy_policy.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox();
                },
              ),
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
            'Privacy Policy',
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
