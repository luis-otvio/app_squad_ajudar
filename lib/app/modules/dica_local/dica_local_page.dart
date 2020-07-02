import 'package:app_squad_ajudar/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dica_local_controller.dart';

class DicaLocalPage extends StatefulWidget {
  final String title;
  const DicaLocalPage({Key key, this.title = "Dicas Locais"}) : super(key: key);

  @override
  _DicaLocalPageState createState() => _DicaLocalPageState();
}

class _DicaLocalPageState
    extends ModularState<DicaLocalPage, DicaLocalController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBar(widget.title, null),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
