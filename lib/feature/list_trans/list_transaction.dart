import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterappmoneytrackermobx/database/appdb.dart';
import 'package:flutterappmoneytrackermobx/feature/list_trans/list_trans_store.dart';
import 'package:flutterappmoneytrackermobx/repository/transaction_repo_impl.dart';
import 'package:flutterappmoneytrackermobx/shared/mixin_state.dart';
import 'package:flutterappmoneytrackermobx/shared/page_container.dart';
import 'package:provider/provider.dart';
import 'package:flutterappmoneytrackermobx/main.dart';

class ListTransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => TransactionRepoImpl(),
        ),
        ProxyProvider<TransactionRepoImpl, ListTransitionStore>(
          update: (context, transRepo, previous) =>
              ListTransitionStore(transRepo),
        ),
      ],
      child: ListTransaction(),
    );
  }
}

class ListTransaction extends StatefulWidget {
  const ListTransaction();

  @override
  _ListTransactionState createState() => _ListTransactionState();
}

class _ListTransactionState extends State<ListTransaction> with MixinState {
  ListTransitionStore listTranStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (listTranStore == null) {
      listTranStore = findStore<ListTransitionStore>();
      listTranStore.loadTransaction();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: "List Transaction",
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () async {
            var result = await Navigator.pushNamed(context, '/add');
            if (result != null) {
              listTranStore.loadTransaction();
            }
          },
        ),
      ],
      child: Observer(
        builder: (_) {
          if (listTranStore.trans.length == 0) {
            return Center(
              child: Text(
                'No transaction found',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: listTranStore.trans.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: _buildMoneyIcon(listTranStore.trans[index].type),
                  title: Text(
                    listTranStore.trans[index].name,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  subtitle: Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: _buildMoneyType(
                      listTranStore.trans[index].type,
                      listTranStore.trans[index].money,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildMoneyIcon(String type) {
    return Icon(
      Icons.monetization_on,
      size: 40,
      color: type == 'Income' ? Colors.green : Colors.red,
    );
  }

  //['Income', 'Outcome']
  Widget _buildMoneyType(String type, int money) {
    if (type == 'Income') {
      return Text(
        '+ $money',
        style: TextStyle(
          fontSize: 15,
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return Text(
      '- $money',
      style: TextStyle(
        fontSize: 17,
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
