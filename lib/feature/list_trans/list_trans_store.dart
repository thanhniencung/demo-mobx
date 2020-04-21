import 'package:flutterappmoneytrackermobx/model/transaction.dart';
import 'package:flutterappmoneytrackermobx/repository/transaction_repo.dart';
import 'package:mobx/mobx.dart';

part 'list_trans_store.g.dart';

class ListTransitionStore = ListTransitionBase with _$ListTransitionStore;

abstract class ListTransitionBase with Store {
  final TransactionRepo transactionRepo;
  ListTransitionBase(this.transactionRepo);

  @observable
  List<Transaction> trans = [];

  @action
  void loadTransaction() {
    transactionRepo.selectAll().then((result) {
      trans = result;
    });
  }
}
