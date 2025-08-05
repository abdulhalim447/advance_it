import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';

class LeadershipDetailsScreen extends StatelessWidget {
  const LeadershipDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(),
      drawer: NavigationDrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Banner Image
              _buildBanner(),
              const SizedBox(height: 24),

              Text(
                'অ্যাডভান্স লিডারশীপ টার্গেট (১ম)',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'এচিভ করুন ইন্সট্যান্ট ইনকাম ও স্যালারি উপভোগ করুন ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              // First Button

              // Second Button
              _buildStyledButton(
                context: context,
                text: 'আপনার বর্তমান লিডারশীপ দেখুন',
                onPressed: () {
                  _showImageDialog(context);
                },
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildInfoCard(
                      context: context,
                      color: Colors.amber,
                      shadowColor: Colors.amber,
                      imageAsset: 'assets/icon/sale_icon.png',
                      title: 'কোর্স সেল',
                      target: '12',
                      achievement: '10',
                      onTap: () =>
                          Navigator.pushNamed(context, '/course-seller-list'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildInfoCard(
                      context: context,
                      color: const Color(0xFF6E9B17),
                      shadowColor: Colors.green,
                      imageAsset: 'assets/icons/u3.png',
                      title: 'ড্রাইভ প্যাক',
                      target: '10',
                      achievement: '51',
                      onTap: () =>
                          Navigator.pushNamed(context, '/mobile_recharge_'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
              _buildStyledButton(
                context: context,
                text: 'আপনার লিডারশীপের হিস্ট্রি দেখুন',
                onPressed: () {
                  Navigator.pushNamed(context, '/leadership_history_screen');
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Image.asset('assets/images/slider1.jpg', fit: BoxFit.cover),
        );
      },
    );
  }

  Widget _buildStyledButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 24), // To balance the icon
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: const Icon(Icons.arrow_forward_ios),
            ),
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
        child: Image.asset('assets/icon/goal_achive.png', height: 150),
      ),
    );
  }
}

Widget _buildBanner() => _Banner();

Widget _buildInfoCard({
  required BuildContext context,
  required Color color,
  required Color shadowColor,
  required String imageAsset,
  required String title,
  required String target,
  required String achievement,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(imageAsset, width: 40, height: 40),
                      const SizedBox(height: 8),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCircularInfo(color, target, 'আপনার\nটার্গেট'),
                      _buildCircularInfo(
                        color,
                        achievement,
                        'আপনার\nঅ্যাচিভমেন্ট',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildCircularInfo(Color color, String number, String label) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black, fontSize: 12),
      ),
    ],
  );
}
