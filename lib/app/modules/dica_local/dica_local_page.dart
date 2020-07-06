import 'package:app_squad_ajudar/app/app_widget.dart';
import 'package:app_squad_ajudar/app/models/dicas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
      body: Container(
        width: MediaQuery.of(context).size.width,
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(builder: (_) {
            if (controller.dicasList.hasError) {
              return Center(
                child: RaisedButton(
                  child: Text("Error :/"),
                  onPressed: controller.getList,
                ),
              );
            }

            if (controller.dicasList.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            List<Dicas> list = controller.dicasList.data;

            if (list.length == 0) {
              return Center(
                child: RaisedButton(
                  child: Text("Ops, Nenhuma Dica Local foi encontrada. :/"),
                  onPressed: controller.getList,
                ),
              );
            }

            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, index) {
                Dicas model = list[index];
                return Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(model.titulo),
                          subtitle: Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                              ),
                              Text(model.descricao),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
