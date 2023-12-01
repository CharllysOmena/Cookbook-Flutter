import 'package:cookbook/app/modules/home/data/models/receita.dart';
import 'package:cookbook/app/modules/home/data/repositories/receitas_respository.dart';
import 'package:cookbook/app/modules/home/data/services/firebase_receita_favorita_service.dart';
import 'package:cookbook/app/modules/home/interactor/states/receita_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

import '../states/firebase_receita_favorita_state.dart';

part 'receita_favorita_store.g.dart';

class ReceitaFavoritaStore = _ReceitaFavoritaStoreBase
    with _$ReceitaFavoritaStore;

abstract class _ReceitaFavoritaStoreBase with Store {
  final IReceitasRepository receitasRepository;
  final IFirebaseReceitaFavoritaService firebaseReceitaFavoritaService;

  _ReceitaFavoritaStoreBase(
      {required this.firebaseReceitaFavoritaService,
      required this.receitasRepository});

  @observable
  ReceitaState state = const StartReceitaState();

  Receita? receita;

  @action
  Future getReceita(String id) async {
    state = const LoadingReceitaState();
    var response = await receitasRepository.get(id);
    (response is SuccessReceitaState) ? receita = response.receita : null;
    state = response;
  }

  @action
  Future desfazerFavorito(String id) async {
    var response = await firebaseReceitaFavoritaService.delete(id);
    if (response is SuccessFirebaseReceitaFavoritaState) {
      Modular.to.pop();
      Fluttertoast.showToast(
        msg: "Receita Retirada!",
        backgroundColor: Colors.amber,
        textColor: Colors.black,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Erro ao retirar receita!",
        backgroundColor: Colors.amber,
        textColor: Colors.black,
      );
    }
  }
}
