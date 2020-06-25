import 'package:app_squad_ajudar/app/modules/mapa/mapa_controller.dart';
import 'package:app_squad_ajudar/app/modules/mapa/repositories/coleta_repository.dart';
import 'package:app_squad_ajudar/app/modules/mapa/repositories/coleta_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_squad_ajudar/app/modules/mapa/mapa_page.dart';

class MapaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MapaController(i.get())),
        Bind<IColetaRepository>((i) => ColetaRepository(Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => MapaPage()),
      ];

  static Inject get to => Inject<MapaModule>.of();
}
