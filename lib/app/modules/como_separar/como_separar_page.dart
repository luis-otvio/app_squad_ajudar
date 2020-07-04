import 'package:app_squad_ajudar/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'como_separar_controller.dart';

class ComoSepararPage extends StatefulWidget {
  final String title;
  const ComoSepararPage({Key key, this.title = "Como Separar"})
      : super(key: key);

  @override
  _ComoSepararPageState createState() => _ComoSepararPageState();
}

class _ComoSepararPageState
    extends ModularState<ComoSepararPage, ComoSepararController> {
  //use 'controller' variable to access controller

  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        marginTitle: EdgeInsets.only(top: 60, bottom: 20),
        title: "LIXO SECO",
        description:
            "Lixos secos são RECICLÁVEIS, então é importante ficarem em um saco de lixo separado.\n\nEx: Papel, Plástico, Metal ou Vidro.",
        pathImage: "assets/img/lixo_seco.png",
        colorBegin: Color(0xFF3eade3),
        colorEnd: Color(0xFF77ddff),
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
      ),
    );
    slides.add(
      new Slide(
        marginTitle: EdgeInsets.only(top: 60, bottom: 20),
        title: "LIXO ORGÂNICO",
        description:
            "Lixos úmidos NÃO SÃO RECLICLÁVEIS e devem ser descartados em um saco de lixo separado, sempre a 1,5m do chão.\n\nEx: Alimentos, cascas ou folhagens.",
        pathImage: "assets/img/lixo_organico.png",
        colorBegin: Color(0xFF885b64),
        colorEnd: Color(0xFFb6868f),
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
      ),
    );
    slides.add(
      new Slide(
        marginTitle: EdgeInsets.only(top: 60, bottom: 20),
        title: "LIXO NÃO RECICLÁVEL",
        description:
            "Lixos não recicláveis podem ser perigosos, então cuidado ao embalar cacos de vidros ou objetos pontiagudos. Se possível, descarte dentro de uma garrafa.\n\nEx: Lâmpadas, Espelhos, Produtos Tóxicos ou Papel Higiênico.",
        pathImage: "assets/img/lixo_nao_reciclavel.png",
        colorBegin: Color(0xFF616161),
        colorEnd: Color(0xFF8a8a8a),
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
      ),
    );
  }

  void onDonePress() {
    Modular.link.pushNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBar(widget.title, null),
      body: IntroSlider(
        isShowSkipBtn: false,
        shouldHideStatusBar: false,
        nameDoneBtn: "FEITO",
        nameNextBtn: "PRÓX.",
        namePrevBtn: "ANTE.",
        isScrollable: true,
        slides: this.slides,
        onDonePress: this.onDonePress,
      ),
    );
  }
}
