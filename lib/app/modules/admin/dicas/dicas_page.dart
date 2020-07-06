import 'package:app_squad_ajudar/app/app_widget.dart';
import 'package:app_squad_ajudar/app/models/dicas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dicas_controller.dart';

class DicasPage extends StatefulWidget {
  final String title;
  const DicasPage({Key key, this.title = "Pontos de Coletas"})
      : super(key: key);

  @override
  _DicasPageState createState() => _DicasPageState();
}

class _DicasPageState extends ModularState<DicasPage, DicasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBar(widget.title, null),
      body: Observer(builder: (_) {
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
              child: Text("Carregar Pontos Coleta"),
              onPressed: controller.getList,
            ),
          );
        }

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            Dicas model = list[index];
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  ListTile(
                    title: Text(model.titulo),
                    subtitle: Text(model.descricao ?? ""),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => controller.addItem(context, model),
                    ),
                  ),
                  Divider()
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => this.controller.addItem(context),
        tooltip: "Adicionar",
        child: Icon(Icons.add),
      ),
    );
  }
}
