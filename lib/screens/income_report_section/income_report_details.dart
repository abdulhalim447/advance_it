import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';

class IncomeReportDetailsScreen extends StatelessWidget {
  static const String routeName = '/income-report-details';

  final String title;
  final Map<String, String> incomeData;

  const IncomeReportDetailsScreen({
    super.key,
    required this.title,
    required this.incomeData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBarWidget(),
      drawer: NavigationDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _IncomeSummaryCard(incomeData: incomeData),
      ),
    );
  }
}

class _IncomeSummaryCard extends StatelessWidget {
  final Map<String, String> incomeData;

  const _IncomeSummaryCard({required this.incomeData});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // As per core.md, colors should come from an AppColors file.
    // Using hardcoded color as a placeholder.
    const totalColor = Color(0xFFE53935);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'সারসংক্ষেপ',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: 'সর্বমোট: ',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: incomeData['total']!,
                      style: TextStyle(
                        color: totalColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(),
          ),
          _IncomeDetailRow(
            label: 'আজকের দিনের ইনকাম',
            value: incomeData['today']!,
          ),
          _IncomeDetailRow(
            label: 'গতকালের ইনকাম',
            value: incomeData['yesterday']!,
          ),
          _IncomeDetailRow(
            label: 'গত 7 দিনের ইনকাম',
            value: incomeData['last7days']!,
          ),
          _IncomeDetailRow(
            label: 'গত 30 দিনের ইনকাম',
            value: incomeData['last30days']!,
          ),
        ],
      ),
    );
  }
}

class _IncomeDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _IncomeDetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: textTheme.bodyMedium?.copyWith(color: Colors.black54),
          ),
          Text(
            value,
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
