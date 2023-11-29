import '../../interactor/states/comida_state.dart';
import '../adapters/comida_adapter.dart';
import '../datasources/comidas_datasource.dart';
import '../models/comida.dart';

abstract interface class IComidasRepository {
  Future<ComidaState> get(String categoria);
}

class ComidasRepository implements IComidasRepository {
  final IComidasDatasource comidasDatasource;

  ComidasRepository({required this.comidasDatasource});

  @override
  Future<ComidaState> get(String categoria) async {
    List<Comida> comidas;
    try {
      var response = await comidasDatasource.get(categoria);
      List<dynamic> body = response["meals"];
      comidas = body.map((data) => ComidaAdapter.fromJson(data)).toList();
      return SuccessComidaState(comidas: comidas);
    } catch (e) {
      return const ErrorExceptionComidaState();
    }
  }
}
