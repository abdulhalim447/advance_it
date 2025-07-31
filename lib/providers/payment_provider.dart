import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier {
  int _selectedPaymentMethod = 0;

  int get selectedPaymentMethod => _selectedPaymentMethod;

  bool _termsAccepted = false;
  bool get termsAccepted => _termsAccepted;

  void setTermsAccepted(bool value) {
    _termsAccepted = value;
    notifyListeners();
  }

  void setSelectedPaymentMethod(int index) {
    _selectedPaymentMethod = index;
    notifyListeners();
  }
}
