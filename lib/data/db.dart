import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  //constructor access private
  DB._();

  //Singleton DB
  static final DB instance = DB._();

  //SQLite instance
  static Database? _database;

  //return only one instance from database
  get database async {
    if (_database != null) return _database;
    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'crypto.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version) async {
    await db.execute(_account);
    await db.execute(_wallet);
    await db.execute(_historic);
    await db.insert('account', {'balance': 0});
  }

  String get _account => ''' 
    CREATE TABLE account (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      balance REAL
    );
  ''';

  String get _wallet => ''' 
    CREATE TABLE wallet (
      initials TEXT PRIMARY KEY,
      currency TEXT,
      amount TEXT
    );
  ''';

  String get _historic => ''' 
    CREATE TABLE historic (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      data_operacao INT,
      tipo_operacao TEXT,
      currency TEXT,
      initials TEXT,
      price REAL,
      amount TEXT
    );
  ''';
}
