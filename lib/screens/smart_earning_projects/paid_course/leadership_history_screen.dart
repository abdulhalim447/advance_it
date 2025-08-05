import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LeadershipHistoryScreen extends StatelessWidget {
  const LeadershipHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBarWidget(),
      drawer: NavigationDrawerWidget(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 3, // Example count
        itemBuilder: (context, index) {
          return _buildHistoryCard(
            date: index == 2 ? '2023-09-30' : '2023-03-12',
          );
        },
      ),
    );
  }

  Widget _buildHistoryCard({required String date}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: Colors.amber, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Lottie.asset('assets/lottie/trophy.json', height: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'এসোসিয়েট লিডারশীপ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'অর্জনের তারিখ : $date',
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      text: 'Leadership Fund Validity : ',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      children: [
                        TextSpan(
                          text: 'Expired',
                          style: TextStyle(
                            color: Colors.red.shade400,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.close, color: Colors.red.shade400, size: 24),
          ],
        ),
      ),
    );
  }
}
