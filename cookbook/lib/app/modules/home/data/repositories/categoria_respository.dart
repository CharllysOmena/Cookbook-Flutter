import 'package:cookbook/app/modules/home/data/adapters/categoria_adapter.dart';
import 'package:cookbook/app/modules/home/data/models/categoria.dart';
import 'package:cookbook/app/modules/home/interactor/states/categoria_state.dart';

import '../datasources/categorias_datasource.dart';

abstract interface class ICategoriaRepository {
  Future<CategoriaState> get();
}

class CategoriaRepository implements ICategoriaRepository {
  final ICategoriaDatasource categoriaDatasource;

  CategoriaRepository({required this.categoriaDatasource});

  @override
  Future<CategoriaState> get() async {
    List<Categoria> categorias;
    try {
      var response = await categoriaDatasource.get();
      List<dynamic> body = response["categories"];
      categorias = body.map((data) => CategoriaAdapter.fromJson(data)).toList();
      return SuccessCategoriaState(categorias: categorias);
    } catch (e) {
      return const ErrorExceptionCategoriaState();
    }
  }
}
