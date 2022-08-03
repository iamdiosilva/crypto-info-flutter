import 'package:crypto_currency/repositories/currency_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import '../data/db.dart';
import '../models/position.dart';

class AccountRepository extends ChangeNotifier {
  late Database db;

  List<Position> _wallet = [];
  double _balance = 0;

  //CurrencyRepository currencies;

  get balance => _balance;
  List<Position> get wallet => _wallet;

  AccountRepository() {
    _initRepository();
  }

  _initRepository() async {
    await _getBalance();
  }

  _getBalance() async {
    db = await DB.instance.database;
    List account = await db.query('account', limit: 1);
    _balance = account.first['balance'];
    notifyListeners();
  }

  setSaldo(double value) async {
    db = await DB.instance.database;
    db.update(
      'account',
      {'balance': value},
    );
    _balance = value;
    notifyListeners();
  }
}
