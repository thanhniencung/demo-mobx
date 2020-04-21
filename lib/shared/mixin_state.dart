import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

mixin MixinState<T extends StatefulWidget> on State<T> {
  B findStore<B>() {
    return Provider.of<B>(context);
  }

  B findStoreNoListen<B>() {
    return Provider.of<B>(context, listen: false);
  }
}
