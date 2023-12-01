import 'package:flutter/material.dart';

import '../../data/models/receita.dart';

class Polaroid extends StatelessWidget {
  const Polaroid({
    Key? key,
    required this.receita,
  }) : super(key: key);

  final Receita receita;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        width: 220,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Image.network(
                  receita.url,
                  width: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    receita.nome,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
