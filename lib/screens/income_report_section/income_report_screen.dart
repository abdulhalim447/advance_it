import 'package:advance_it_ltd/screens/income_report_section/income_report_details.dart';
import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import '../../widgets/navigation_drawer_widget.dart';

class IncomeReportScreen extends StatelessWidget {
  static const String routeName = '/income-report';

  final List<Map<String, dynamic>> reportSections = [
    {
      'title': 'স্মার্ট আর্নিং কোর্স',
      'icon': Icons.school,
      'iconColor': Colors.blue,
      'route': '/smart-earning-course',
      'data': {
        'total': '2550.00', // 150.00 + 200.00 + 700.00 + 1500.00
        'today': '150.00',
        'yesterday': '200.00',
        'last7days': '700.00',
        'last30days': '1500.00',
      },
    },
    {
      'title': 'স্মার্ট সাবস্ক্রিপশন',
      'icon': Icons.subscriptions,
      'iconColor': Colors.green,
      'route': '/smart-subscription',
      'data': {
        'total': '4250.00', // 250.00 + 300.00 + 1200.00 + 2500.00
        'today': '250.00',
        'yesterday': '300.00',
        'last7days': '1200.00',
        'last30days': '2500.00',
      },
    },
    {
      'title': 'অ্যাডভান্স উদ্যোক্তা',
      'icon': Icons.business,
      'iconColor': Colors.orange,
      'route': '/advance-entrepreneur',
      'data': {
        'total': '950.00', // 50.00 + 100.00 + 300.00 + 500.00
        'today': '50.00',
        'yesterday': '100.00',
        'last7days': '300.00',
        'last30days': '500.00',
      },
    },
    {
      'title': 'মোবাইল রিচার্জ',
      'icon': Icons.phone_android,
      'iconColor': Colors.purple,
      'route': '/mobile-recharge',
      'data': {
        'total': '8550.00', // 450.00 + 600.00 + 2500.00 + 5000.00
        'today': '450.00',
        'yesterday': '600.00',
        'last7days': '2500.00',
        'last30days': '5000.00',
      },
    },
    {
      'title': 'ড্রাইভ প্যাক',
      'icon': Icons.directions_car,
      'iconColor': Colors.red,
      'route': '/drive-pack',
      'data': {
        'total': '2050.00', // 100.00 + 150.00 + 600.00 + 1200.00
        'today': '100.00',
        'yesterday': '150.00',
        'last7days': '600.00',
        'last30days': '1200.00',
      },
    },
    {
      'title': 'রিসেলার শপ',
      'icon': Icons.shopping_bag,
      'iconColor': Colors.brown,
      'route': '/reseller-shop',
      'data': {
        'total': '11650.00', // 750.00 + 900.00 + 4000.00 + 8000.00
        'today': '750.00',
        'yesterday': '900.00',
        'last7days': '4000.00',
        'last30days': '8000.00',
      },
    },
    {
      'title': 'ফ্রাইডে মার্ট',
      'icon': Icons.local_grocery_store,
      'iconColor': Colors.teal,
      'route': '/friday-market',
      'data': {
        'total': '530.00', // 30.00 + 50.00 + 150.00 + 300.00
        'today': '30.00',
        'yesterday': '50.00',
        'last7days': '150.00',
        'last30days': '300.00',
      },
    },
    {
      'title': 'লিডারশীপ',
      'icon': Icons.star_rate,
      'iconColor': Colors.amber,
      'route': '/leadership',
      'data': {
        'total': '17200.00', // 1000.00 + 1200.00 + 5000.00 + 10000.00
        'today': '1000.00',
        'yesterday': '1200.00',
        'last7days': '5000.00',
        'last30days': '10000.00',
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const CustomAppBarWidget(),
      drawer: const NavigationDrawerWidget(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'আয় রিপোর্ট',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            ...reportSections
                .map(
                  (section) => IncomeReportCard(
                    title: section['title'],
                    icon: section['icon'],
                    iconColor: section['iconColor'],
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IncomeReportDetailsScreen(
                          title: section['title'],
                          incomeData: section['data'],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}

class IncomeReportCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  const IncomeReportCard({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: iconColor.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                //Icon(icon, color: iconColor, size: 32),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
