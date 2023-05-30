import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationProvider with ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    notifyListeners(); // Notifies all the listeners that the variable has changed
  }
}
