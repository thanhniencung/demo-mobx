import 'package:flutterappmoneytrackermobx/model/transaction.dart';
import 'package:flutterappmoneytrackermobx/repository/transaction_repo.dart';
import 'package:mobx/mobx.dart';

part 'add_trans_store.g.dart';

class AddTransactionStore = AddTransactionBase with _$AddTransactionStore;

abstract class AddTransactionBase with Store {
  final TransactionRepo transactionRepo;
  AddTransactionBase(this.transactionRepo);

  @observable
  bool transactionSaved;

  @observable
  String moneyType;

  @action
  void saveTransaction(Transaction tran) {
    transactionRepo.insert(tran).then((result) {
      transactionSaved = result > 0;
    });
  }

  @action
  void changeMoneyType(String moneyType) {
    this.moneyType = moneyType;
  }
}
