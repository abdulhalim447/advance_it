import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../../widgets/navigation_drawer_widget.dart';

class AdvanceNitimalaScreen extends StatefulWidget {
  const AdvanceNitimalaScreen({super.key});

  @override
  State<AdvanceNitimalaScreen> createState() => _AdvanceNitimalaScreenState();
}

class _AdvanceNitimalaScreenState extends State<AdvanceNitimalaScreen> {
  final String _pledgeText =
      """অ্যাডভান্স গ্রাহক হিসেবে যুক্ত হওয়ার আগে অনুগ্রহ করে নিচের নীতিমালা ও শর্তাবলীর প্রতি সতর্ক দৃষ্টি দিন। এই শর্তসমূহের সাথে আপনি সজ্ঞানে ও স্বেচ্ছায় একমত হয়ে তা মেনে চলতে সম্মত হচ্ছেন।

1. একজন ব্যক্তি কেবলমাত্র একবার অ্যাডভান্স গ্রাহক হতে পারবেন। একাধিক অ্যাকাউন্ট তৈরি বা পরিচালনার চেষ্টা, গেম্বলিং বা অসৎ পন্থা গ্রহণের ক্ষেত্রে সংশ্লিষ্ট সব অ্যাকাউন্ট বাতিলযোগ্য।


2. স্মার্ট আর্নিং কোর্স বা সাবস্ক্রিপশন ফি সম্পূর্ণরূপে অফেরতযোগ্য।


3. কোম্পানির স্বার্থের পরিপন্থী কোনো কার্যকলাপে অংশগ্রহণ করলে বা তার চেষ্টা করলে, সংশ্লিষ্ট অ্যাকাউন্ট বাতিল করার পূর্ণ অধিকার কোম্পানির রয়েছে।


4. কোনো অ্যাডভান্স গ্রাহক অন্য কাউকে গেম্বলিং বা অবৈধ সাইটে আমন্ত্রণ জানালে এবং তার প্রমাণ পাওয়া গেলে, ঐ এসোসিয়েটের অ্যাকাউন্ট বাতিলযোগ্য।


5. ইচ্ছাকৃতভাবে অন্য গ্রাহকদেরকে বিভ্রান্ত করার জন্য নেগেটিভ প্রচারণা চালালে, কোম্পানি প্রয়োজনীয় ব্যবস্থা গ্রহণ করতে পারবে।


6. কারো সঙ্গে প্রতারণামূলক আচরণ বা অসাধু পন্থা অবলম্বন করলে, কোম্পানি যথাযথ পদক্ষেপ নিতে পারবে।

7. কোনো অ্যাডভান্স গ্রাহক যদি নারী গ্রাহকদের অপ্রয়োজনীয়, ব্যক্তিগত বা বিরক্তিকর বার্তা প্রেরণ করেন, যা তাদের অস্বস্তিকর বা হয়রানির শামিল হয়, এবং এর লিখিত/ডিজিটাল প্রমাণ কোম্পানির কাছে পৌঁছে—তাহলে কোম্পানি উক্ত ব্যক্তির অ্যাকাউন্ট বাতিলসহ প্রয়োজনীয় আইনানুগ ব্যবস্থা গ্রহণের অধিকার রাখে।

8. কোনো অ্যাডভান্স গ্রাহক যদি তার অধীনস্থ গ্রাহকদের যথাযথ সহায়তা না করেন এবং অভিযোগ প্রমাণিত হয়, তাহলে কোম্পানি সেই গ্রাহক কে সক্রিয় লিডারের অধীনে স্থানান্তর করতে পারবেন।


9. অ্যাডভান্স গ্রাহক হওয়ার জন্য ন্যূনতম বয়স হতে হবে ১৮ বছর।

10. একজন গ্রাহক যদি ভুয়া নাম, ভুয়া ছবি বা বিভ্রান্তিকর পরিচয় ব্যবহার করেন এবং এর মাধ্যমে কোম্পানির ভাবমূর্তি ক্ষুণ্ন করেন বা অন্যদের বিভ্রান্ত করেন, তাহলে তার অ্যাকাউন্ট তাৎক্ষণিকভাবে বাতিলযোগ্য এবং প্রয়োজনে আইনানুগ ব্যবস্থা নেওয়া হবে।

11. পাসওয়ার্ড বা ওটিপি শেয়ার না করা গ্রাহকের নিজ দায়িত্ব। দুর্বল নিরাপত্তা ব্যবস্থার জন্য অ্যাকাউন্ট ক্ষতিগ্রস্ত হলে তার দায় গ্রাহকের। কোম্পানি কখনোই এসব তথ্য জানতে চাইবে না।


12. পেমেন্ট মেথডে ভুল তথ্য প্রদান করে টাকা অন্যত্র পাঠালে তার সম্পূর্ণ দায় গ্রাহকের ওপর বর্তাবে।


13. কোম্পানি যে কোনো সময় তার নীতিমালা, কার্যপ্রণালী, শর্তাবলী এবং বিপণন পরিকল্পনা পরিবর্তন, পরিবর্ধন বা পরিমার্জন করার পূর্ণ অধিকার সংরক্ষণ করে।""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: const CustomAppBarWidget(),
      drawer: const NavigationDrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              _buildBanner(),
              _buildPledgeContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/advance_nitimala_banner.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPledgeContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'অ্যাডভান্স নীতিমালা',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          _buildPledgeCard(),
        ],
      ),
    );
  }

  Widget _buildPledgeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        _pledgeText,
        style: const TextStyle(
          fontSize: 16,
          height: 1.6,
          color: Color(0xFF333333),
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
