import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import '../../widgets/navigation_drawer_widget.dart';

class NomineeScreen extends StatefulWidget {
  const NomineeScreen({super.key});

  @override
  State<NomineeScreen> createState() => _NomineeScreenState();
}

class _NomineeScreenState extends State<NomineeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _nidController = TextEditingController();
  String? _relation;

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _nidController.dispose();
    super.dispose();
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
                  child: ProfileCompletionBarWidget(percentage: 60),
                ),
              ],
            ),

            // Add space to account for the overlapping buttons
            const SizedBox(height: 25),

            // Nominee Information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'নমিনী তথ্য',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Nominee Name Field
                  ProfileInfoCardWidget(
                    icon: Icons.person,
                    iconColor: Colors.blue,
                    title: 'নমিনীর নাম',
                    controller: _nameController,
                  ),

                  // Nominee Mobile Field
                  ProfileInfoCardWidget(
                    icon: Icons.phone,
                    iconColor: Colors.purple,
                    title: 'নমিনীর মোবাইল নম্বর',
                    controller: _mobileController,
                  ),

                  // Nominee NID Field
                  ProfileInfoCardWidget(
                    icon: Icons.credit_card,
                    iconColor: Colors.blue,
                    title: 'নমিনীর জাতীয় পরিচয় পত্র',
                    controller: _nidController,
                  ),

                  // Relation Field
                  ProfileInfoCardWidget(
                    icon: Icons.people,
                    iconColor: Colors.purple,
                    title: 'সম্পর্ক',
                    controller: TextEditingController(),
                    isRelationField: true,
                    onRelationChanged: (value) {
                      setState(() {
                        _relation = value;
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  // Save Button
                  PrimaryButton(
                    text: 'নমিনী সেভ করুন',
                    onPressed: () {
                      // Save nominee logic
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

class ProfileInfoCardWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final TextEditingController controller;
  final bool isRelationField;
  final Function(String?)? onRelationChanged;

  const ProfileInfoCardWidget({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.controller,
    this.isRelationField = false,
    this.onRelationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: iconColor.withOpacity(
              0.3,
            ), // Shadow color matches the icon colour
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Icon(icon, color: iconColor, size: 32),
          const SizedBox(width: 16),
          if (!isRelationField)
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: title,
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                style: const TextStyle(color: Colors.black87, fontSize: 18),
              ),
            )
          else
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text(
                    title,
                    style: const TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black87, fontSize: 18),
                  onChanged: onRelationChanged,
                  items:
                      <String>[
                        'বাবা',
                        'মা',
                        'ভাই',
                        'বোন',
                        'স্বামী/স্ত্রী',
                        'ছেলে',
                        'মেয়ে',
                        'অন্যান্য',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
