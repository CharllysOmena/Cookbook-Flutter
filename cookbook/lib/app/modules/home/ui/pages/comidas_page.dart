import 'package:cookbook/app/modules/home/interactor/states/comida_state.dart';
import 'package:cookbook/app/modules/home/interactor/stores/comidas_store.dart';
import 'package:cookbook/app/modules/home/ui/widgets/loading.dart';
import 'package:cookbook/app/modules/home/ui/widgets/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ComidasPage extends StatefulWidget {
  const ComidasPage({Key? key}) : super(key: key);
  @override
  ComidasPageState createState() => ComidasPageState();
}

class ComidasPageState extends State<ComidasPage> {
  ComidasStore store = Modular.get<ComidasStore>();

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
              return ListView.builder(
                itemCount: store.comidas!.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                            store.comidas![index].url,
                          ),
                          radius: 25.0,
                        ),
                        title: Text(
                          store.comidas![index].nome,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/receitas",
                          arguments: store.comidas![index].id);
                    },
                  );
                }),
              );
            } else {
              return const Error();
            }
          },
        ),
      ),
    );
  }
}
