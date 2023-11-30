import 'package:cookbook/app/modules/home/interactor/states/receita_state.dart';
import 'package:cookbook/app/modules/home/interactor/stores/receitas_store.dart';
import 'package:cookbook/app/modules/home/ui/widgets/loading.dart';
import 'package:cookbook/app/modules/home/ui/widgets/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/polaroid.dart';

class ReceitasPage extends StatefulWidget {
  final String title;
  const ReceitasPage({Key? key, this.title = 'Receita'}) : super(key: key);
  @override
  ReceitasPageState createState() => ReceitasPageState();
}

class ReceitasPageState extends State<ReceitasPage> {
  ReceitasStore store = Modular.get<ReceitasStore>();

  @override
  void initState() {
    String id = Modular.args!.data.toString();
    store.getReceitas(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Observer(
          builder: (_) {
            if (store.state is LoadingReceitaState) {
              return const Loading();
            } else if (store.state is SuccessReceitaState) {
              return ListView.builder(
                itemCount: store.receitas!.length,
                itemBuilder: ((context, index) {
                  return Container(
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      children: [
                        Polaroid(receita: store.receitas!),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              title: const Text(
                                "Instruções",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              subtitle: Text(
                                store.receitas![index].instrucoes,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              );
            } else if (store.state is ErrorExceptionReceitaState) {
              return const Error();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
