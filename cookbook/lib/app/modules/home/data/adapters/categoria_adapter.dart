import 'package:cookbook/app/modules/home/data/models/categoria.dart';

class CategoriaAdapter {
  CategoriaAdapter._();

  static Categoria fromJson(dynamic data) => Categoria(
        id: data["idCategory"],
        nome: data["strCategory"],
        url: data["strCategoryThumb"],
      );
}
