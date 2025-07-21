import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';
import 'package:advance_it_ltd/screens/income_summary/income_card_screen.dart';
import 'package:flutter/material.dart';

class IncomeSummary extends StatelessWidget {
  const IncomeSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(),
      drawer: const NavigationDrawerWidget(),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Title
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 5),
              child: const Text(
                'আমার ইনকাম সামারি',

                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                  //fontFamily: 'SolaimanLipi',
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Income Summary Cards
            _buildIncomeSummaryCard(
              icon: 'assets/icons/incomesummarry.png',
              title: 'আজকের দিনের ইনকাম',
              gradientColors: [Colors.white, Colors.amber.shade50],
              shadowColor: Colors.amber.withOpacity(0.5),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IncomeCardScreen(
                      incomeType: 'আজকের দিনের ইনকাম',
                      amount: '1200.10',
                      date: '16-07-2025',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),

            _buildIncomeSummaryCard(
              icon: 'assets/icons/incomesummarry.png',
              title: 'গতকালের ইনকাম',
              gradientColors: [Colors.white, Colors.blue.shade50],
              shadowColor: Colors.blue.withOpacity(0.3),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IncomeCardScreen(
                      incomeType: 'গতকালের ইনকাম',
                      amount: '1500.20',
                      date: '16-07-2025',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),

            _buildIncomeSummaryCard(
              icon: 'assets/icons/incomesummarry.png',
              title: 'গত ৭ দিনের ইনকাম',
              gradientColors: [Colors.white, Colors.orange.shade50],
              shadowColor: Colors.orange.withOpacity(0.3),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IncomeCardScreen(
                      incomeType: 'গত ৭ দিনের ইনকাম',
                      amount: '7500.30',
                      date: '16-07-2025',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),

            _buildIncomeSummaryCard(
              icon: 'assets/icons/incomesummarry.png',
              title: 'গত ৩০ দিনের ইনকাম',
              gradientColors: [Colors.white, Colors.green.shade50],
              shadowColor: Colors.green.withOpacity(0.3),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IncomeCardScreen(
                      incomeType: 'গত ৩০ দিনের ইনকাম',
                      amount: '25000.40',
                      date: '16-07-2025',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),

            _buildIncomeSummaryCard(
              icon: 'assets/icons/incomesummarry.png',
              title: 'এখন পর্যন্ত সর্বমোট ইনকাম',
              gradientColors: [Colors.white, Colors.amber.shade50],
              shadowColor: Colors.amber.withOpacity(0.5),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IncomeCardScreen(
                      incomeType: ' এখন পর্যন্ত সর্বমোট ইনকাম',
                      amount: '75000.50',
                      date: '16-07-2025',
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildIncomeSummaryCard({
    required String icon,
    required String title,
    required List<Color> gradientColors,
    required Color shadowColor,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 8.0),
      elevation: 8,
      shadowColor: shadowColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onTap,
                        child: Image.asset(
                          icon,
                          color: Colors.amber,
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
