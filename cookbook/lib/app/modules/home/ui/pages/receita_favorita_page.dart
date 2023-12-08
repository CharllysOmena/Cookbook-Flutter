import 'package:cookbook/app/modules/home/interactor/states/receita_state.dart';
import 'package:cookbook/app/modules/home/ui/widgets/detalhes_receita.dart';
import 'package:cookbook/app/modules/home/ui/widgets/loading.dart';
import 'package:cookbook/app/modules/home/ui/widgets/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../interactor/stores/receita_favorita_store.dart';

class ReceitaFavoritaPage extends StatefulWidget {
  final String title;
  const ReceitaFavoritaPage({Key? key, this.title = 'Receita'})
      : super(key: key);
  @override
  ReceitaFavoritaPageState createState() => ReceitaFavoritaPageState();
}

class ReceitaFavoritaPageState extends State<ReceitaFavoritaPage> {
  ReceitaFavoritaStore store = Modular.get<ReceitaFavoritaStore>();
  String id = Modular.args!.data.toString();
  @override
  void initState() {
    store.getReceita(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () => store.desfazerFavorito(id),
              icon: const Icon(Icons.favorite))
        ],
      ),
      body: Observer(
        builder: (_) {
          if (store.state is LoadingReceitaState) {
            return const Loading();
          } else if (store.state is SuccessReceitaState) {
            return SingleChildScrollView(
                padding: const EdgeInsets.all(4),
                child: DetalhesReceita(store: store));
          } else if (store.state is ErrorExceptionReceitaState) {
            return const Error();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
