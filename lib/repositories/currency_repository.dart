import 'dart:convert';

import 'package:crypto_currency/data/db.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

import '../models/currency.dart';

class CurrencyRepository extends ChangeNotifier {
  List<Currency> _table = [];

  List<Currency> get table => _table;

  CurrencyRepository() {
    _readDirectlyAPI();
  }

  _readCurrenciesTable() async {
    Database db = DB.instance.database;
    List results = await db.query('currencies');

    _table = results.map((row) {
      return Currency(
        baseId: row['baseId'],
        iconPath: row['iconPath'],
        name: row['name'],
        initials: row['initials'],
        price: double.parse(row['price']),
        timestamp: DateTime.fromMillisecondsSinceEpoch(row['timestamp']),
        /*changeHour: double.parse(row['changeHour']),
        changeDay: double.parse(row['changeDay']),
        changeWeek: double.parse(row['changeWeek']),
        changeMonth: double.parse(row['changeMonth']),
        changeYear: double.parse(row['changeYear']),
        changeAmountPeriod: double.parse(row['changeAmountPeriod']),*/
      );
    }).toList();

    notifyListeners();
  }

  _setupCurrencyTable() async {
    String currenciesTable = '''
    CREATE TABLE IF NOT EXISTS currencies (
      baseId TEXT PRIMARY KEY,
      initials TEXT,
      name TEXT,
      iconPath TEXT,
      price TEXT,
      timestamp INTEGER,
      changeHour TEXT,
      changeDay TEXT,
      changeWeek TEXT,
      changeMonth TEXT,
      changeYear TEXT,
      changeAmountPeriod TEXT 
    );
    ''';
    Database db = DB.instance.database;
    debugPrint('a executar');
    await db.execute(currenciesTable);
    debugPrint('executou');
  }

  _currenciesTableIsEmpty() async {
    Database db = await DB.instance.database;
    List results = await db.query('currencies');
    return results.isEmpty;
  }

  _readDirectlyAPI() async {
    String uri = 'https://api.coinbase.com/v2/assets/search?=base=BRL';

    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> currencies = json['data'];
      Database db = await DB.instance.database;
      Batch batch = db.batch();

      currencies.forEach((currency) {
        _table.add(Currency(
          baseId: currency['id'],
          iconPath: currency['image_url'],
          name: currency['name'],
          initials: currency['symbol'],
          price: double.parse(currency['latest']),
          timestamp: DateTime.parse(currency['latest_price']['timestamp']),
          /*changeHour: double.parse(currency['latest_price']['percent_change']['hour']),
          changeDay: double.parse(currency['latest_price']['percent_change']['day']),
          changeWeek: double.parse(currency['latest_price']['percent_change']['week']),
          changeMonth: double.parse(currency['latest_price']['percent_change']['month']),
          changeYear: double.parse(currency['latest_price']['percent_change']['year']),
          changeAmountPeriod: double.parse(currency['latest_price']['percent_change']['all']),*/
        ));

        debugPrint(currency['name']);
      });
    }

    notifyListeners();
  }

  _setupDataTableCurrency() async {
    if (await _currenciesTableIsEmpty()) {
      String uri = 'https://api.coinbase.com/v2/assets/search';

      final response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final List<dynamic> currencies = json['data'];
        Database db = await DB.instance.database;
        Batch batch = db.batch();

        currencies.forEach((currency) {
          final timestamp = DateTime.parse(currency['timestamp']);

          batch.insert('currencies', {
            'baseId': currency['id'],
            'initials': currency['symbol'],
            'name': currency['name'],
            'iconPath': currency['image_url'],
            'price': currency['latest'],
            'timestamp': timestamp.millisecondsSinceEpoch,
            'changeHour': currency['percent_change']['hour'].toString(),
            'changeDay': currency['percent_change']['day'].toString(),
            'changeWeek': currency['percent_change']['week'].toString(),
            'changeMonth': currency['percent_change']['month'].toString(),
            'changeYear': currency['percent_change']['year'].toString(),
            'changeAmountPeriod': currency['percent_change']['all'].toString(),
          });
        });

        await batch.commit(noResult: true);
      }
    }
  }
}
