import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/payment_provider.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/navigation_drawer_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PaymentProvider(),
      child: Scaffold(
        appBar: CustomAppBarWidget(showLogo: true),
        drawer: const NavigationDrawerWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  _PaymentDetailsCard(),
                  const SizedBox(height: 10),
                  Consumer<PaymentProvider>(
                    builder: (context, provider, child) {
                      return _PaymentMethodSelector(
                        selectedIndex: provider.selectedPaymentMethod,
                        onChanged: (index) {
                          provider.setSelectedPaymentMethod(index);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 50),
                  _PaymentConfirmationSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PaymentDetailsCard extends StatelessWidget {
  const _PaymentDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> paymentDetails = [
      {
        'label': 'কোর্স এর নাম',
        'value': 'স্মার্ট আর্নিং কোর্স',
        'color': Colors.blue.shade100,
      },
      {'label': 'কোর্স ফি', 'value': '১৯৫০', 'color': Colors.purple.shade100},
      {'label': 'সর্বমোট সেশন', 'value': '১০', 'color': Colors.orange.shade100},
      {'label': 'মেয়াদ', 'value': 'আজীবন', 'color': Colors.green.shade100},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'কোর্স ক্রয়ের পদ্ধতি',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ...paymentDetails.map(
          (detail) => _PaymentDetailRow(
            label: detail['label'],
            value: detail['value'],
            color: detail['color'],
          ),
        ),
      ],
    );
  }
}

class _PaymentDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _PaymentDetailRow({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentMethodSelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const _PaymentMethodSelector({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'পেমেন্ট মেথড সিলেক্ট করুন',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 16),
        _PaymentMethodOption(
          title: 'বিকাশ',
          imagePath: 'assets/icon/bkash_payment_logo.png',
          isSelected: selectedIndex == 0,
          onTap: () => onChanged(0),
        ),
        const SizedBox(height: 16),
        _PaymentMethodOption(
          title: 'অ্যাডভান্স পয়েন্ট',
          imagePath: 'assets/icons/advance_point_add.png',
          color: Colors.amber,
          isSelected: selectedIndex == 1,
          onTap: () => onChanged(1),
        ),
      ],
    );
  }
}

class _PaymentMethodOption extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? color;

  _PaymentMethodOption({
    super.key,
    required this.title,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.amber : Colors.grey.shade200,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Radio<bool>(
              value: isSelected,
              groupValue: true,
              onChanged: (value) => onTap(),
              activeColor: Colors.amber,
            ),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const Spacer(),
            Image.asset(imagePath, height: 38, color: color),
          ],
        ),
      ),
    );
  }
}

class _PaymentConfirmationSection extends StatelessWidget {
  const _PaymentConfirmationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PaymentProvider>(context);
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: provider.termsAccepted,
              onChanged: (value) {
                provider.setTermsAccepted(value ?? false);
              },
              activeColor: Colors.amber,
            ),
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'আমি এই প্ল্যাটফর্ম ব্যবহারের '),
                    TextSpan(
                      text: 'শর্তাবলী',

                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.amber,
                      ),
                    ),
                    TextSpan(text: ' ও '),
                    TextSpan(
                      text: 'গোপনীয়তা নীতির',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.amber,
                      ),
                    ),
                    TextSpan(text: ' ব্যাপারে সম্মতি দিচ্ছি'),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/greeting-confirm');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 12),
              fixedSize: const Size(double.maxFinite, 50),
            ),
            child: Text(
              'অর্ডার কনফার্ম করুন',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
