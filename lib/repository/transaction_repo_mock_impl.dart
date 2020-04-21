import 'package:flutterappmoneytrackermobx/model/transaction.dart' as app;
import 'package:flutterappmoneytrackermobx/repository/transaction_repo.dart';

class TransactionRepoMockImpl implements TransactionRepo {
  @override
  Future<int> delete(int tranId) {
    // TODO: implement delete
    return null;
  }

  @override
  Future<int> insert(app.Transaction trans) {
    // TODO: implement insert
    return null;
  }

  @override
  Future<List<app.Transaction>> selectAll({int limit = 40}) {
    // TODO: implement selectAll
    return null;
  }

  @override
  Future<bool> update(app.Transaction newTran) {
    // TODO: implement update
    return null;
  }
}
