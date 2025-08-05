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
      body: _IncomeSummaryCard(incomeData: incomeData, title: title),
    );
  }
}

class _IncomeSummaryCard extends StatelessWidget {
  final Map<String, String> incomeData;
  final String title;

  const _IncomeSummaryCard({required this.incomeData, required this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // As per core.md, colors should come from an AppColors file.
    // Using hardcoded color as a placeholder.
    const totalColor = Color(0xFFE53935);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 8),
        _buildHeadOfficeSection(),
        _buildSupportSection(),
      ],
    );
  }

  Widget _buildHeadOfficeSection() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 8,
      shadowColor: Colors.blue.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
           colors: [Colors.white, Colors.orange.shade50],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'সর্বমোট ইনকাম',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  Text(
                    incomeData['total']!,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSupportSection() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 8,
      shadowColor: Colors.orange.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
             colors: [Colors.white, Colors.blue.shade50],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _IncomeDetailRow(
                label: 'আজকের ইনকাম',
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
        ),
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
      padding: const EdgeInsets.symmetric(vertical: 2.0),
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
