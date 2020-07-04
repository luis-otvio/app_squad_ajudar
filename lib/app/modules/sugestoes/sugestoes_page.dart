import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'sugestoes_controller.dart';

class SugestoesPage extends StatefulWidget {
  final String title;
  const SugestoesPage({Key key, this.title = "Sugestoes"}) : super(key: key);

  @override
  _SugestoesPageState createState() => _SugestoesPageState();
}

class _SugestoesPageState
    extends ModularState<SugestoesPage, SugestoesController> {
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
