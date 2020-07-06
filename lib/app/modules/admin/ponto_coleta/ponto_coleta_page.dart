import 'package:app_squad_ajudar/app/app_widget.dart';
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
      appBar: generateAppBar(widget.title, null),
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
              child: Text("Carregar Pontos Coleta"),
              onPressed: controller.getList,
            ),
          );
        }

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            PontoColeta model = list[index];
            return Column(
              children: [
                ListTile(
                  title: Text("${model.ativo ? '' : '(INATIVO) - '}${model.nome}"),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => controller.addItem(context, model),
                  ),
                  subtitle: Text(model.descricao ?? "")
                ),
                Divider()
              ],
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
