import 'package:advance_it_ltd/widgets/custom_app_bar_widget.dart';
import 'package:advance_it_ltd/widgets/primary_button.dart';
import 'package:advance_it_ltd/providers/address_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/navigation_drawer_widget.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize address data when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final addressProvider = Provider.of<AddressProvider>(
        context,
        listen: false,
      );
      addressProvider.initializeData();
    });
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  // Method to handle address saving
  void _saveAddress(
    BuildContext context,
    AddressProvider addressProvider,
  ) async {
    // Show loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    // Save address
    final success = await addressProvider.saveAddress();

    // Hide loading
    Navigator.of(context).pop();

    // Show result
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success
              ? 'ঠিকানা তথ্য সফলভাবে সংরক্ষণ করা হয়েছে'
              : 'ঠিকানা সংরক্ষণে সমস্যা হয়েছে',
        ),
        backgroundColor: success ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const CustomAppBarWidget(),
      drawer: const NavigationDrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header section (gradient header + completion bar overlay)
            const SizedBox(height: 5),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                const ProfileHeaderWidget(
                  name: 'ADVANCE IT',
                  isVerified: false,
                ),
                const Positioned(
                  bottom: -0,
                  left: 0,
                  right: 0,
                  child: ProfileCompletionBarWidget(percentage: 60),
                ),
              ],
            ),

            // Add space to account for the overlapping buttons
            const SizedBox(height: 25),

            // Address Information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ঠিকানা তথ্য',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Geo Type Dropdown
                  Consumer<AddressProvider>(
                    builder: (context, addressProvider, child) {
                      return ProfileDropdownWidget(
                        hintText: 'জিও লোকেশন নির্বাচন করুন...',
                        items: ['শহর', 'গ্রাম', 'অর্ধশহর'],
                        value: addressProvider.selectedGeoType,
                        onChanged: (value) {
                          addressProvider.setGeoType(value);
                        },
                        boxShadowColor: Colors.blue,
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  // Division Dropdown
                  Consumer<AddressProvider>(
                    builder: (context, addressProvider, child) {
                      return ProfileDropdownWidget(
                        hintText: 'বিভাগ নির্বাচন করুন...',
                        items: addressProvider.divisionList,
                        value: addressProvider.selectedDivision,
                        onChanged: (value) {
                          addressProvider.setDivision(value);
                        },
                        boxShadowColor: Colors.purple,
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  // District Dropdown
                  Consumer<AddressProvider>(
                    builder: (context, addressProvider, child) {
                      return ProfileDropdownWidget(
                        hintText: 'জেলা নির্বাচন করুন...',
                        items: addressProvider.districtList,
                        value: addressProvider.selectedDistrict,
                        onChanged: addressProvider.selectedDivision == null
                            ? null
                            : (value) {
                                addressProvider.setDistrict(value);
                              },
                        boxShadowColor: Colors.green,
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  // Upazila/Thana Dropdown
                  Consumer<AddressProvider>(
                    builder: (context, addressProvider, child) {
                      return ProfileDropdownWidget(
                        hintText: 'উপজেলা/থানা নির্বাচন করুন...',
                        items: addressProvider.upazilaList,
                        value: addressProvider.selectedUpazila,
                        onChanged: addressProvider.selectedDistrict == null
                            ? null
                            : (value) {
                                addressProvider.setUpazila(value);
                              },
                        boxShadowColor: Colors.orange,
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  // Union/Word Dropdown
                  Consumer<AddressProvider>(
                    builder: (context, addressProvider, child) {
                      return ProfileDropdownWidget(
                        hintText: 'ইউনিয়ন নির্বাচন করুন...',
                        items: addressProvider.unionList,
                        value: addressProvider.selectedUnion,
                        onChanged: addressProvider.selectedUpazila == null
                            ? null
                            : (value) {
                                addressProvider.setUnion(value);
                              },
                        boxShadowColor: Colors.teal,
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  // Location TextField
                  Consumer<AddressProvider>(
                    builder: (context, addressProvider, child) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange.withOpacity(0.7),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _locationController,
                          decoration: InputDecoration(
                            hintText: 'বিস্তারিত ঠিকানা লিখুন',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.7),
                              fontSize: 16,
                            ),
                          ),
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          onChanged: (value) {
                            addressProvider.setLocationDetails(value);
                          },
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // Complete Address Preview
                  Consumer<AddressProvider>(
                    builder: (context, addressProvider, child) {
                      final completeAddress = addressProvider
                          .getCompleteAddress();
                      if (completeAddress.isNotEmpty) {
                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blue.shade200),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'সম্পূর্ণ ঠিকানা:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade800,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                completeAddress,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue.shade700,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),

                  const SizedBox(height: 20),

                  // Action Buttons
                  Consumer<AddressProvider>(
                    builder: (context, addressProvider, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Reset Button
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              child: OutlinedButton(
                                onPressed: () {
                                  addressProvider.resetAllData();
                                  _locationController.clear();
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  side: BorderSide(color: Colors.orange),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'রিসেট',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Save Button
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.only(left: 8),
                              child: PrimaryButton(
                                text: 'তথ্য সংরক্ষণ করুন',
                                onPressed: addressProvider.isAddressComplete()
                                    ? () {
                                        _saveAddress(context, addressProvider);
                                      }
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ProfileHeaderWidget extends StatelessWidget {
  final String name;
  final bool isVerified;

  const ProfileHeaderWidget({
    super.key,
    required this.name,
    required this.isVerified,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.amber.shade500, Colors.yellow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          // Profile Image
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.red, Colors.amber],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                    color: Color(0xFFFED700),
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Name
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Verification Status
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Profile Not Completed',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}

class ProfileCompletionBarWidget extends StatelessWidget {
  final int percentage;

  const ProfileCompletionBarWidget({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: Stack(
                children: [
                  // Progress indicator
                  FractionallySizedBox(
                    widthFactor: percentage / 100,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: percentage == 100
                              ? [Colors.green.shade400, Colors.green.shade600]
                              : [Colors.blue.shade400, Colors.blue.shade600],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '$percentage%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileDropdownWidget extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final Function(String?)? onChanged;
  final String? value;
  final Color boxShadowColor;

  const ProfileDropdownWidget({
    super.key,
    required this.hintText,
    required this.items,
    this.onChanged,
    this.value,
    this.boxShadowColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: boxShadowColor.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(
            hintText,
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),
          value: value,
          icon: Icon(Icons.arrow_drop_down, color: Colors.grey[800]),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.black, fontSize: 16),
          dropdownColor: Colors.white,
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
