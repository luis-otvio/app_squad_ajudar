import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dica_local_controller.dart';

class DicaLocalPage extends StatefulWidget {
  final String title;
  const DicaLocalPage({Key key, this.title = "DicaLocal"}) : super(key: key);

  @override
  _DicaLocalPageState createState() => _DicaLocalPageState();
}

class _DicaLocalPageState
    extends ModularState<DicaLocalPage, DicaLocalController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
