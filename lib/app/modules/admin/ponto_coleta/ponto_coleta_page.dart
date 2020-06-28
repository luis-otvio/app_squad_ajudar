import 'package:app_squad_ajudar/app/models/ponto_coleta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'ponto_coleta_controller.dart';

class PontoColetaPage extends StatefulWidget {
  final String title;
  const PontoColetaPage({Key key, this.title = "Pontos de Coletas"}) : super(key: key);

  @override
  _PontoColetaPageState createState() => _PontoColetaPageState();
}

class _PontoColetaPageState extends ModularState<PontoColetaPage, PontoColetaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        if (controller.pontoColetaList.hasError) {
          return Center(
            child: RaisedButton(
              child: Text("Error :/"),
              onPressed: controller.getList,
            ),
          );
        }

        if (controller.pontoColetaList.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<PontoColeta> list = controller.pontoColetaList.data;

        if (list.length == 0) {
          return Center(
            child: RaisedButton(
              child: Text("Cadastrar PontoColeta"),
              onPressed: controller.getList,
            ),
          );
        }

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(list[index].nome),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => controller.addItem(context, list[index]),
              ),
              subtitle: Text(list[index].descricao ?? "")
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
