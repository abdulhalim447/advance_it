import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import '../../widgets/navigation_drawer_widget.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  String? gender;
  String? religion;
  String? blood;
  String? marital;

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

            // Personal Information Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ব্যাক্তিগত তথ্য ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Information Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  // Parent's Information
                  ProfileInfoCardWidget(
                    icon: Icons.person_outline,
                    iconColor: Colors.blue,
                    title: 'পিতার নাম',
                    hintText: 'পিতার নাম লিখুন',
                    isEditable: true,
                  ),
                  ProfileInfoCardWidget(
                    icon: Icons.person_outline,
                    iconColor: Colors.purple,
                    title: 'মাতার নাম',
                    hintText: 'মাতার নাম লিখুন',
                    isEditable: true,
                  ),

                  // Birth Date
                  ProfileDatePickerWidget(
                    icon: Icons.calendar_today,
                    iconColor: Colors.blue,
                    title: 'জন্ম তারিখ :',
                    onDateSelected: (date) {
                      // Handle date selection
                    },
                  ),

                  // Dropdown Fields
                  const SizedBox(height: 10),
                  ProfileDropdownWidget(
                    hintText: 'লিঙ্গ নির্বাচন করুন...',
                    items: ['পুরুষ', 'মহিলা', 'অন্যান্য'],
                    value: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value;
                      });
                    },
                  ),

                  const SizedBox(height: 10),
                  ProfileDropdownWidget(
                    hintText: 'ধর্ম নির্বাচন করুন...',
                    items: [
                      'ইসলাম',
                      'হিন্দু',
                      'খ্রিস্তান',
                      'বৌদ্ধ',
                      'অন্যান্য',
                    ],
                    value: religion,
                    onChanged: (value) {
                      setState(() {
                        religion = value;
                      });
                    },
                  ),

                  const SizedBox(height: 10),
                  ProfileDropdownWidget(
                    hintText: 'রক্ত ধর্ম নির্বাচন করুন...',
                    items: ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'],
                    value: blood,
                    onChanged: (value) {
                      setState(() {
                        blood = value;
                      });
                    },
                  ),

                  const SizedBox(height: 10),
                  ProfileDropdownWidget(
                    hintText: 'বিবাহ অবস্থা নির্বাচন করুন.',
                    items: ['সিঙ্গেল', 'বিবাহিত', 'বিচ্ছিন্ন'],
                    value: marital,
                    onChanged: (value) {
                      setState(() {
                        marital = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: PrimaryButton(
          text: 'তথ্য সংরক্ষণ করুন',
          onPressed: () {
            // Save logic
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('ব্যাক্তিগত তথ্য সফলভাবে সংরক্ষণ করা হয়েছে'),
              ),
            );
          },
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
  final String hintText;
  final String initialValue;
  final bool isEditable;
  final Function(String)? onChanged;

  const ProfileInfoCardWidget({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.hintText,
    this.initialValue = '',
    this.isEditable = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 42),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 2),
                  TextFormField(
                    initialValue: initialValue,
                    enabled: isEditable,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                    ),
                    style: const TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                ],
              ),
            ),
            if (isEditable)
              const Icon(Icons.edit, color: Colors.blue, size: 24),
          ],
        ),
      ),
    );
  }
}

class ProfileDatePickerWidget extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final Function(DateTime) onDateSelected;

  const ProfileDatePickerWidget({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.onDateSelected,
  });

  @override
  State<ProfileDatePickerWidget> createState() =>
      _ProfileDatePickerWidgetState();
}

class _ProfileDatePickerWidgetState extends State<ProfileDatePickerWidget> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: widget.iconColor.withOpacity(0.40),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            SizedBox(width: 16),
            Icon(widget.icon, color: widget.iconColor, size: 32),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                  if (selectedDate != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picked != null) {
                  setState(() {
                    selectedDate = picked;
                  });
                  widget.onDateSelected(picked);
                }
              },
              child: Icon(Icons.edit, color: Colors.blue, size: 24),
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

class ProfileDropdownWidget extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final Function(String?)? onChanged;
  final String? value;

  const ProfileDropdownWidget({
    super.key,
    required this.hintText,
    required this.items,
    this.onChanged,
    this.value,
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
            color: Colors.blue.withOpacity(0.40),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
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
