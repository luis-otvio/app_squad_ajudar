import 'package:app_squad_ajudar/app/models/ponto_coleta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'ponto_coleta_controller.g.dart';

class PontoColetaController = _PontoColetaControllerBase
    with _$PontoColetaController;

abstract class _PontoColetaControllerBase with Store {
  final Firestore firestore = Firestore.instance;

  _PontoColetaControllerBase() {
    getList();
  }

  @observable
  ObservableStream<List<PontoColeta>> pontoColetaList;

  @action
  void getList() {
    pontoColetaList = firestore
        .collection(PontoColeta().toString())
        .orderBy("nome")
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return PontoColeta.fromDocument(doc);
      }).toList();
    }).asObservable();
  }

  @action
  void addItem(BuildContext context, [PontoColeta model]) {
    model ??= PontoColeta();
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                      "${model.nome.isEmpty ? 'Adicionar' : 'Editar'} Ponto Coleta"),
                  trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Modular.to.pop(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        initialValue: model.nome,
                        onChanged: (value) => model.nome = value,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Nome"),
                      ),
                      TextFormField(
                        initialValue: model.descricao,
                        onChanged: (value) => model.descricao = value,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Descrição"),
                      ),
                      CheckboxListTile(
                        value: model.ativo ?? false,
                        onChanged: (value) => model.ativo = value,
                        title: Text("Exibir no Mapa?"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        onPressed: Modular.to.pop,
                        child: Text(
                          "Cancelar",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
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
