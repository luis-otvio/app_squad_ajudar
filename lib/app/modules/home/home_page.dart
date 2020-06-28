import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../app_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Squad Ajudar"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBar(widget.title, null),
      drawer: Drawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 8,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF17B17B),
              Color(0xFF51C4B8),
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            generateHomeButton(
              context,
              "Pontos de coleta",
              "assets/img/icon_maps.png",
              "/mapa",
            ),
            generateHomeButton(
              context,
              "Como separar",
              "assets/img/icon_drop_trash.png",
              "",
            ),
            generateHomeButton(
              context,
              "Dicas Locais",
              "assets/img/icon_marker.png",
              "",
            ),
          ],
        ),
      ),
    );
  }
}
