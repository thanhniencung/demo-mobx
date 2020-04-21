import 'package:flutter/material.dart';
import 'package:flutterappmoneytrackermobx/feature/add_trans/add_trans_store.dart';
import 'package:flutterappmoneytrackermobx/model/transaction.dart';
import 'package:flutterappmoneytrackermobx/repository/transaction_repo_impl.dart';
import 'package:flutterappmoneytrackermobx/shared/mixin_state.dart';
import 'package:flutterappmoneytrackermobx/shared/page_container.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class AddTransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => TransactionRepoImpl(),
        ),
        ProxyProvider<TransactionRepoImpl, AddTransactionStore>(
          update: (context, transRepo, previous) =>
              AddTransactionStore(transRepo),
        ),
      ],
      child: AddTransaction(),
    );
  }
}

class AddTransaction extends StatefulWidget {
  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> with MixinState {
  AddTransactionStore addTransactionStore;
  List<ReactionDisposer> _disposers;

  final _inputTranNameController = TextEditingController();
  final _inputMoneyController = TextEditingController();

  String currentMoneyType;

  @override
  void dispose() {
    super.dispose();

    _disposers?.forEach((dispose) {
      dispose();
    });

    _inputTranNameController.dispose();
    _inputMoneyController.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (addTransactionStore == null) {
      addTransactionStore = findStore<AddTransactionStore>();

      _disposers = [
        reaction(
          (_) => addTransactionStore.transactionSaved,
          (isSuccess) {
            if (isSuccess) {
              Navigator.pop(context, true);
            }
          },
        ),
        reaction(
          (_) => addTransactionStore.moneyType,
          (result) {
            print(result);
            currentMoneyType = result;
          },
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: "Add Transaction",
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _inputTranNameController,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.edit),
                border: OutlineInputBorder(),
                labelText: 'Transaction name',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: _inputMoneyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.monetization_on),
                border: OutlineInputBorder(),
                labelText: 'Money',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MoneyType(addTransactionStore),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 200,
              height: 40,
              child: Builder(
                builder: (context) => RaisedButton(
                  color: Colors.lightBlue,
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  onPressed: () {
                    try {
                      addTransactionStore.saveTransaction(
                        Transaction(
                          name: _inputTranNameController.text,
                          money: int.parse(_inputMoneyController.text),
                          type: currentMoneyType,
                        ),
                      );
                    } catch (e) {
                      final snackBar = SnackBar(
                        content: Text(e.toString()),
                        backgroundColor: Colors.red,
                      );
                      Scaffold.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoneyType extends StatefulWidget {
  final AddTransactionStore addTransactionStore;
  MoneyType(this.addTransactionStore);

  @override
  _MoneyTypeState createState() => _MoneyTypeState();
}

class _MoneyTypeState extends State<MoneyType> {
  String dropdownValue = 'Income';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.addTransactionStore.changeMoneyType(dropdownValue);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue,
      icon: Icon(Icons.arrow_forward_ios),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black, fontSize: 17),
      underline: Container(
        height: 1.5,
        color: Colors.grey,
      ),
      onChanged: (String newValue) {
        widget.addTransactionStore.changeMoneyType(newValue);
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Income', 'Outcome']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Container(
            child: Text(value),
          ),
        );
      }).toList(),
    );
  }
}
