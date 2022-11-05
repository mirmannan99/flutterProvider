import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  //! holds data for the provider and the this data will be sent
  bool? isEligible;
  String? eligibilityMessage = "";

  void checkEligibility(int age) {
    if (age >= 18) {
      isEligible = true;
      eligibilityMessage = "you are eligible";
      notifyListeners(); //! notifier listeners => notifies about the new data
    } else {
      isEligible = false;
      eligibilityMessage = "you are not eligible";
      notifyListeners(); //! notifier listeners => notifies about the new data
    }
  }
}
