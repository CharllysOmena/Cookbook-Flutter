import 'package:cookbook/app/modules/home/ui/pages/categorias_page.dart';
import 'package:cookbook/app/modules/home/ui/pages/favoritos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../interactor/stores/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  List<String> titulos = ["Livro de receitas", "Favoritas"];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<StatefulWidget> telas = [
      const CategoriasPage(),
      const FavoritosPage()
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Observer(builder: (context) {
          return Text(titulos[store.indice]);
        }),
        actions: [
          IconButton(
            onPressed: () => store.logout(),
            icon: const Icon(Icons.arrow_back),
          )
        ],
      ),
      body: Observer(
        builder: (context) {
          return telas[store.indice];
        },
      ),
      bottomNavigationBar: Observer(
        builder: (context) {
          return BottomNavigationBar(
            currentIndex: store.indice,
            onTap: (indice) => store.trocarIndice(indice),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            fixedColor: Colors.lightGreen,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.fastfood), label: "Receitas"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favoritos"),
            ],
          );
        },
      ),
    );
  }
}
