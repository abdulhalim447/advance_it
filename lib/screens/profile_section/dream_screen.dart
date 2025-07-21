import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widgets/navigation_drawer_widget.dart';

// Simple model representing a single dream goal
class Dream {
  String title;
  int amount; // in local currency (তাকা)
  bool isCompleted;

  Dream({required this.title, required this.amount, this.isCompleted = false});
}

class DreamScreen extends StatefulWidget {
  const DreamScreen({super.key});

  @override
  State<DreamScreen> createState() => _DreamScreenState();
}

class _DreamScreenState extends State<DreamScreen> {
  // Number formatter for currency display
  final NumberFormat _formatter = NumberFormat('#,##0', 'en_US');

  // Palette for unique box-shadow colours per card
  final List<Color> _shadowPalette = [
    Colors.blue,
    Colors.purple,
    Colors.green,
    Colors.orange,
    Colors.red,
    Colors.teal,
    Colors.amber,
  ];

  // Pre-populated list of dreams (can be modified by the user)
  final List<Dream> _dreams = [
    Dream(
      title: 'অনলাইন ব্যবসা শুরু করতে চাই',
      amount: 150000,
      isCompleted: false,
    ),
    Dream(title: 'উমরাহ করতে চাই', amount: 200000, isCompleted: false),
  ];

  // Dialog controllers – created lazily when adding a dream
  final TextEditingController _newDreamTitle = TextEditingController();
  final TextEditingController _newDreamAmount = TextEditingController();

  // Helpers
  int get _totalBudget => _dreams.fold(0, (sum, d) => sum + d.amount);

  void _toggleCompletion(int index) {
    setState(() {
      _dreams[index].isCompleted = !_dreams[index].isCompleted;
    });
  }

  void _showAddDreamDialog() {
    _newDreamTitle.clear();
    _newDreamAmount.clear();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('নতুন স্বপ্ন যুক্ত করুন'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _newDreamTitle,
                decoration: const InputDecoration(labelText: 'স্বপ্ন'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _newDreamAmount,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'প্রয়োজনীয় টাকা',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('বাতিল'),
            ),
            ElevatedButton(
              onPressed: () {
                final String title = _newDreamTitle.text.trim();
                final int? amount = int.tryParse(
                  _newDreamAmount.text.replaceAll(',', ''),
                );
                if (title.isNotEmpty && amount != null) {
                  setState(() {
                    _dreams.add(Dream(title: title, amount: amount));
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('সংরক্ষণ করুন'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _newDreamTitle.dispose();
    _newDreamAmount.dispose();
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

            // Dreams Section (dynamic)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '🌟 আপনার স্বপ্ন লিখুন',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // List of dreams
                  ...List.generate(
                    _dreams.length,
                    (index) => _buildDreamCard(_dreams[index], index),
                  ),

                  const SizedBox(height: 10),

                  // Button to add a new dream
                  InkWell(
                    onTap: _showAddDreamDialog,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.15),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            'নতুন স্বপ্ন যুক্ত করুন',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Totals summary
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'মোট স্বপ্ন ${_dreams.length} টি',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'মোট বাজেট ${_formatter.format(_totalBudget)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
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

  Widget _buildDreamCard(Dream dream, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: _shadowPalette[index % _shadowPalette.length].withOpacity(
              0.25,
            ),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Checkbox(
              value: dream.isCompleted,
              onChanged: (value) => _toggleCompletion(index),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dream.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      decoration: dream.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'প্রয়োজনীয় টাকা: ${_formatter.format(dream.amount)}',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => _showAddDreamDialog(), // Edit dream
              icon: const Icon(Icons.edit, color: Colors.blue),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _dreams.removeAt(index);
                });
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
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
