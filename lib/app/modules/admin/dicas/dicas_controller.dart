import 'package:app_squad_ajudar/app/models/dicas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'dicas_controller.g.dart';

class DicasController = _DicasControllerBase with _$DicasController;

abstract class _DicasControllerBase with Store {
  final Firestore firestore = Firestore.instance;

  _DicasControllerBase() {
    getList();
  }

  @observable
  ObservableStream<List<Dicas>> dicasList;

  @action
  void getList() {
    dicasList = firestore
        .collection(Dicas().toString())
        .orderBy("titulo")
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return Dicas.fromDocument(doc);
      }).toList();
    }).asObservable();
  }

  @action
  void addItem(BuildContext context, [Dicas model]) {
    model ??= Dicas();
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                      "${model.titulo.isEmpty ? 'Adicionar' : 'Editar'} Dica Local"),
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
                        initialValue: model.titulo,
                        onChanged: (value) => model.titulo = value,
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
                      if (model.titulo.isNotEmpty)
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
