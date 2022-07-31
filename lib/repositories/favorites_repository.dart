import 'dart:collection';
import 'package:flutter/cupertino.dart';

import '../models/currency.dart';

class FavoritesRepository extends ChangeNotifier {
  List<Currency> _favoritesList = [];

  UnmodifiableListView<Currency> get favoriteList => UnmodifiableListView(_favoritesList);

  saveAll(List<Currency> list) {
    list.forEach((currency) {
      if (!_favoritesList.contains(currency)) {
        _favoritesList.add(currency);
      }
    });
    notifyListeners();
  }

  remove(Currency currency) {
    _favoritesList.remove(currency);
    notifyListeners();
  }
}
