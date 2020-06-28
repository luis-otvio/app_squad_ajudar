import 'package:app_squad_ajudar/app/modules/admin/admin_controller.dart';
import 'package:app_squad_ajudar/app/modules/admin/ponto_coleta/ponto_coleta_controller.dart';
import 'package:app_squad_ajudar/app/modules/admin/ponto_coleta/ponto_coleta_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_squad_ajudar/app/modules/admin/admin_page.dart';

class AdminModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AdminController()),
        Bind((i) => PontoColetaController(Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AdminPage()),
        Router('/ponto_coleta', child: (_, args) => PontoColetaPage()),
      ];

  static Inject get to => Inject<AdminModule>.of();
}
