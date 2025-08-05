import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class _Seller {
  const _Seller({
    required this.name,
    required this.phone,
    required this.sales,
    required this.shadowColor,
  });

  final String name;
  final String phone;
  final int sales;
  final Color shadowColor;
}

class CourseSellerListScreen extends StatelessWidget {
  const CourseSellerListScreen({super.key});

  static final _sellers = [
    _Seller(
      name: 'Md. Shahin',
      phone: '01780998486',
      sales: 5,
      shadowColor: Colors.purple.withOpacity(0.4),
    ),
    _Seller(
      name: 'Rahim Miya',
      phone: '01880998487',
      sales: 8,
      shadowColor: Colors.blue.withOpacity(0.4),
    ),
    _Seller(
      name: 'Karim Sheikh',
      phone: '01980998488',
      sales: 3,
      shadowColor: Colors.green.withOpacity(0.4),
    ),
    _Seller(
      name: 'Jamal Bhuiyan',
      phone: '01580998489',
      sales: 12,
      shadowColor: Colors.orange.withOpacity(0.4),
    ),
    _Seller(
      name: 'Kamal Hasan',
      phone: '01680998490',
      sales: 2,
      shadowColor: Colors.red.withOpacity(0.4),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(),
      drawer: NavigationDrawerWidget(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _sellers.length,
        itemBuilder: (context, index) {
          final seller = _sellers[index];
          return _SellerInfoCard(seller: seller);
        },
      ),
    );
  }
}

class _SellerInfoCard extends StatelessWidget {
  const _SellerInfoCard({required this.seller});

  final _Seller seller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: seller.shadowColor,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Lottie.asset('assets/lottie/trophy.json', height: 50),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  seller.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  seller.phone,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 4),
                Text(
                  'কোর্স সেলঃ ${seller.sales}টি',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
