import 'package:cookbook/app/modules/home/ui/widgets/polaroid.dart';
import 'package:flutter/material.dart';

class DetalhesReceita extends StatelessWidget {
  final store;
  const DetalhesReceita({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Polaroid(receita: store.receita!),
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
                store.receita!.instrucoes,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
