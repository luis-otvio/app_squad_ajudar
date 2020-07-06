import 'package:app_squad_ajudar/app/modules/admin/admin_controller.dart';
import 'package:app_squad_ajudar/app/modules/admin/dicas/dicas_controller.dart';
import 'package:app_squad_ajudar/app/modules/admin/dicas/dicas_page.dart';
import 'package:app_squad_ajudar/app/modules/admin/ponto_coleta/ponto_coleta_controller.dart';
import 'package:app_squad_ajudar/app/modules/admin/ponto_coleta/ponto_coleta_page.dart';
import 'package:app_squad_ajudar/app/modules/admin/tipo_coleta/tipo_coleta_controller.dart';
import 'package:app_squad_ajudar/app/modules/admin/tipo_coleta/tipo_coleta_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_squad_ajudar/app/modules/admin/admin_page.dart';

class AdminModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AdminController()),
        Bind((i) => PontoColetaController()),
        Bind((i) => TipoColetaController()),
        Bind((i) => DicasController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AdminPage()),
        Router('/ponto_coleta', child: (_, args) => PontoColetaPage()),
        Router('/tipo_coleta', child: (_, args) => TipoColetaPage()),
        Router('/dicas', child: (_, args) => DicasPage()),
      ];

  static Inject get to => Inject<AdminModule>.of();
}
