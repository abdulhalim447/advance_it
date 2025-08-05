import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAffiliateChannelList extends StatefulWidget {
  const MyAffiliateChannelList({super.key});

  @override
  State<MyAffiliateChannelList> createState() => _MyAffiliateChannelListState();
}

class _MyAffiliateChannelListState extends State<MyAffiliateChannelList> {
  final List<Map<String, String>> _allAffiliates = [
    {'name': 'Ashraful', 'phone': '01604301596', 'type': 'অ্যাডভান্স লিডার'},
    {'name': 'Md.Naeem', 'phone': '01614815092', 'type': 'অ্যাডভান্স লিডার'},
    {'name': 'Hanif', 'phone': '01973914016', 'type': 'অ্যাডভান্স এসোসিয়েট'},
    {'name': 'Karim', 'phone': '01973914016', 'type': 'অ্যাডভান্স এসোসিয়েট'},
    {'name': 'Rahim', 'phone': '01973914016', 'type': 'অ্যাডভান্স এসোসিয়েট'},
    {'name': 'Sabbir', 'phone': '01712345678', 'type': 'অ্যাডভান্স এসোসিয়েট'},
    {'name': 'Mizan', 'phone': '01823456789', 'type': 'অ্যাডভান্স লিডার'},
    {'name': 'Rafi', 'phone': '01934567890', 'type': 'অ্যাডভান্স লিডার'},
    {'name': 'Tania', 'phone': '01645678901', 'type': 'অ্যাডভান্স এসোসিয়েট'},
    {'name': 'Shuvo', 'phone': '01756789012', 'type': 'অ্যাডভান্স এসোসিয়েট'},
    {'name': 'Lima', 'phone': '01867890123', 'type': 'অ্যাডভান্স এসোসিয়েট'},
  ];

  final List<Color> _shadowColors = [
    Colors.blue.withOpacity(0.2),
    Colors.red.withOpacity(0.2),
    Colors.purple.withOpacity(0.2),
  ];

  List<Map<String, String>> _foundAffiliates = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _foundAffiliates = _allAffiliates;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, String>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allAffiliates;
    } else {
      results = _allAffiliates
          .where(
            (user) =>
                user["name"]!.toLowerCase().contains(
                  enteredKeyword.toLowerCase(),
                ) ||
                user["phone"]!.contains(enteredKeyword),
          )
          .toList();
    }

    setState(() {
      _foundAffiliates = results;
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(),
      drawer: const NavigationDrawerWidget(),
      body: Column(
        children: [
          const SizedBox(height: 10),
          _buildSearchField(),
          const SizedBox(height: 10),
          Expanded(
            child: _foundAffiliates.isNotEmpty
                ? ListView.builder(
                    itemCount: _foundAffiliates.length,
                    itemBuilder: (context, index) =>
                        _buildAffiliateCard(_foundAffiliates[index], index),
                  )
                : const Text(
                    'No results found',
                    style: TextStyle(fontSize: 24),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 5),
      child: TextField(
        controller: _searchController,
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          labelText: 'Advance Search',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.amber),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.amber),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.amber, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildAffiliateCard(Map<String, String> affiliate, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  affiliate['name']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    affiliate['phone']!,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  affiliate['type']!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ElevatedButton.icon(
                  onPressed: () => _makePhoneCall(affiliate['phone']!),
                  icon: const Icon(Icons.call, color: Colors.white),
                  label: const Text(
                    'কল করুন',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
