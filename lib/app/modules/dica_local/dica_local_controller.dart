import 'package:app_squad_ajudar/app/models/dicas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'dica_local_controller.g.dart';

class DicaLocalController = _DicaLocalControllerBase with _$DicaLocalController;

abstract class _DicaLocalControllerBase with Store {
  final Firestore firestore = Firestore.instance;

  _DicaLocalControllerBase() {
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
}
