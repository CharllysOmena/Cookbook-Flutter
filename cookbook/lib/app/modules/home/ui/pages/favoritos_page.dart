import 'package:cookbook/app/modules/home/interactor/stores/favoritos_store.dart';
import 'package:cookbook/app/modules/home/ui/widgets/loading.dart';
import 'package:cookbook/app/modules/home/ui/widgets/error.dart';
import 'package:flutter/material.dart';
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
        body: StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Error();
        } else if (snapshot.hasData) {
          store.comidas = snapshot.data!;
          if (store.comidas!.isEmpty) {
            return const Empty();
          } else {
            return ListagemComida(store: store, urlPagina: urlPagina);
          }
        } else {
          return const Loading();
        }
      },
      stream: store.getReceitasFavoritas(),
    ));
  }
}
