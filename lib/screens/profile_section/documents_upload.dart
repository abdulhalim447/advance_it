import 'dart:io';
import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/navigation_drawer_widget.dart';

class DocumentsUploadScreen extends StatefulWidget {
  const DocumentsUploadScreen({super.key});

  @override
  State<DocumentsUploadScreen> createState() => _DocumentsUploadScreenState();
}

class _DocumentsUploadScreenState extends State<DocumentsUploadScreen> {
  File? _nidFrontImage;
  File? _nidBackImage;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _nidController = TextEditingController();

  Future<void> _pickImage(bool isFront) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        if (isFront) {
          _nidFrontImage = File(image.path);
        } else {
          _nidBackImage = File(image.path);
        }
      });
    }
  }

  @override
  void dispose() {
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

            // Document Upload Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // NID Front Part
                  Stack(
                    children: [
                      // Gradient shadow
                      Positioned(
                        top: 8,
                        left: 8,
                        right: 8,
                        child: Container(
                          height: 216, // 200 + 16 padding
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              colors: [
                                Colors.orange.withOpacity(0.25),
                                Colors.amber.withOpacity(0.15),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.25),
                                blurRadius: 24,
                                offset: Offset(0, 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Main content
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange.withOpacity(0.7),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'NID Front Part',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            GestureDetector(
                              onTap: () => _pickImage(true),
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.amber.shade300,
                                  ),
                                ),
                                child: _nidFrontImage != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(
                                          _nidFrontImage!,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.folder,
                                            size: 60,
                                            color: Colors.grey.shade400,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Tap to select image',
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
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

                  const SizedBox(height: 20),

                  // NID Back Part
                  Stack(
                    children: [
                      // Gradient shadow
                      Positioned(
                        top: 8,
                        left: 8,
                        right: 8,
                        child: Container(
                          height: 216, // 200 + 16 padding
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              colors: [
                                Colors.orange.withOpacity(0.25),
                                Colors.amber.withOpacity(0.15),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.25),
                                blurRadius: 24,
                                offset: Offset(0, 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Main content
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.7),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'NID Back Part',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            GestureDetector(
                              onTap: () => _pickImage(false),
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.amber.shade300,
                                  ),
                                ),
                                child: _nidBackImage != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(
                                          _nidBackImage!,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.folder,
                                            size: 60,
                                            color: Colors.grey.shade400,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Tap to select image',
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
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

                  const SizedBox(height: 20),

                  // Save Button
                  Stack(
                    children: [
                      // Gradient shadow
                      Positioned(
                        top: 8,
                        left: 8,
                        right: 8,
                        child: Container(
                          height: 56, // Button height + padding
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              colors: [
                                Colors.orange.withOpacity(0.25),
                                Colors.amber.withOpacity(0.15),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.25),
                                blurRadius: 24,
                                offset: Offset(0, 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Main content
                      PrimaryButton(
                        text: 'তথ্য সংরক্ষণ করুন',
                        onPressed: () {
                          // Save document logic
                        },
                      ),
                    ],
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              initialValue: initialValue,
              enabled: isEditable,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: Icon(icon, color: iconColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                filled: !isEditable,
                fillColor: isEditable
                    ? Colors.transparent
                    : Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                suffixIcon: isEditable
                    ? Icon(Icons.edit, color: iconColor, size: 20)
                    : Icon(Icons.lock_outline, color: Colors.grey, size: 20),
              ),
              style: TextStyle(
                color: isEditable ? Colors.black87 : Colors.black54,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
