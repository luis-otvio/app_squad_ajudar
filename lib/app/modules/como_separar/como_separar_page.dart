import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'como_separar_controller.dart';

class ComoSepararPage extends StatefulWidget {
  final String title;
  const ComoSepararPage({Key key, this.title = "ComoSeparar"})
      : super(key: key);

  @override
  _ComoSepararPageState createState() => _ComoSepararPageState();
}

class _ComoSepararPageState
    extends ModularState<ComoSepararPage, ComoSepararController> {
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
