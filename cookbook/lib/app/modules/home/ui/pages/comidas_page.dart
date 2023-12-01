import 'package:cookbook/app/modules/home/interactor/states/comida_state.dart';
import 'package:cookbook/app/modules/home/interactor/stores/comidas_store.dart';
import 'package:cookbook/app/modules/home/ui/widgets/loading.dart';
import 'package:cookbook/app/modules/home/ui/widgets/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/listagem_comida.dart';

class ComidasPage extends StatefulWidget {
  const ComidasPage({Key? key}) : super(key: key);
  @override
  ComidasPageState createState() => ComidasPageState();
}

class ComidasPageState extends State<ComidasPage> {
  ComidasStore store = Modular.get<ComidasStore>();
  String urlPagina = "/receitas";

  @override
  void initState() {
    String categoria = Modular.args!.data.toString();
    store.getComidas(categoria);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comidas"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Observer(
          builder: (_) {
            if (store.state is LoadingComidaState) {
              return const Loading();
            } else if (store.state is SuccessComidaState) {
              return ListagemComida(store: store, urlPagina: urlPagina);
            } else {
              return const Error();
            }
          },
        ),
      ),
    );
  }
}
