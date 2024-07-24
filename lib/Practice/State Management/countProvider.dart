import 'package:flutter/foundation.dart';

class ProviderTutorial with ChangeNotifier {
  int _countingNumber = 100;
  int get storedCountingNumber => _countingNumber;

  void increaseCount() {
    print("Counter Increased");
    _countingNumber++;
    notifyListeners();
  }

  String _name = "Vaibhav";
  String get userName => _name;
}
