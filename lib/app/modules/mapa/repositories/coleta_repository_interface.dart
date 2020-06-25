
import 'package:app_squad_ajudar/app/modules/mapa/models/coleta_model.dart';

abstract class IColetaRepository {

  Stream<List<ColetaModel>> getColetas();
}