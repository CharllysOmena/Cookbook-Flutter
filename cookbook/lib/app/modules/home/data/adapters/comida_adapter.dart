import 'package:cookbook/app/modules/home/data/models/comida.dart';

class ComidaAdapter {
  ComidaAdapter._();
  static Comida fromJson(dynamic data) => Comida(
        id: data["idMeal"],
        nome: data["strMeal"],
        url: data["strMealThumb"],
      );
}
