import 'package:flutter/material.dart';
import 'package:flutterappmoneytrackermobx/database/appdb.dart';
import 'package:flutterappmoneytrackermobx/feature/add_trans/add_transaction.dart';
import 'package:flutterappmoneytrackermobx/feature/list_trans/list_transaction.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => GlobalStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => ListTransactionPage(),
          '/add': (context) => AddTransactionPage(),
        },
      ),
    );
  }
}

@immutable
class GlobalStore {
  final AppDb _appDb = AppDb();

  initData() {
    _appDb.initDb();
  }
}
