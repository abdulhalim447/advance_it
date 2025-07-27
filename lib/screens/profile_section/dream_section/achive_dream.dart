import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';
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
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width:
              MediaQuery.of(context).size.width * 0.95, // 95% of screen width
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Gradient Header
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 24, // Increased horizontal padding
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/deposit.png',
                      width: 50,
                      height: 50,
                      color: Colors.black87,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'সেভিংসের পরিমাণ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              // Input Section
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  32,
                  5,
                  24,
                  8,
                ), // Increased horizontal padding
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  textInputAction: TextInputAction.done,
                  autofocus: true,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: 'সেভিংসের পরিমাণ দিন',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    prefixIcon: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        '৳',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade700,
                        ),
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 0,
                      minHeight: 0,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade200),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade200),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.amber.shade400,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              // Buttons
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  32,
                  24,
                  32,
                  24,
                ), // Increased horizontal padding
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        child: Text(
                          'বাদ দিন',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          final value = double.tryParse(controller.text);
                          if (value != null && value > 0) {
                            Navigator.pop(context, value);
                          }
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: Colors.amber.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'সেভিংস',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
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
      appBar: const CustomAppBarWidget(),
      drawer: const NavigationDrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Goal Details & Actions Section
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Goal Name
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.goal['name'] ?? '',
                        textAlign: TextAlign.center,
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
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '৳ ${saved.toStringAsFixed(0)}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Remain',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '৳ ${remain.toStringAsFixed(0)}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
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
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                shadows: [
                                  Shadow(color: Colors.white, blurRadius: 3),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Amount and Date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Amount',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '৳ ${amount.toStringAsFixed(0)}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              isAchieved ? 'Achieved date' : 'Goal date',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              formattedDate,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
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
                              color: Colors.white,
                              elevation: 0,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: _showDepositDialog,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/deposit.png',
                                        width: 45,
                                        height: 45,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ), // Increased space between icon and text
                                      Text(
                                        'সেভিংস',
                                        style: TextStyle(
                                          color: Colors.amber.shade500,
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              elevation: 0,
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
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/achieve.png',
                                        width: 45,
                                        height: 45,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ), // Increased space between icon and text
                                      Text(
                                        'এচিভ',
                                        style: TextStyle(
                                          color: Colors.amber.shade500,
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
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Recent Deposits Section
              if (_deposits.isNotEmpty)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8.0,
                            top: 10,
                            left: 15,
                          ),
                          child: Text(
                            'Recent Savings',
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

class _GoalProgressBar extends StatelessWidget {
  final double percent;
  const _GoalProgressBar({required this.percent});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        value: percent,
        minHeight: 25,
        backgroundColor: Colors.grey[300],
        valueColor: AlwaysStoppedAnimation(AppTheme.primaryColor),
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
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 8, 8, 8),
                          ),
                        ),
                        Text(
                          '$month $year',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Time aligned to the right
                Text(
                  timeStr,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          ),

          Divider(color: Colors.black26, thickness: 1),

          Container(
            width: double.infinity, // Ensure full width
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.amber.shade500,
                      radius: 20,
                      child: Image.asset(
                        'assets/icons/deposit.png',
                        width: 25,
                        height: 25,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'সেভিংস',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                // Amount aligned to the right
                Text(
                  '৳ ${deposit.amount.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
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
