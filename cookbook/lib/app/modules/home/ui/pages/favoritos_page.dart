import 'package:cookbook/app/modules/home/interactor/states/firebase_receita_favorita_state.dart';
import 'package:cookbook/app/modules/home/interactor/stores/favoritos_store.dart';
import 'package:cookbook/app/modules/home/ui/widgets/loading.dart';
import 'package:cookbook/app/modules/home/ui/widgets/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/empty.dart';
import '../widgets/listagem_comida.dart';

class FavoritosPage extends StatefulWidget {
  final String title;
  const FavoritosPage({Key? key, this.title = 'FavoritosPage'})
      : super(key: key);
  @override
  FavoritosPageState createState() => FavoritosPageState();
}

class FavoritosPageState extends State<FavoritosPage> {
  FavoritosStore store = Modular.get<FavoritosStore>();
  String urlPagina = "/receita_favorita";
  @override
  void initState() {
    store.getReceitasFavoritas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (store.state is LoadingFirebaseReceitaFavoritaState) {
            return const Loading();
          } else if (store.state is SuccessGetFirebaseReceitaFavoritaState) {
            return ListagemComida(store: store, urlPagina: urlPagina);
          } else if (store.state
              is ErrorExceptionFirebaseReceitaFavoritaState) {
            return const Error();
          } else {
            return const Empty();
          }
        },
      ),
    );
  }
}
