import 'package:flutterappmoneytrackermobx/database/appdb.dart';
import 'package:sqflite/sqflite.dart';

class Transaction {
  int transId;
  String name;
  int money;
  String type;

  Transaction({
    this.transId,
    this.name,
    this.money,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      '_id': transId,
      'name': name,
      'money': money,
      'type': type,
    };
  }

  Transaction.fromData(transId, name, money, type) {
    this.transId = transId;
    this.name = name;
    this.money = money;
    this.type = type;
  }
}
