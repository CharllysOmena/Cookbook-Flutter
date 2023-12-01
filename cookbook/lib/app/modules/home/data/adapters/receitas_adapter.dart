import 'package:cookbook/app/modules/home/data/models/receita.dart';

class ReceitaAdapter {
  ReceitaAdapter._();

  static Receita fromJson(dynamic data) => Receita(
        nome: data["strMeal"],
        id: data["idMeal"],
        instrucoes: data["strInstructions"],
        url: data["strMealThumb"],
      );
}

class ReceitaAdapter2 {
  ReceitaAdapter2._();

  static Receita fromJson(dynamic data) => Receita(
        nome: data["nome"],
        id: data["id"],
        instrucoes: data["instrucoes"],
        url: data["url"],
      );
}
