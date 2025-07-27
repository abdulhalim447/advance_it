import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/main_header_profile.dart';
import 'package:flutter/material.dart';
import '../../../widgets/navigation_drawer_widget.dart';
import '../../../core/theme/app_theme.dart';
import 'achive_dream.dart';

class DreamScreen extends StatefulWidget {
  const DreamScreen({super.key});

  @override
  State<DreamScreen> createState() => _DreamScreenState();
}

class _DreamScreenState extends State<DreamScreen> {
  final List<Map<String, dynamic>> _goals = [
    {
      'name': 'New Business',
      'amount': '700,000',
      'targetDate': DateTime.now(),
      'progress': 1.0,
      'saved': 700000.0,
    },
  ];

  Future<void> _addGoal(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/add-dream');
    if (result is Map<String, dynamic>) {
      setState(() {
        _goals.add({
          'name': result['name'],
          'amount': result['amount'],
          'targetDate': result['targetDate'],
          'progress': 0.0,
          'saved': 0.0,
        });
      });
    }
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
            //This is the header profile
            const HeaderProfile(),
            const SizedBox(height: 25),
            // Goal Section
            _GoalSection(goals: _goals, onAddGoal: () => _addGoal(context)),
          ],
        ),
      ),
    );
  }
}

// Private widget for the Goal Section
class _GoalSection extends StatelessWidget {
  final List<Map<String, dynamic>> goals;
  final VoidCallback onAddGoal;
  const _GoalSection({required this.goals, required this.onAddGoal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            goals.length,
            (i) => InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AchiveDreamScreen(goal: goals[i]),
                  ),
                );
              },
              child: _GoalCard(goal: goals[i]),
            ),
          ),
          //const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: _AddGoalButton(onTap: onAddGoal),
          ),
        ],
      ),
    );
  }
}

// Private widget for the Goal Card
class _GoalCard extends StatelessWidget {
  final Map<String, dynamic> goal;
  const _GoalCard({required this.goal});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.cardShadowColor,
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Main content with padding to avoid overlap with progress indicator
          Padding(
            padding: const EdgeInsets.only(
              right: 70,
            ), // leave space for indicator
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      goal['name'] ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  '৳ ${goal['amount']} out of ৳ ${goal['amount']}',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
          // Progress indicator at middle right
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: _GoalProgressIndicator(percent: goal['progress'] ?? 0.0),
            ),
          ),
        ],
      ),
    );
  }
}

// Private widget for the circular progress indicator
class _GoalProgressIndicator extends StatelessWidget {
  final double percent; // 1.0 = 100%
  const _GoalProgressIndicator({required this.percent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 48,
          height: 48,
          child: CircularProgressIndicator(
            value: percent,
            strokeWidth: 4.5,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(AppTheme.accentColor),
          ),
        ),
        Text(
          '${(percent * 100).toInt()}%',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

// Private widget for the Add Goal button
class _AddGoalButton extends StatelessWidget {
  final VoidCallback onTap;
  const _AddGoalButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.accentColor, width: 1.5),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add, color: Colors.black, size: 20),
            SizedBox(width: 4),
            Text(
              'Add Goal',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
