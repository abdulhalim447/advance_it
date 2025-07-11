import 'package:flutter/material.dart';
import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';

class IncomeCardScreen extends StatelessWidget {
  final String incomeType;
  final String amount;
  final String date;

  const IncomeCardScreen({
    super.key,
    this.incomeType = 'আজকের দিনের ইনকাম',
    this.amount = '80',
    this.date = '10 জুলাই 2025',
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      appBar: const CustomAppBarWidget(),
      drawer: const NavigationDrawerWidget(),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.03,
            ),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.01),

                // Income Card Container
                _buildIncomeCard(context, screenWidth, screenHeight),

                SizedBox(height: screenHeight * 0.03),

                // Back Button
                _buildBackButton(context, screenWidth),

                SizedBox(height: screenHeight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIncomeCard(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    return Container(
      //width: screenWidth * 0.9,
      width: double.infinity,
      height: screenHeight * 0.26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        child: Stack(
          children: [
            // Your actual income card image as background
            Positioned.fill(
              child: Image.asset(
                'assets/images/income_card.png',
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback to black background if image not found
                  return Container(
                    color: const Color(0xFF000000),
                    child: Center(
                      child: Text(
                        'Card Image Not Found',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Income Type Title (Top Left)
            Positioned(
              top: screenHeight * 0.025,
              left: screenWidth * 0.05,
              child: Container(
                width: screenWidth * 0.65,
                child: Text(
                  incomeType,
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    //fontFamily: 'SolaimanLipi',
                    shadows: [
                      Shadow(
                        offset: const Offset(1, 1),
                        blurRadius: 3,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

            // Date (Bottom Left)
            Positioned(
              bottom: screenHeight * 0.020,
              left: screenWidth * 0.05,
              child: Text(
                date,
                style: TextStyle(
                  fontSize: screenWidth * 0.040,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  //fontFamily: 'SolaimanLipi',
                  shadows: [
                    Shadow(
                      offset: const Offset(1, 1),
                      blurRadius: 3,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ],
                ),
              ),
            ),

            // Amount Display (Top Right) - Positioned in the yellow box area of your image
            Positioned(
              top: screenHeight * 0.080,
              right: screenWidth * 0.000,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.02,
                  vertical: screenHeight * 0.005,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.orange,
                      Colors.amber.shade500,
                      Colors.yellow,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Text(
                  " ৳ $amount",
                  style: TextStyle(
                    fontSize: screenWidth * 0.075,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    //fontFamily: 'SolaimanLipi',
                    shadows: [
                      Shadow(
                        offset: const Offset(1, 1),
                        blurRadius: 2,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context, double screenWidth) {
    return Container(
      width: screenWidth * 0.3,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.amber.shade500, Colors.yellow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_back, color: Colors.black, size: 20),
              const SizedBox(width: 8),
              Text(
                'Back',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
