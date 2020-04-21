import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget> actions;

  PageContainer({
    this.title,
    this.child,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: child,
    );
  }
}
