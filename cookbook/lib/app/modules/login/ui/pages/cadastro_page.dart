import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../interactor/states/firebase_cadastro_state.dart';
import '../../interactor/stores/cadastro_store.dart';
import '../widgets/form_cadastro.dart';
import '../widgets/loading.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key? key, this.title = 'CadastroPage'}) : super(key: key);
  @override
  CadastroPageState createState() => CadastroPageState();
}

class CadastroPageState extends State<CadastroPage> {
  final store = Modular.get<CadastroStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context) {
          return (store.state is LoadingFirebaseCadastroState)
              ? const Loading()
              : FormCadastro(store: store);
        },
      ),
    );
  }
}
