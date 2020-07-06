import 'package:app_squad_ajudar/app/app_widget.dart';
import 'package:app_squad_ajudar/app/models/tipo_coleta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'tipo_coleta_controller.dart';

class TipoColetaPage extends StatefulWidget {
  final String title;
  const TipoColetaPage({Key key, this.title = "Tipos Coletas"})
      : super(key: key);

  @override
  _TipoColetaPageState createState() => _TipoColetaPageState();
}

class _TipoColetaPageState extends ModularState<TipoColetaPage, TipoColetaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBar(widget.title, null),
      body: Observer(builder: (_) {
        if (controller.tipoColetaList.hasError) {
          return Center(
            child: RaisedButton(
              child: Text("Error :/"),
              onPressed: controller.getList,
            ),
          );
        }

        if (controller.tipoColetaList.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<TipoColeta> list = controller.tipoColetaList.data;

        if (list.length == 0) {
          return Center(
            child: RaisedButton(
              child: Text("Carregar Tipos de Coleta"),
              onPressed: controller.getList,
            ),
          );
        }

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            TipoColeta model = list[index];
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  ListTile(
                    title: Text(model.nome),
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
