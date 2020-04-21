import 'package:flutterappmoneytrackermobx/model/transaction.dart';

abstract class TransactionRepo {
  Future<int> insert(Transaction trans);
  Future<int> delete(int tranId);
  Future<bool> update(Transaction newTran);
  Future<List<Transaction>> selectAll({int limit = 40});
}
