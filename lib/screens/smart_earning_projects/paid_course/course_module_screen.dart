import 'package:advance_it_ltd/screens/smart_earning_projects/paid_course/course_titles_screen.dart';
import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CourseModule {
  final String title;
  final double percentage;
  final String imageUrl;
  final List<Map<String, String>> videos;

  CourseModule({
    required this.title,
    required this.percentage,
    required this.imageUrl,
    required this.videos,
  });
}

class CourseModuleScreen extends StatelessWidget {
  final List<CourseModule> courseModules = [
    CourseModule(
      title: "অ্যাডভান্স প্লাটফর্ম বিস্তারিত",
      percentage: 1.0,
      imageUrl: "assets/images/app_banner.jpg",
      videos: [
        {
          'title': 'অ্যাডভান্স প্লাটফর্ম বিস্তারিত জানুন',
          'youtubeLink': 'https://youtu.be/gVfZjfcwlFY',
        },
      ],
    ),
    CourseModule(
      title: "এক্টিভ ইনকাম ট্রেনিং",
      percentage: 1.0,
      imageUrl: "assets/images/app_banner.jpg",
      videos: [
        {
          'title': 'এক্টিভ ইনকাম পার্ট - ১',
          'youtubeLink': 'https://youtu.be/1a2RzVsenS4',
        },
      ],
    ),
    CourseModule(
      title: "ডিজিটাল মার্কেটিং",
      percentage: 0.0,
      imageUrl: "assets/images/app_banner.jpg",
      videos: [
        {
          'title': 'ডিজিটাল মার্কেটিং রিসেলিং পার্ট - ১',
          'youtubeLink': 'https://youtu.be/DT6kDXR6YCs',
        },
        {
          'title': 'ডিজিটাল মার্কেটিং রিসেলিং পার্ট - ২',
          'youtubeLink': 'https://youtu.be/k-Nr36QDddk',
        },
        {
          'title': 'ডিজিটাল মার্কেটিং রিসেলিং পার্ট - ৩',
          'youtubeLink': 'https://youtu.be/mqDUFBX9VXQ',
        },
      ],
    ),
    CourseModule(
      title: "এফিলিয়েট মার্কেটিং",
      percentage: 1.0,
      imageUrl: "assets/images/app_banner.jpg",
      videos: [],
    ),
    CourseModule(
      title: "প্যাসিভ ইনকাম ট্রেনিং",
      percentage: 0.5,
      imageUrl: "assets/images/app_banner.jpg",
      videos: [],
    ),
    CourseModule(
      title: "লিডারশীপ ক্যারিয়ার ট্রেনিং",
      percentage: 0.0,
      imageUrl: "assets/images/app_banner.jpg",
      videos: [],
    ),
    CourseModule(
      title: "মাইন্ডসেট, গোলসেট ট্রেনিং",
      percentage: 0.0,
      imageUrl: "assets/images/app_banner.jpg",
      videos: [],
    ),
    CourseModule(
      title: "Ai বেসিক ট্রেনিং",
      percentage: 1.0,
      imageUrl: "assets/images/app_banner.jpg",
      videos: [],
    ),
    CourseModule(
      title: "বেসিক ডিজাইন",
      percentage: 0.0,
      imageUrl: "assets/images/app_banner.jpg",
      videos: [],
    ),
    CourseModule(
      title: "বেসিক ভিডিও এডিটিং",
      percentage: 0.0,
      imageUrl: "assets/images/app_banner.jpg",
      videos: [],
    ),
    CourseModule(
      title: "বেসিক ইউটিউবিং",
      percentage: 0.0,
      imageUrl: "assets/images/app_banner.jpg",
      videos: [],
    ),
    CourseModule(
      title: "লিডারশীপ ই-বুক",
      percentage: 0.0,
      imageUrl: "assets/images/app_banner.jpg",
      videos: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(),
      drawer: NavigationDrawerWidget(),
      body: ListView.builder(
        itemCount: courseModules.length,
        itemBuilder: (context, index) {
          final module = courseModules[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseTitlesScreen(
                    title: module.title,
                    courseData: module.videos,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.08),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            module.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text("ভিডিও দেখুন"),
                          const SizedBox(height: 10),
                          LinearPercentIndicator(
                            padding: const EdgeInsets.only(right: 50),
                            lineHeight: 12.0,
                            percent: module.percentage,
                            backgroundColor: Colors.grey[300],
                            progressColor: Colors.amber,
                            center: Text(
                              "${(module.percentage * 100).toStringAsFixed(0)}%",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 8,
                              ),
                            ),
                            barRadius: const Radius.circular(4),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(module.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
