import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import '../../widgets/navigation_drawer_widget.dart';

class ProfileScreenWidget extends StatelessWidget {
  const ProfileScreenWidget({super.key});

  void _handleInfoCardTap(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const CustomAppBarWidget(),
      drawer: const NavigationDrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            // Stack to position the action buttons overlapping the header
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                // Profile Header with Gradient Background
                const ProfileHeaderWidget(
                  name: 'ADVANCE IT',
                  isVerified: false,
                ),

                // Action buttons positioned to overlap the bottom of the header
                const Positioned(
                  bottom: -0, // Negative value to make it overlap
                  left: 0,
                  right: 0,
                  child: const ProfileCompletionBarWidget(percentage: 50),
                ),
              ],
            ),

            // Add space to account for the overlapping buttons
            const SizedBox(height: 25),
            ProfileActionButtonsWidget(),

            // Profile Completion Progress
            const SizedBox(height: 16),

            // Information Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ProfileInfoCardWidget(
                    icon: Icons.info,
                    iconColor: Colors.blue,
                    title: 'প্রাথমিক তথ্য',
                    percentage: 60,
                    onTap: () => _handleInfoCardTap(context, '/basic-info'),
                  ),
                  ProfileInfoCardWidget(
                    icon: Icons.person,
                    iconColor: Colors.orange,
                    title: 'ব্যক্তিগত তথ্য',
                    percentage: 0,
                    onTap: () => _handleInfoCardTap(context, '/personal-info'),
                  ),
                  ProfileInfoCardWidget(
                    icon: Icons.description,
                    iconColor: Colors.purple,
                    title: 'ডকুমেন্টস',
                    percentage: 0,
                    onTap: () => _handleInfoCardTap(context, '/documents'),
                  ),
                  ProfileInfoCardWidget(
                    icon: Icons.apartment,
                    iconColor: Colors.blue,
                    title: 'ঠিকানা',
                    percentage: 5,
                    onTap: () => _handleInfoCardTap(context, '/address'),
                  ),
                  ProfileInfoCardWidget(
                    icon: Icons.people,
                    iconColor: Colors.orange,
                    title: 'নমিনী',
                    percentage: 0,
                    onTap: () => _handleInfoCardTap(context, '/nominee'),
                  ),

                  ProfileInfoCardWidget(
                    icon: Icons.emoji_objects_outlined,
                    iconColor: Colors.orange,
                    title: 'স্বপ্ন ও লক্ষ্য',
                    percentage: 0,
                    onTap: () => _handleInfoCardTap(context, '/dream-info'),
                  ),

                  ProfileInfoCardWidget(
                    icon: Icons.article,
                    iconColor: Colors.teal,
                    title: 'অতিরিক্ত তথ্য',
                    percentage: 0,
                    onTap: () =>
                        _handleInfoCardTap(context, '/additional-info'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ProfileHeaderWidget extends StatelessWidget {
  final String name;
  final bool isVerified;

  const ProfileHeaderWidget({
    super.key,
    required this.name,
    required this.isVerified,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.amber.shade500, Colors.yellow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        /*gradient: LinearGradient(
          colors: [
            Color(0xFFFF5722), // Deep Orange
            Color(0xFFFF9800), // Orange
            Color(0xFFFFB74D), // Light Orange
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),*/
      ),
      child: Column(
        children: [
          // Profile Image
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.red, Colors.amber],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                    color: Color(0xFFFED700),
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Name
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Verification Status
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Profile Not Completed',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
class ProfileCompletionBarWidget extends StatelessWidget {
  final int percentage;

  const ProfileCompletionBarWidget({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white, width: 3)
              ),
              child: Stack(
                children: [
                  // Progress indicator
                  FractionallySizedBox(
                    widthFactor: percentage / 100,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: percentage == 100 
                              ? [Colors.green.shade400, Colors.green.shade600]
                              : [Colors.blue.shade400, Colors.blue.shade600],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '$percentage%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileActionButtonsWidget extends StatelessWidget {
  const ProfileActionButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Verify Account Button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFFED700),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.person_outline, color: Colors.black),
                SizedBox(width: 8),
                Text(
                  'আপনার প্রোফাইল কমপ্লিট করুন',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileInfoCardWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final int percentage;
  final VoidCallback onTap;

  const ProfileInfoCardWidget({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.percentage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: iconColor.withOpacity(0.40),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16,
            bottom: 26,
            top: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side: Icon and Title
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      Icon(icon, color: iconColor, size: 32),
                      const SizedBox(width: 16),
                      Flexible(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Right side: Status and Percentage
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Incomplete',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, top: 8),
                      child: SizedBox(
                        height: 30,
                        width: 30,

                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: percentage / 100,
                              strokeWidth: 3,
                              backgroundColor: Colors.grey.withOpacity(0.2),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                percentage < 30 ? Colors.red : Colors.green,
                              ),
                            ),
                            Text(
                              '$percentage%',
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: percentage < 30
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
