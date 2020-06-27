import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// cor verde customizada
Map<int, Color> color = {
  50: Color.fromRGBO(23, 177, 123, .1),
  100: Color.fromRGBO(23, 177, 123, .2),
  200: Color.fromRGBO(23, 177, 123, .3),
  300: Color.fromRGBO(23, 177, 123, .4),
  400: Color.fromRGBO(23, 177, 123, .5),
  500: Color.fromRGBO(23, 177, 123, .6),
  600: Color.fromRGBO(23, 177, 123, .7),
  700: Color.fromRGBO(23, 177, 123, .8),
  800: Color.fromRGBO(23, 177, 123, .9),
  900: Color.fromRGBO(23, 177, 123, 1),
};

class AppWidget extends StatelessWidget {
  MaterialColor greenCustom = MaterialColor(0xFF880E4F, color);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Squad Ajudar',
      theme: ThemeData(
        primarySwatch: greenCustom,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}

generateAppBar(String titulo, Widget action) {
  // se houver botões a direita
  if (action != null) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        titulo,
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      iconTheme: new IconThemeData(color: Colors.black),
      actions: [action],
    );
  } else {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        titulo,
        style: TextStyle(color: Colors.black),
      ),
      iconTheme: new IconThemeData(color: Colors.black),
      centerTitle: true,
    );
  }
}

Widget generateHomeButton(
    BuildContext context, String texto, String iconeUrl, String rota) {
  return InkWell(
    onTap: () => Modular.link.pushNamed(rota),
    child: Container(
      width: MediaQuery.of(context).size.width / 0.5,
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Row(
            children: [
              Image.asset(
                iconeUrl,
                height: 50,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 47,
                width: 2,
                color: Colors.grey[300],
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.4,
            child: AutoSizeText(
              texto,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF002904),
              ),
              maxFontSize: 20,
              minFontSize: 17,
              maxLines: 3,
            ),
          ),
        ],
      ),
    ),
  );
}
