import 'package:flutterappmoneytrackermobx/database/appdb.dart';
import 'package:flutterappmoneytrackermobx/model/transaction.dart' as app;
import 'package:flutterappmoneytrackermobx/repository/transaction_repo.dart';
import 'package:sqflite/sqflite.dart';

class TransactionRepoImpl implements TransactionRepo {
  @override
  Future<int> delete(int tranId) async {
    final database = await AppDb().database;
    return database.delete(
      'trans',
      where: '_id = ?',
      whereArgs: [tranId],
    );
  }

  @override
  Future<int> insert(app.Transaction trans) async {
    final database = await AppDb().database;
    return database.insert(
      'trans',
      trans.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<app.Transaction>> selectAll({int limit = 40}) async {
    final database = await AppDb().database;
    final List<Map<String, dynamic>> maps = await database.query(
      'trans',
      orderBy: "_id DESC",
      limit: limit,
    );
    return List.generate(maps.length, (index) {
      return app.Transaction.fromData(
        maps[index]['_id'],
        maps[index]['name'],
        maps[index]['money'],
        maps[index]['type'],
      );
    });
  }

  @override
  Future<bool> update(app.Transaction newTran) {
    // TODO: implement update
    return null;
  }
}
