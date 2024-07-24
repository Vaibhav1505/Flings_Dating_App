import 'package:flutter/foundation.dart';

class MulticlassProvider with ChangeNotifier {
  double _value = 1.25;
  double get value => _value;

  void incDoubleValue() {
    _value++;
    notifyListeners();
  }

  String _naam = 'Vaibhav';
  String get userKaNaam => _naam;
}
