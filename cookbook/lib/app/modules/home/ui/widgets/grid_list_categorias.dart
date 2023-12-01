import 'package:flutter/material.dart';

import '../../interactor/stores/categorias_store.dart';

class GridListCategorias extends StatelessWidget {
  const GridListCategorias({
    super.key,
    required this.store,
  });

  final CategoriasStore store;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: store.categorias!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (() {
            Navigator.pushNamed(context, "/comidas",
                arguments: store.categorias![index].nome);
          }),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(store.categorias![index].url),
                Text(
                  store.categorias![index].nome,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
