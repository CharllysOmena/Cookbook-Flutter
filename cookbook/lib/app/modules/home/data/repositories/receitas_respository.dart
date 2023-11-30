import 'package:cookbook/app/modules/home/data/adapters/receitas_adapter.dart';
import 'package:cookbook/app/modules/home/data/datasources/receitas_datasource.dart';
import 'package:cookbook/app/modules/home/data/models/receita.dart';
import 'package:cookbook/app/modules/home/interactor/states/receita_state.dart';

abstract interface class IReceitasRepository {
  Future<ReceitaState> get(String id);
}

class ReceitasRepository implements IReceitasRepository {
  final IReceitasDatasource receitasDatasource;

  ReceitasRepository({required this.receitasDatasource});

  @override
  Future<ReceitaState> get(String id) async {
    List<Receita> receitas;
    try {
      var response = await receitasDatasource.get(id);
      List<dynamic> body = response["meals"];
      receitas = body.map((json) => ReceitaAdapter.fromJson(json)).toList();
      return SuccessReceitaState(receitas: receitas);
    } catch (e) {
      return const ErrorExceptionReceitaState();
    }
  }
}
