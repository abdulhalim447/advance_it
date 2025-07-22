import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

// Deposit model
class Deposit {
  final double amount;
  final DateTime dateTime;
  Deposit({required this.amount, required this.dateTime});
}

class AchiveDreamScreen extends StatefulWidget {
  final Map<String, dynamic> goal;
  const AchiveDreamScreen({super.key, required this.goal});

  @override
  State<AchiveDreamScreen> createState() => _AchiveDreamScreenState();
}

class _AchiveDreamScreenState extends State<AchiveDreamScreen> {
  late double saved;
  late double amount;
  late DateTime? targetDate;
  final List<Deposit> _deposits = [];
  bool isAchieved = false;
  DateTime? achievedDate;

  @override
  void initState() {
    super.initState();
    saved = widget.goal['saved'] ?? 0.0;
    amount =
        double.tryParse(widget.goal['amount'].toString().replaceAll(',', '')) ??
        0.0;
    targetDate = widget.goal['targetDate'] is DateTime
        ? widget.goal['targetDate']
        : null;
    // Optionally, load initial deposits if needed
  }

  double get remain => (amount - saved).clamp(0, amount);
  double get percent => amount > 0 ? (saved / amount).clamp(0, 1) : 0.0;
  int get daysLeft {
    if (targetDate == null) return 0;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(
      targetDate!.year,
      targetDate!.month,
      targetDate!.day,
    );
    return target.difference(today).inDays;
  }

  String get formattedDate => targetDate != null
      ? '${targetDate!.day.toString().padLeft(2, '0')}/${targetDate!.month.toString().padLeft(2, '0')}/${targetDate!.year}'
      : '';

  Future<void> _showDepositDialog() async {
    final controller = TextEditingController();
    final result = await showDialog<double>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Deposit Amount'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          textInputAction: TextInputAction.done,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Enter amount',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final value = double.tryParse(controller.text);
              if (value != null && value > 0) {
                Navigator.pop(context, value);
              }
            },
            child: const Text('Deposit'),
          ),
        ],
      ),
    );
    if (result != null && result > 0) {
      setState(() {
        saved += result;
        if (saved > amount) saved = amount;
        _deposits.insert(0, Deposit(amount: result, dateTime: DateTime.now()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Goal',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Goal Name
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                // decoration: BoxDecoration(
                //   color: Colors.blue.shade50, // or any color you like
                //   borderRadius: BorderRadius.circular(12),
                //   border: Border.all(color: Colors.blueAccent, width: 1.5),
                // ),
                child: Text(
                  widget.goal['name'] ?? '',
                  style: const TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Saved/Remain
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saved',
                        style: TextStyle(color: Colors.grey[700], fontSize: 15),
                      ),
                      Text(
                        '৳ ${saved.toStringAsFixed(0)}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Remain',
                        style: TextStyle(color: Colors.grey[700], fontSize: 15),
                      ),
                      Text(
                        '৳ ${remain.toStringAsFixed(0)}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Progress bar
              Stack(
                alignment: Alignment.center,
                children: [
                  _GoalProgressBar(percent: percent),
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        '${(percent * 100).toStringAsFixed(2)}%',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          shadows: [Shadow(color: Colors.white, blurRadius: 3)],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Amount and Date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amount',
                        style: TextStyle(color: Colors.grey[700], fontSize: 15),
                      ),
                      Text(
                        '৳ ${amount.toStringAsFixed(0)}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        isAchieved ? 'Achieved date' : 'Goal date',
                        style: TextStyle(color: Colors.grey[700], fontSize: 15),
                      ),
                      Text(
                        formattedDate,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      if (!isAchieved && targetDate != null)
                        Text(
                          '$daysLeft days left',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 13,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              if (!isAchieved)
                Row(
                  children: [
                    Expanded(
                      child: Material(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                        elevation: 2,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: _showDepositDialog,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.add, size: 28),
                                const SizedBox(width: 5),
                                const Text(
                                  'DEPOSIT',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    letterSpacing: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Material(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                        elevation: 2,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () async {
                            if (percent < 1.0) return;
                            final result = await showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Achieve Goal'),
                                content: const Text(
                                  'Do you really want to set this goal as achieved?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, false),
                                    child: const Text('Later'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, true),
                                    child: const Text('Yes'),
                                  ),
                                ],
                              ),
                            );
                            if (result == true) {
                              setState(() {
                                isAchieved = true;
                                achievedDate = DateTime.now();
                                targetDate = achievedDate;
                              });
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.track_changes_outlined),
                                const SizedBox(width: 5),
                                const Text(
                                  'ACHIEVE',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    letterSpacing: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              // Recent Deposits List
              if (_deposits.isNotEmpty) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Recent Deposits',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _deposits.length,
                  itemBuilder: (context, index) {
                    final deposit = _deposits[index];
                    return _DepositCard(deposit: deposit);
                  },
                ),
                const SizedBox(height: 16),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _GoalProgressBar extends StatelessWidget {
  final double percent;
  const _GoalProgressBar({required this.percent});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        value: percent,
        minHeight: 20,
        backgroundColor: Colors.grey[300],
        valueColor: AlwaysStoppedAnimation(AppTheme.accentColor),
      ),
    );
  }
}

// Deposit Card Widget
class _DepositCard extends StatelessWidget {
  final Deposit deposit;
  const _DepositCard({required this.deposit});

  @override
  Widget build(BuildContext context) {
    final date = deposit.dateTime;
    final day = date.day.toString().padLeft(2, '0');
    final weekday = _weekdayName(date.weekday);
    final month = _monthName(date.month);
    final year = date.year;
    final time = TimeOfDay.fromDateTime(date);
    final timeStr = time.format(context);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  day,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weekday,
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    Text(
                      '$month $year',
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 16,
                                child: const Icon(
                                  Icons.account_balance_wallet_outlined,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Deposit',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '৳ ${deposit.amount.toStringAsFixed(0)}',
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          timeStr,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _weekdayName(int weekday) {
    const names = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return names[(weekday - 1) % 7];
  }

  String _monthName(int month) {
    const names = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return names[(month - 1) % 12];
  }
}
