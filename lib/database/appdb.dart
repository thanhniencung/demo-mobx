import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDb {
  static const DB_NAME = "money-tracker.db";
  static const DB_VERSION = 1;

  static final AppDb _dbInstance = AppDb._internal();
  factory AppDb() {
    return _dbInstance;
  }

  AppDb._internal();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  static const initScripts = [
    '''
      CREATE TABLE trans(
          _id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          money INTEGER,
          type TEXT
      );
    '''
  ];

  static const migrationScripts = [
    'DROP TABLE IF EXISTS trans',
  ];

  initDb() async {
    return await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      onCreate: (db, version) {
        initScripts.forEach((script) {
          db.execute(script);
        });
      },
      onUpgrade: (db, oldVersion, newVersion) {
        migrationScripts.forEach((script) {
          db.execute(script);
        });
        initScripts.forEach((script) {
          db.execute(script);
        });
      },
      version: DB_VERSION,
    );
  }
}
