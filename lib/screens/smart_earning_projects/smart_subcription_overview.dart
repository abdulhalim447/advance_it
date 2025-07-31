import 'package:advance_it_ltd/providers/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/navigation_drawer_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Course Overview Screen for Smart Earning Projects
class SmartSubcriptionOverview extends StatelessWidget {
  const SmartSubcriptionOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const CustomAppBarWidget(
        showLogo: true,
        automaticallyImplyLeading: true,
      ),
      drawer: const NavigationDrawerWidget(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 80,
              ), // Add padding for the button
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  _CourseHeaderSection(),
                  SizedBox(height: 10),
                  _CourseDescriptionSection(),
                  SizedBox(height: 10),
                  _courcebuletPointSection(),
                  SizedBox(height: 3),
                  PaymentScreenCard(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: _CourseActionSection(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Course header section with title
class _CourseHeaderSection extends StatelessWidget {
  const _CourseHeaderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      child: SvgPicture.asset(
        "assets/images/smart_subscription.svg",
        fit: BoxFit.cover,
      ),
    );
  }
}

/// Course header section with gradient background
class _discountCourseHeaderSection extends StatelessWidget {
  const _discountCourseHeaderSection();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        child: Container(
          margin: const EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 10,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                AppTheme.smartSubscriptionButtonGradientStart,
                AppTheme.smartSubscriptionButtonGradientEnd,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            child: Column(
              children: [
                Text(
                  'সাবস্ক্রিপশন ফি',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                //SizedBox(height: 5),
                Text(
                  '৩৫০ টাকা',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Course description section
class _CourseDescriptionSection extends StatelessWidget {
  const _CourseDescriptionSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'স্মার্ট সাবস্ক্রিপশন সম্পর্কে বিস্তারিত',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.6,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.justify,
          ),

          Column(
            children: _desccourseBenefits
                .map(
                  (benefit) => _descBenefitItem(
                    text: benefit,
                    color: AppTheme.smartEarningCourseGradientStart,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

/// Course description section
class _courcebuletPointSection extends StatelessWidget {
  const _courcebuletPointSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'স্মার্ট সিদ্ধান্ত নিন আজই',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.6,
              fontWeight: FontWeight.bold,
            ),
          ),

          Column(
            children: _courseBenefits
                .map(
                  (benefit) => _BenefitItem(
                    text: benefit,
                    color: AppTheme.smartEarningCourseGradientStart,
                  ),
                )
                .toList(),
          ),

          _discountCourseHeaderSection(),
        ],
      ),
    );
  }
}

/// Course description section
class PaymentScreenCard extends StatelessWidget {
  const PaymentScreenCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          const SizedBox(height: 20),
          _PaymentConfirmationSection(),
        ],
      ),
    );
  }
}

/// Course action section with enrollment button
class _CourseActionSection extends StatelessWidget {
  const _CourseActionSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _GradientButton(
            text: 'অর্ডার কনফার্ম করুন',
            gradient: const LinearGradient(
              colors: [
                AppTheme.smartSubscriptionGradientStart,
                AppTheme.smartSubscriptionGradientEnd,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            onPressed: () {
              // Handle course enrollment
              Navigator.pushNamed(context, '/smart-sub-greeting');
            },
          ),
        ),
      ],
    );
  }
}

/// Reusable benefit item widget with check icon
class _BenefitItem extends StatelessWidget {
  const _BenefitItem({required this.text, this.color = Colors.black87});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Icon(Icons.check_circle, color: Colors.black, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Reusable benefit item widget with check icon
class _descBenefitItem extends StatelessWidget {
  const _descBenefitItem({required this.text, this.color = Colors.black87});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Icon(Icons.circle, color: Colors.black, size: 10),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Reusable gradient button widget
class _GradientButton extends StatelessWidget {
  const _GradientButton({
    required this.text,
    required this.gradient,
    required this.onPressed,
    this.fontSize = 16,
    this.padding,
  });

  final String text;
  final Gradient gradient;
  final VoidCallback onPressed;
  final double fontSize;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Container(
          padding:
              padding ??
              const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
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
      ],
    );
  }
}

/// Course benefits data
const List<String> _courseBenefits = [
  'আপনার হাতে এখন এমন এক সুযোগ যা হতে পারে বেকারত্ব থেকে আয়ের, সীমাবদ্ধতা থেকে সম্ভাবনার, এবং সাধারণ জীবন থেকে অসাধারণ সাফল্যের যাত্রা।',
  'মাত্র ৩৫০ টাকার একটি সাবস্ক্রিপশন,কিন্তু এর মাধ্যমে আপনি পাচ্ছেন আর্থিক স্বাধীনতা, আত্মনির্ভরতা এবং সাফল্যের সম্ভাবনায় ভরা একটি ভবিষ্যৎ।',
];

const List<String> _desccourseBenefits = [
  'পেয়ে যাবেন একটি সম্পূর্ণ ফিচারসহ অ্যাডভান্স একাউন্ট, যা দিয়ে আপনি শুরু করতে পারবেন আপনার নিজের আয় ও ক্যারিয়ারের পথচলা।',
  'আনলিমিটেড প্রোডাক্ট রিসেল করুন কোনো ইনভেস্টমেন্ট ছাড়াই। আপনার আয় নির্ভর করবে আপনার প্রচেষ্টা আর প্ল্যানিং-এর ওপর',
  'আপনার প্রতিটি এচিভমেন্ট নিয়ে আসবে অতিরিক্ত বোনাস, প্রতি বার ৫০ দিন পর্যন্ত আপনি পাবেন স্মার্ট প্রমোটার বোনাস।',
  'প্রতিটি প্রজেক্ট হলো একটি ইনকাম উৎস চাইলেই আপনি দক্ষতা, সময় এবং প্রচেষ্টার মাধ্যমে সরাসরি ২২টি প্রজেক্ট থেকে একটিভ ইনকাম শুরু করতে পারেন।',
];
