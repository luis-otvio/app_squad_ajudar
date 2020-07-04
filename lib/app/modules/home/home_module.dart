import 'package:app_squad_ajudar/app/modules/admin/admin_controller.dart';
import 'package:app_squad_ajudar/app/modules/admin/admin_page.dart';
import 'package:app_squad_ajudar/app/modules/como_separar/como_separar_controller.dart';
import 'package:app_squad_ajudar/app/modules/como_separar/como_separar_page.dart';
import 'package:app_squad_ajudar/app/modules/dica_local/dica_local_controller.dart';
import 'package:app_squad_ajudar/app/modules/dica_local/dica_local_page.dart';
import 'package:app_squad_ajudar/app/modules/home/home_controller.dart';
import 'package:app_squad_ajudar/app/modules/mapa/mapa_controller.dart';
import 'package:app_squad_ajudar/app/modules/mapa/mapa_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_squad_ajudar/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => AdminController()),
        Bind((i) => MapaController()),
        Bind((i) => ComoSepararController()),
        Bind((i) => DicaLocalController()),
      ];

  @override
  List<Router> get routers => [
        Router('/home', child: (_, args) => HomePage()),
        Router('/admin', child: (_, args) => AdminPage()),
        Router('/mapa', child: (_, args) => MapaPage()),
        Router('/como_separar', child: (_, args) => ComoSepararPage()),
        Router('/dica_local', child: (_, args) => DicaLocalPage()),
        // Router('/sugestoes', child: (_, args) => SugestoesPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
