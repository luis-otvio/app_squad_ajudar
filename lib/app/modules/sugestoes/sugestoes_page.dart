import 'package:app_squad_ajudar/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'sugestoes_controller.dart';

class SugestoesPage extends StatefulWidget {
  final String title;
  const SugestoesPage({Key key, this.title = "Sugestoes"}) : super(key: key);

  @override
  _SugestoesPageState createState() => _SugestoesPageState();
}

class _SugestoesPageState
    extends ModularState<SugestoesPage, SugestoesController> {
  //use 'controller' variable to access controller
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _msgController = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBar(widget.title, null),
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 8,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF17B17B),
                Color(0xFF51C4B8),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(30),
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/img/icon_suggestion.png",
                                height: 80,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Algo a nos dizer?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: "Seu nome",
                          ),
                          textAlign: TextAlign.center,
                          validator: (value) =>
                              value.isEmpty ? "Informe o nome" : null,
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "E-mail",
                          ),
                          textAlign: TextAlign.center,
                          validator: (value) =>
                              value.isEmpty ? "Informe o e-mail" : null,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _msgController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: "Mensagem",
                          ),
                          textAlign: TextAlign.center,
                          validator: (value) =>
                              value.isEmpty ? "Informe a mensagem" : null,
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton.icon(
                            color: Colors.black.withOpacity(0.7),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  _loading = true;
                                });
                                this
                                    .controller
                                    .sendMessage(
                                      _nameController.text,
                                      _emailController.text,
                                      _msgController.text,
                                    )
                                    .then((value) {
                                  setState(() {
                                    _loading = false;
                                  });
                                  showAlertDialog(
                                    context,
                                    value.body.toString(),
                                  );
                                });
                              }
                            },
                            icon: Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.white,
                            ),
                            label: Text(
                              "ENVIAR SUGESTÃO",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
