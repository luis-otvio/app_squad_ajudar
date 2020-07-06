import 'package:app_squad_ajudar/app/app_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'admin_controller.g.dart';

class AdminController = _AdminControllerBase with _$AdminController;

abstract class _AdminControllerBase with Store {
  FirebaseAuth auth = FirebaseAuth.instance;

  @observable
  FirebaseUser user;
  @observable
  bool logado;

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  @action
  Future singIn(BuildContext context) async {
    try {
      user = (await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: senhaController.text,
      ))
          .user;
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Ops, algo deu errado!"),
            content: Text(
                "Verifique se o email e senha inseridos estão corretos e tente novamente."),
          );
        },
      );
      print(e);
    }
  }

  Future<FirebaseUser> getUser() async {
    return FirebaseAuth.instance.currentUser();
  }
}
