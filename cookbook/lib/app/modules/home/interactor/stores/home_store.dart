import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../login/data/services/firebase_login_service.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final FirebaseLoginService firebaseLoginService;

  HomeStoreBase({required this.firebaseLoginService});

  @observable
  int indice = 0;

  User? user = Modular.args!.data;

  @action
  trocarIndice(int novoIndice) {
    indice = novoIndice;
  }

  Future logout() async {
    firebaseLoginService.signOut();
    Modular.to.navigate("/login");
  }
}
