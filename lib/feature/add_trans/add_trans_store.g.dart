// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_trans_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddTransactionStore on AddTransactionBase, Store {
  final _$transactionSavedAtom =
      Atom(name: 'AddTransactionBase.transactionSaved');

  @override
  bool get transactionSaved {
    _$transactionSavedAtom.context.enforceReadPolicy(_$transactionSavedAtom);
    _$transactionSavedAtom.reportObserved();
    return super.transactionSaved;
  }

  @override
  set transactionSaved(bool value) {
    _$transactionSavedAtom.context.conditionallyRunInAction(() {
      super.transactionSaved = value;
      _$transactionSavedAtom.reportChanged();
    }, _$transactionSavedAtom, name: '${_$transactionSavedAtom.name}_set');
  }

  final _$moneyTypeAtom = Atom(name: 'AddTransactionBase.moneyType');

  @override
  String get moneyType {
    _$moneyTypeAtom.context.enforceReadPolicy(_$moneyTypeAtom);
    _$moneyTypeAtom.reportObserved();
    return super.moneyType;
  }

  @override
  set moneyType(String value) {
    _$moneyTypeAtom.context.conditionallyRunInAction(() {
      super.moneyType = value;
      _$moneyTypeAtom.reportChanged();
    }, _$moneyTypeAtom, name: '${_$moneyTypeAtom.name}_set');
  }

  final _$AddTransactionBaseActionController =
      ActionController(name: 'AddTransactionBase');

  @override
  void saveTransaction(Transaction tran) {
    final _$actionInfo = _$AddTransactionBaseActionController.startAction();
    try {
      return super.saveTransaction(tran);
    } finally {
      _$AddTransactionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeMoneyType(String moneyType) {
    final _$actionInfo = _$AddTransactionBaseActionController.startAction();
    try {
      return super.changeMoneyType(moneyType);
    } finally {
      _$AddTransactionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'transactionSaved: ${transactionSaved.toString()},moneyType: ${moneyType.toString()}';
    return '{$string}';
  }
}
