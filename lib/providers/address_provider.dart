import 'package:flutter/material.dart';
import '../data/address_data.dart';

class AddressProvider extends ChangeNotifier {
  // Selected values
  String? _selectedDivision;
  String? _selectedDistrict;
  String? _selectedUpazila;
  String? _selectedUnion;
  String? _selectedGeoType;

  // Dropdown lists
  List<String> _divisionList = [];
  List<String> _districtList = [];
  List<String> _upazilaList = [];
  List<String> _unionList = [];

  // Location details
  String _locationDetails = '';

  // Getters
  String? get selectedDivision => _selectedDivision;
  String? get selectedDistrict => _selectedDistrict;
  String? get selectedUpazila => _selectedUpazila;
  String? get selectedUnion => _selectedUnion;
  String? get selectedGeoType => _selectedGeoType;

  List<String> get divisionList => _divisionList;
  List<String> get districtList => _districtList;
  List<String> get upazilaList => _upazilaList;
  List<String> get unionList => _unionList;

  String get locationDetails => _locationDetails;

  // Initialize data
  void initializeData() {
    _divisionList = AddressData.getDivisions();
    // Ensure Dhaka division listed even if data source hasn't defined it yet
    if (!_divisionList.contains('ঢাকা')) {
      _divisionList.insert(0, 'ঢাকা');
    }
    notifyListeners();
  }

  // Set geo type
  void setGeoType(String? geoType) {
    _selectedGeoType = geoType;
    notifyListeners();
  }

  // Set division
  void setDivision(String? division) {
    if (_selectedDivision != division) {
      _selectedDivision = division;

      // Reset subsequent selections
      _selectedDistrict = null;
      _selectedUpazila = null;
      _selectedUnion = null;

      // Clear subsequent lists
      _districtList.clear();
      _upazilaList.clear();
      _unionList.clear();

      if (division != null) {
        _districtList = AddressData.getDistricts(division);
      }

      notifyListeners();
    }
  }

  // Set district
  void setDistrict(String? district) {
    if (_selectedDistrict != district) {
      _selectedDistrict = district;

      // Reset subsequent selections
      _selectedUpazila = null;
      _selectedUnion = null;

      // Clear subsequent lists
      _upazilaList.clear();
      _unionList.clear();

      if (district != null && _selectedDivision != null) {
        _upazilaList = AddressData.getUpazilas(_selectedDivision!, district);

        // If no upazilas but data already contains direct union list
        if (_upazilaList.isEmpty) {
          _unionList = AddressData.getUnions(
            _selectedDivision!,
            district,
            '', // pass empty upazila to trigger fallback
          );
        }
      }

      notifyListeners();
    }
  }

  // Set upazila
  void setUpazila(String? upazila) {
    if (_selectedUpazila != upazila) {
      _selectedUpazila = upazila;

      // Reset subsequent selection
      _selectedUnion = null;

      // Clear subsequent list
      _unionList.clear();

      if (upazila != null &&
          _selectedDivision != null &&
          _selectedDistrict != null) {
        _unionList = AddressData.getUnions(
          _selectedDivision!,
          _selectedDistrict!,
          upazila,
        );
      }

      notifyListeners();
    }
  }

  // Set union
  void setUnion(String? union) {
    if (_selectedUnion != union) {
      _selectedUnion = union;
      notifyListeners();
    }
  }

  // Set location details
  void setLocationDetails(String details) {
    _locationDetails = details;
    notifyListeners();
  }

  // Reset all data
  void resetAllData() {
    _selectedDivision = null;
    _selectedDistrict = null;
    _selectedUpazila = null;
    _selectedUnion = null;
    _selectedGeoType = null;

    _districtList.clear();
    _upazilaList.clear();
    _unionList.clear();

    _locationDetails = '';

    notifyListeners();
  }

  // Get complete address as string
  String getCompleteAddress() {
    List<String> addressParts = [];

    if (_locationDetails.isNotEmpty) {
      addressParts.add(_locationDetails);
    }

    if (_selectedUnion != null) {
      addressParts.add(_selectedUnion!);
    }

    if (_selectedUpazila != null) {
      addressParts.add(_selectedUpazila!);
    }

    if (_selectedDistrict != null) {
      addressParts.add(_selectedDistrict!);
    }

    if (_selectedDivision != null) {
      addressParts.add(_selectedDivision!);
    }

    return addressParts.join(', ');
  }

  // Validate if all required fields are selected
  bool isAddressComplete() {
    return _selectedDivision != null &&
        _selectedDistrict != null &&
        _selectedUpazila != null &&
        _selectedUnion != null &&
        _locationDetails.isNotEmpty;
  }

  // Save address data (placeholder for API call)
  Future<bool> saveAddress() async {
    try {
      // Here you would typically make an API call to save the address
      // For now, we'll just simulate a delay
      await Future.delayed(const Duration(seconds: 1));

      // Return true if successful
      return true;
    } catch (e) {
      // Return false if there's an error
      return false;
    }
  }
}
