import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/navigation_drawer_widget.dart';
import 'add_payment_method.dart';
import 'widgets/payment_method_dialog.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  // Sample payment methods - in a real app, these would come from an API or database
  final List<Map<String, dynamic>> _paymentMethods = [
    {
      'type': 'Apple ID',
      'icon': Icons.apple,
      'details': 'Balance: PKR2,6000',
      'isApple': true,
    },
    {
      'type': 'Master Card',
      'icon': Icons.credit_card,
      'details': '****6356',
      'isApple': false,
    },
    {
      'type': 'Visa',
      'icon': Icons.credit_card,
      'details': '****6445',
      'isApple': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: const CustomAppBarWidget(title: 'Payment', showLogo: false),
      drawer: const NavigationDrawerWidget(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _paymentMethods.isEmpty
                  ? _buildEmptyState()
                  : _buildPaymentMethodsList(),
            ),
            _buildAddPaymentButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.payment_outlined, size: 80, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            'No Payment Methods',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add a payment method to get started',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodsList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _paymentMethods.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final method = _paymentMethods[index];
        return _buildPaymentMethodCard(method);
      },
    );
  }

  Widget _buildPaymentMethodCard(Map<String, dynamic> method) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: method['isApple']
            ? Icon(method['icon'], size: 36, color: Colors.black)
            : Icon(
                method['icon'],
                size: 36,
                color: method['type'] == 'Master Card'
                    ? Colors.orange
                    : Colors.blue,
              ),
        title: Text(
          method['type'],
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          method['details'],
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.chevron_right, color: Colors.grey),
          onPressed: () => _showRemoveDialog(method),
        ),
      ),
    );
  }

  Widget _buildAddPaymentButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPaymentMethod()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black87,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text(
          'Add Payment Method',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _showRemoveDialog(Map<String, dynamic> method) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PaymentMethodDialog(
          methodName: method['type'],
          onCancel: () {
            Navigator.of(context).pop();
          },
          onRemove: () {
            setState(() {
              _paymentMethods.remove(method);
            });
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${method['type']} removed successfully'),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
              ),
            );
          },
        );
      },
    );
  }
}
