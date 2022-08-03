import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/currency.dart';

class FavoritesRepository extends ChangeNotifier {
  List<Currency> _favoritesList = [];

  late LazyBox box;

  FavoritesRepository() {
    _startRepository();
  }

  _startRepository() async {
    await _openBox();
    await _loadFavorites();
  }

  _openBox() async {
    //verify if doesnt exist that typeId
    if (!Hive.isAdapterRegistered(0)) {
      //Hive.registerAdapter(CurrencyHiveAdapter());
    }
    box = await Hive.openLazyBox<Currency>('favorite_currencies');
  }

  _loadFavorites() {
    box.keys.forEach(
      (currency) async {
        Currency i = await box.get(currency);
        _favoritesList.add(i);
        notifyListeners();
      },
    );
  }

  UnmodifiableListView<Currency> get favoriteList => UnmodifiableListView(_favoritesList);

  saveAll(List<Currency> list) {
    list.forEach((currency) {
      if (!_favoritesList.any((element) => element.initials == currency.initials)) {
        _favoritesList.add(currency);
        box.put(currency.initials, currency);
      }
    });
    notifyListeners();
  }

  remove(Currency currency) {
    _favoritesList.remove(currency);
    box.delete(currency.initials);
    notifyListeners();
  }
}
