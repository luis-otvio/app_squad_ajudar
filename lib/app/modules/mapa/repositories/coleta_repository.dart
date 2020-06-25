import 'package:app_squad_ajudar/app/modules/mapa/models/coleta_model.dart';
import 'package:app_squad_ajudar/app/modules/mapa/repositories/coleta_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ColetaRepository implements IColetaRepository {

  final Firestore firestore;

  ColetaRepository(this.firestore);

  @override
  Stream<List<ColetaModel>> getColetas() {
    return firestore.collection('Coleta').snapshots().map((query) {
      return query.documents.map((doc) {
        return ColetaModel.fromDocument(doc);
      }).toList();
    });
  }

}
