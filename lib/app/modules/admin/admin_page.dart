import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'admin_controller.dart';

class AdminPage extends StatefulWidget {
  final String title;
  const AdminPage({Key key, this.title = "Menu Administrativo"}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends ModularState<AdminPage, AdminController> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.map),
              title: Text("Pontos de Coletas"),
              onTap: () => Modular.link.pushNamed('/ponto_coleta'),
            ),
          )
        ],
      ),
    );
  }
}
