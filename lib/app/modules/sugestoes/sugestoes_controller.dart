import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'sugestoes_controller.g.dart';

class SugestoesController = _SugestoesControllerBase with _$SugestoesController;

abstract class _SugestoesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  Future<http.Response> sendMessage(String name, String email, String message) {
    return http.post(
      'https://luisot2104.000webhostapp.com/api_squadajudar/sendSugestion.php',
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'message': message,
      }),
    );
  }
}
