import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../app_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Recycle+"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBar(widget.title, null),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                  child: Text(
                'Recycle+',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              )),
              decoration: BoxDecoration(
                color: Color(0xFF17B17B),
              ),
            ),
            ListTile(
              leading: Icon(Icons.format_list_bulleted),
              title: Text('Área de Gestão'),
              onTap: () => Modular.link.pushNamed("admin"),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Sobre'),
              onTap: () {
                showDialog(
                    context: context,
                    child: Dialog(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("Recycle+"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                      "Sobre: Aplicativo mobile para educação ambiental na gestão dos resíduos sólidos, incentivando atividades de caráter educativo e pedagógico envolvendo a coleta seletiva e logística reversa"),
                                  Padding(padding: EdgeInsets.all(8.0)),
                                  Text("Versão: v1.0.0"),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 8,
          vertical: 20,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                generateHomeButton(
                  context,
                  "Pontos de Coleta",
                  "assets/img/icon_maps.png",
                  "/mapa",
                ),
                generateHomeButton(
                  context,
                  "Como Separar",
                  "assets/img/icon_drop_trash.png",
                  "/como_separar",
                ),
                generateHomeButton(
                  context,
                  "Dicas Locais",
                  "assets/img/icon_marker.png",
                  "/dica_local",
                ),
                generateHomeButton(
                  context,
                  "Sugestões",
                  "assets/img/icon_suggestion.png",
                  "/sugestoes",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
