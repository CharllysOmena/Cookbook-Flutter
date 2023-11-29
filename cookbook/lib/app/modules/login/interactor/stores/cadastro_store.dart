import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

import '../../data/models/usuario.dart';
import '../../data/services/firebase_cadastro_service.dart';
import '../states/firebase_cadastro_state.dart';

part 'cadastro_store.g.dart';

class CadastroStore = _CadastroStoreBase with _$CadastroStore;

abstract class _CadastroStoreBase with Store {
  final IFirebaseCadastroService firebaseCadastroService;

  @observable
  FirebaseCadastroState state = const StartFirebaseCadastroState();

  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  User? user;
  String? url;
  Usuario? usuario;

  _CadastroStoreBase({
    required this.firebaseCadastroService,
  });

  @action
  Future register() async {
    state = const LoadingFirebaseCadastroState();
    var response =
        await firebaseCadastroService.register(usuario!.email, usuario!.senha);
    if (response is SuccessFirebaseCadastroState) {
      user = response.userCredential.user;
      state = response;
      Modular.to.navigate("/");
    } else if (response is ErrorExceptionFirebaseCadastroState) {
      state = const ErrorExceptionFirebaseCadastroState();
      Fluttertoast.showToast(
        msg: "Esse E-mail ja esta cadastrado!",
        backgroundColor: Colors.lightGreen,
        textColor: Colors.black,
      );
    }
  }

  Usuario montarDados(String email, String senha) =>
      usuario = Usuario(email: email, senha: senha);
}
