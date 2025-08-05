import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';

class AkNojoreAmarChannel extends StatefulWidget {
  const AkNojoreAmarChannel({super.key});

  @override
  State<AkNojoreAmarChannel> createState() => _AkNojoreAmarChannelState();
}

class _AkNojoreAmarChannelState extends State<AkNojoreAmarChannel> {
  bool _showCustomerAccount = false;

  final List<Map<String, dynamic>> _channels = List.generate(
    10,
    (index) => ({
      'name': 'Channel ${index + 1}',
      'total': (index + 1) * 73,
      'business_account': (index + 1) * 18,
      'customer_account': (index + 1) * 55,
    }),
  );

  final List<Color> _shadowColors = [
    Colors.blue.withOpacity(0.2),
    Colors.red.withOpacity(0.2),
    Colors.purple.withOpacity(0.2),
    Colors.green.withOpacity(0.2),
    Colors.orange.withOpacity(0.2),
    Colors.pink.withOpacity(0.2),
    Colors.teal.withOpacity(0.2),
    Colors.indigo.withOpacity(0.2),
    Colors.brown.withOpacity(0.2),
    Colors.grey.withOpacity(0.2),
  ];

  Map<String, int> get _grossTotal {
    int total = 0;
    int businessAccount = 0;
    int customerAccount = 0;

    for (var channel in _channels) {
      total += (channel['total'] as int);
      businessAccount += (channel['business_account'] as int);
      customerAccount += (channel['customer_account'] as int);
    }

    return {
      'total': total,
      'business_account': businessAccount,
      'customer_account': customerAccount,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(),
      drawer: const NavigationDrawerWidget(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _channels.length,
              itemBuilder: (context, index) {
                return _buildChannelCard(_channels[index], index);
              },
            ),
            const SizedBox(height: 5),
            _buildGrossTotalCard(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildGrossTotalCard() {
    final grossTotal = _grossTotal;
    return GestureDetector(
      onTap: () {
        setState(() {
          _showCustomerAccount = !_showCustomerAccount;
        });
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Gross Total',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'মোট : ${grossTotal['total']}',
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'বিজনেস একাউন্ট : ${grossTotal['business_account']}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  if (_showCustomerAccount) ...[
                    const SizedBox(height: 10),
                    Text(
                      'কাস্টমার একাউন্ট : ${grossTotal['customer_account']}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChannelCard(Map<String, dynamic> channel, int index) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: _shadowColors[index % _shadowColors.length],
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  channel['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'মোট : ${channel['total']}',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'বিজনেস একাউন্ট : ${channel['business_account']}',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 10),
                Text(
                  'কাস্টমার একাউন্ট : ${channel['customer_account']}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
