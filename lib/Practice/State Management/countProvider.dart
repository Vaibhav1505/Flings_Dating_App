import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {
  int _countingNumber = 100;
  int get storedCountingNumber => _countingNumber; 
}
