import 'package:app_squad_ajudar/app/modules/mapa/mapa_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_squad_ajudar/app/modules/mapa/mapa_page.dart';

class MapaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MapaController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => MapaPage()),
      ];

  static Inject get to => Inject<MapaModule>.of();
}
