import 'package:flutter/material.dart';

class ListagemComida extends StatelessWidget {
  const ListagemComida({
    super.key,
    required this.store,
    required this.urlPagina,
  });

  final store;
  final String urlPagina;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: ListView.builder(
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
              Navigator.pushNamed(context, urlPagina,
                  arguments: store.comidas![index].id);
            },
          );
        }),
      ),
    );
  }
}
