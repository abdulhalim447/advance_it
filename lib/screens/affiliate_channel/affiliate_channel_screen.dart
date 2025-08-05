import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import '../../widgets/navigation_drawer_widget.dart';

class AffiliateChannelScreen extends StatelessWidget {
  static const String routeName = '/affiliate-channel';

  final List<Map<String, dynamic>> reportSections = [

        {
      'title': 'এক্সেস চ্যানেল',
      'icon': Icons.phone_android,
      'iconColor': Colors.purple,
      'route': '/amar-access-channel',
    },
    {
      'title': 'অ্যাডভান্স চ্যানেল',
      'icon': Icons.business,
      'iconColor': Colors.orange,
      'route': '/amar_advance_channel',
    },
    {
      'title': ' অ্যাডভান্স এসোসিয়েট চ্যানেল',
      'icon': Icons.business,
      'iconColor': Colors.orange,
      'route': '/amar_advance_channel',
    },
    {
      'title': ' অ্যাডভান্স উদ্যোক্তা চ্যানেল',
      'icon': Icons.business,
      'iconColor': Colors.orange,
      'route': '/amar_advance_channel',
    },
    {
      'title': ' লিডারশীপ চ্যানেল',
      'icon': Icons.subscriptions,
      'iconColor': Colors.green,
      'route': '/my_leadership_channel',
    },
    // {
    //   'title': 'আমার এফিলিয়েট চ্যানেল',
    //   'icon': Icons.school,
    //   'iconColor': Colors.blue,
    //   'route': '/my_affiliate_channel',
    // },



    {
      'title': 'সকল চ্যানেল',
      'icon': Icons.phone_android,
      'iconColor': Colors.amber,
      'route': '/ak-nojore-amar-channel',
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
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.center,
              child: Text(
                'এফিলিয়েট চ্যানেল',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 15),
            ...reportSections
                .map(
                  (section) => IncomeReportCard(
                    title: section['title'],
                    icon: section['icon'],
                    iconColor: section['iconColor'],
                    onTap: () => Navigator.pushNamed(context, section['route']),
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
      margin: const EdgeInsets.only(bottom: 10),
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
