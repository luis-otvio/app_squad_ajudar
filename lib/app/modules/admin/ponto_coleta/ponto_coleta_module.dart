import 'package:app_squad_ajudar/app/modules/admin/ponto_coleta/ponto_coleta_controller.dart';
import 'package:app_squad_ajudar/app/modules/admin/ponto_coleta/ponto_coleta_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PontoColetaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PontoColetaController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => PontoColetaPage()),
      ];

  static Inject get to => Inject<PontoColetaModule>.of();
}
