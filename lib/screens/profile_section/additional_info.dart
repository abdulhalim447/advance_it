import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import '../../widgets/navigation_drawer_widget.dart';
import '../../widgets/primary_button.dart';

class AdditionalInfoScreen extends StatefulWidget {
  const AdditionalInfoScreen({super.key});

  @override
  State<AdditionalInfoScreen> createState() => _AdditionalInfoScreenState();
}

class _AdditionalInfoScreenState extends State<AdditionalInfoScreen> {
  String? education;
  String? profession;
  String? incomeLevel;
  String? hobby;
  String? interest;
  String? lifeStyle;

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
                  child: ProfileCompletionBarWidget(percentage: 60),
                ),
              ],
            ),

            // Add space to account for the overlapping buttons
            const SizedBox(height: 25),

            // Additional Information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'অতিরিক্ত তথ্য',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Education Dropdown
                  ProfileDropdownWidget(
                    hintText: 'সর্বোচ্চ শিক্ষাগত যোগ্যতা নির্বাচন করুন...',
                    items: [
                      'এসএসসি',
                      'এইচএসসি',
                      'স্নাতক',
                      'স্নাতকোত্তর',
                      'পিএইচডি',
                      'অন্যান্য',
                    ],
                    value: education,
                    onChanged: (value) {
                      setState(() {
                        education = value;
                      });
                    },
                    boxShadowColor: Colors.blue,
                  ),

                  const SizedBox(height: 10),

                  // Profession Dropdown
                  ProfileDropdownWidget(
                    hintText: 'পেশা নির্বাচন করুন...',
                    items: [
                      'ছাত্র/ছাত্রী',
                      'শিক্ষক',
                      'চিকিৎসক',
                      'প্রকৌশলী',
                      'ব্যবসায়ী',
                      'সরকারি চাকরি',
                      'বেসরকারি চাকরি',
                      'অন্যান্য',
                    ],
                    value: profession,
                    onChanged: (value) {
                      setState(() {
                        profession = value;
                      });
                    },
                    boxShadowColor: Colors.purple,
                  ),

                  const SizedBox(height: 10),

                  // Income Level Dropdown
                  ProfileDropdownWidget(
                    hintText: 'আয়ের পরিমাণ নির্বাচন করুন...',
                    items: [
                      '১০,০০০ এর নিচে',
                      '১০,০০০-২০,০০০',
                      '২০,০০,০৫০,০০০',
                      '৫০,০০০-১,০০,০০০',
                      '১,০০,০০০ এর উপরে',
                    ],
                    value: incomeLevel,
                    onChanged: (value) {
                      setState(() {
                        incomeLevel = value;
                      });
                    },
                    boxShadowColor: Colors.green,
                  ),

                  const SizedBox(height: 10),

                  // Hobby Dropdown
                  ProfileDropdownWidget(
                    hintText: 'শখ',
                    items: [
                      'পড়াশোনা',
                      'খেলাধুলা',
                      'সঙ্গীত',
                      'ভ্রমণ',
                      'রান্না',
                      'বাগান করা',
                      'ফটোগ্রাফি',
                      'অন্যান্য',
                    ],
                    value: hobby,
                    onChanged: (value) {
                      setState(() {
                        hobby = value;
                      });
                    },
                    boxShadowColor: Colors.orange,
                  ),

                  const SizedBox(height: 10),

                  // Interest Dropdown
                  ProfileDropdownWidget(
                    hintText: 'আগ্রহ',
                    items: [
                      'প্রযুক্তি',
                      'বিজ্ঞান',
                      'শিল্প',
                      'সাহিত্য',
                      'রাজনীতি',
                      'ব্যবসা',
                      'সমাজসেবা',
                      'অন্যান্য',
                    ],
                    value: interest,
                    onChanged: (value) {
                      setState(() {
                        interest = value;
                      });
                    },
                    boxShadowColor: Colors.teal,
                  ),

                  const SizedBox(height: 10),

                  // Life Style Dropdown
                  ProfileDropdownWidget(
                    hintText: 'জীবনযাপন',
                    items: [
                      'সাধারণ',
                      'মধ্যম',
                      'বিলাসবহুল',
                      'সাশ্রয়ী',
                      'অন্যান্য',
                    ],
                    value: lifeStyle,
                    onChanged: (value) {
                      setState(() {
                        lifeStyle = value;
                      });
                    },
                    boxShadowColor: Colors.red,
                  ),

                  const SizedBox(height: 20),

                  // Save Button
                  PrimaryButton(
                    text: 'তথ্য সংরক্ষণ করুন',
                    onPressed: () {
                      // Save logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'অতিরিক্ত তথ্য সফলভাবে সংরক্ষণ করা হয়েছে',
                          ),
                        ),
                      );
                    },
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
                border: Border.all(color: Colors.white, width: 3),
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

class ProfileDropdownWidget extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final Function(String?)? onChanged;
  final String? value;
  final Color boxShadowColor;

  const ProfileDropdownWidget({
    super.key,
    required this.hintText,
    required this.items,
    this.onChanged,
    this.value,
    this.boxShadowColor = Colors.blue, // default shadow colour
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: boxShadowColor.withOpacity(0.35),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(
            hintText,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
          ),
          value: value,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.black87, fontSize: 18),
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
        ),
      ),
    );
  }
}
