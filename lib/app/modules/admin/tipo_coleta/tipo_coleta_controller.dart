import 'package:app_squad_ajudar/app/models/tipo_coleta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'tipo_coleta_controller.g.dart';

class TipoColetaController = _TipoColetaControllerBase with _$TipoColetaController;

abstract class _TipoColetaControllerBase with Store {
  final Firestore firestore = Firestore.instance;

  _TipoColetaControllerBase() {
    getList();
  }

  @observable
  ObservableStream<List<TipoColeta>> tipoColetaList;

  @action
  void getList() {
    tipoColetaList = firestore
        .collection(TipoColeta().toString())
        .orderBy("nome")
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return TipoColeta.fromDocument(doc);
      }).toList();
    }).asObservable();
  }

  @action
  void addItem(BuildContext context, [TipoColeta model]) {
    model ??= TipoColeta();
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                      "${model.nome.isEmpty ? 'Adicionar' : 'Editar'} Dica Local"),
                  trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Modular.to.pop(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  height: MediaQuery.of(context).size.height - 450,
                  child: ListView(
                    children: [
                      Padding(padding: EdgeInsets.all(8)),
                      TextFormField(
                        initialValue: model.nome,
                        onChanged: (value) => model.nome = value,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Título"),
                      ),
                      Padding(padding: EdgeInsets.all(8)),
                      TextFormField(
                        initialValue: model.descricao,
                        maxLines: 8,
                        onChanged: (value) => model.descricao = value,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Descrição"),
                      ),
                      Padding(padding: EdgeInsets.all(8)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (model.nome.isNotEmpty)
                        FlatButton(
                          onPressed: () {
                            model.delete();
                            Modular.to.pop();
                          },
                          child: Text(
                            "Excluir",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      Padding(padding: EdgeInsets.only(left: 2),),
                      FlatButton(
                        onPressed: () async {
                          await model.save();
                          Modular.to.pop();
                        },
                        child: Text(
                          "Salvar",
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
