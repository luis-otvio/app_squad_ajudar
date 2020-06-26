
import 'package:app_squad_ajudar/app/models/coleta.dart';

abstract class IColetaRepository {

  Stream<List<Coleta>> getColetas();
}