import 'package:flutter/material.dart';

class CartProviderClass extends ChangeNotifier {
  final List<Map<String, String?>> favitem = [];

  void addFavItem(product) {
    favitem.add(product);
    notifyListeners();
  }

  void removeFavItem(product) {
    favitem.remove(product);
    notifyListeners();
  }
}
